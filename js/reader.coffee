bodyHtml = document.body.innerHTML;
targetDiv= null
paragraphs = document.querySelectorAll("p");
analysisParagraphs = ->
  analysic paragraph for paragraph in paragraphs
analysic = (p) ->
  # console.log p;
  parentEl = p.parentNode;
  if not parentEl.easyreading
    parentEl.easyreading=
      score : 0

    if parentEl.className.match ///(
        comment|meta|footer|footnote
      )///
      parentEl.easyreading.score -=50
    else
      if parentEl.className.match ///(
          (^|\\s)
          (
            post | hentry | entry[-]? 
            (content|text|body)?
            |article[-]? 
            (content|text|body)?
          )
          (\\s|$)
        )///
        parentEl.easyreading.score +=25

    if parentEl.id.match ///(
        comment|meta|footer|footnote
      )///
      parentEl.easyreading.score -=50
    else
      if parentEl.id.match ///(
          (^|\\s)
          (
            post | hentry | entry[-]? 
            (content|text|body)?
            |article[-]? 
            (content|text|body)?
          )
          (\\s|$)
        )///
        parentEl.easyreading.score +=25
  if parentEl.innerText.length > 10
    parentEl.easyreading.score++

  parentEl.easyreading.score+= parentEl.innerText.split(",").length
  parentEl.easyreading.score+= parentEl.innerText.split("，").length

analysisParagraphs()
nodeIndex = 0
titleEl = []
while (node = document.getElementsByTagName('*')[nodeIndex])? 
  # console.log node.easyreading
  if node.className.match(/(title)/) or node.id.match(/(title)/)  or node.tagName.match ///
      ( H1 | H2 | H3 | H4 | H5 | H6 )
    ///
    titleEl.push node


  # and (not targetDiv? or (node.easyreading.score > targetDiv.easyreading.score ) 
  if node.easyreading?
    if not targetDiv? or node.easyreading.score > targetDiv.easyreading.score
      targetDiv = node
  nodeIndex++
console.log targetDiv

analysicTitle= (t)->
  if head = t.tagName.match /H(\d)/
    if not head.titlescore
      head.titlescore
