onRequest= (request, sender, sendResponse)->
  chrome.pageAction.show sender.tab.id
  sendResponse({})
onPageActionClicked= (tab)->
  chrome.tabs.sendRequest tab.id, 
    {
      action: "toggleReader",
    }
  console.log(tab.id)

chrome.extension.onRequest.addListener onRequest
chrome.pageAction.onClicked.addListener(onPageActionClicked);