-- The canonical Markdown remains readable on GitHub. Present its leading
-- title/subtitle as publication metadata, and promote the section hierarchy.
function Pandoc(doc)
  if #doc.blocks > 0 and doc.blocks[1].t == 'Header'
      and doc.blocks[1].level == 1 then
    if not doc.meta.title then doc.meta.title = doc.blocks[1].content end
    table.remove(doc.blocks, 1)
    if #doc.blocks > 0 and doc.blocks[1].t == 'Header'
        and doc.blocks[1].level == 2 then
      if not doc.meta.subtitle then doc.meta.subtitle = doc.blocks[1].content end
      table.remove(doc.blocks, 1)
    end
  end
  -- Keep the closing paragraph intact before the acknowledgments.
  for i = #doc.blocks, 2, -1 do
    local b = doc.blocks[i]
    if b.t == 'Header' and pandoc.utils.stringify(b.content) == 'Translation acknowledgments'
        and doc.blocks[i-1].t == 'Para' then
      table.insert(doc.blocks, i, pandoc.RawBlock('latex', '\\end{samepage}'))
      table.insert(doc.blocks, i-1, pandoc.RawBlock('latex', '\\begin{samepage}'))
    end
  end
  -- A standalone bold paragraph is a verse label: keep it with its text.
  -- Remove source-space before note calls so markers cannot orphan on a line.
  doc = doc:walk({Inlines = function(xs)
    for i = #xs, 2, -1 do
      if xs[i].t == 'Note' and xs[i-1].t == 'Space' then
        table.remove(xs, i-1)
      end
    end
    return xs
  end, Para = function(p)
    if #p.content == 1 and p.content[1].t == 'Strong' then
      return {pandoc.RawBlock('latex', '\\needspace{5\\baselineskip}'), p}
    end
  end})
  return doc:walk({BlockQuote = function(b)
    return {pandoc.RawBlock('latex', '\\begin{samepage}'), b,
      pandoc.RawBlock('latex', '\\end{samepage}')}
  end, Header = function(h)
    h.level = math.max(1, h.level - 1)
    if pandoc.utils.stringify(h.content) == 'The words of the passage' then
      return {pandoc.RawBlock('latex', '\\needspace{9\\baselineskip}'), h}
    end
    if pandoc.utils.stringify(h.content) == 'Bibliography' then
      return {pandoc.RawBlock('latex', '\\clearpage'), h}
    end
    return h
  end, Div = function(d)
    if d.classes:includes('bibliography') then
      local result = d:walk({Para = function(p)
        table.insert(p.content, 1, pandoc.RawInline('latex', '\\hangindent=1.5em\\hangafter=1 '))
        return p
      end})
      table.insert(result.content, 1, pandoc.RawBlock('latex', '\\begingroup\\setstretch{1.04}\\setlength{\\parskip}{0.38em}'))
      table.insert(result.content, pandoc.RawBlock('latex', '\\endgroup'))
      return result
    end
  end})
end
