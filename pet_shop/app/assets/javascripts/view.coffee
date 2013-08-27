class window.View
  renderToElement: (id, output) ->
    el = document.getElementById(id)
    el.innerHTML = output

  imageTag: (filename, options={}) ->
    options.size ?= "original"
    if filename?
      sizedFilename = filename.replace /\.(jpg|png)$/, "-#{options.size}.$1"
      "<img src='assets/#{sizedFilename}' />"
    else
      ""
