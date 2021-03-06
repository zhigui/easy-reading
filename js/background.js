// Generated by CoffeeScript 1.6.3
var onPageActionClicked, onRequest;

onRequest = function(request, sender, sendResponse) {
  chrome.pageAction.show(sender.tab.id);
  return sendResponse({});
};

onPageActionClicked = function(tab) {
  chrome.tabs.sendRequest(tab.id, {
    action: "toggleReader"
  });
  return console.log(tab.id);
};

chrome.extension.onRequest.addListener(onRequest);

chrome.pageAction.onClicked.addListener(onPageActionClicked);
