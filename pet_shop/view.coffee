class window.View
  renderToElement: (id, output) ->
    el = document.getElementById(id)
    el.innerHTML = output

  imageTag: (filename) ->
    if filename?
      "<img src='images/#{filename}' />"
    else
      ""
