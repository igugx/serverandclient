local server = {}

server.orderedMessages = {}




function server.sendToServer(token, cotent, successFunction, timeoutFunction)
  table.insert(server.orderedMessages, { id = math.random(0,100000000000), successFunction = successFUnction, timeoutFunction = timeoutFUnction }
end
