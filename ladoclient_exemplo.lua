local server = {}
local json = require "json"

server.orderedMessages = {}




function server.sendToServer(token, cotent, successFunction, timeoutFunction)
  table.insert(server.orderedMessages, {
      id = math.random(0,10000),
      successFunction = successFUnction,
      timeoutFunction = timeoutFUnction,
      elapsedtIME = 3
    }
end

  
function message(content) -- em string exemplo msgid:{id:100, data:"blockshoot"}
    if content:sub(1,6) == "msgid:"then
      local content = json.decode(content:sub(7))
      local message_id = content.id
      local data = content.data
      for i,v in ipairs(server.orderedMessages) then
        if message_id == v.id then
          v.successFunction()
          table.remove(server.orderedMessages, i)
        end
      end
    end
end

function server.update(deltaTime)
    for i,v in ipairs(server.orderedMessages) do
      v.elapsedTime = t.elapsedTime - deltaTime
      if ( v.elapsedTime < 0 ) then
        v.timeoutFunction()
        table.remove(server.orderedMessages, i)
      end
    end
end
