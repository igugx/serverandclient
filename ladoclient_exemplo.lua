local server = {}
local json = require "json"

server.orderedMessages = {}



function sendToServer(content)
  -- fazer a implementaçao de enviar pro seu server
end

function server.sendToServer(token, content, successFunction, timeoutFunction)
  local id = math.random(0,100000) -- inseguro vc deve implementar seu proprio gerador de id que vai colocar um id unico ja que o random pode cair no mesmo valor...
  table.insert(server.orderedMessages, {
      id = id,
      successFunction = successFUnction,
      timeoutFunction = timeoutFUnction,
      elapsedtIME = 3
   }
   local gotoserver = "msgid:"..json.encode({ -- vai formar algo como msgid:{ id:100, data:"blockshoot"}
        id = id,
        data = content
   })
   sendToServer(gotoserver)
end

 -- chame essa funçao quando receber uma mensagem vindo do server
function message(content) -- em string exemplo msgid:{id:100, data:"blockshoot"}
    if content:sub(1,6) == "msgid:"then
      local content = pcall(json.decode, content:sub(7) )
      if content then -- evitar ruidos vindo do servidor
        local message_id = content.id
        local data = content.data
        for i,v in ipairs(server.orderedMessages) then
          if message_id == v.id then
            v.successFunction() -- essa ira invocar a funçao caso use uma engine como defold seja preferivei fazer o msg.post na url do gameobject..
            table.remove(server.orderedMessages, i)
          end
        end
      end
    end
end

function server.update(deltaTime) -- deve ser atualizada com uma certa frequencia.
    for i,v in ipairs(server.orderedMessages) do
      v.elapsedTime = t.elapsedTime - deltaTime
      if ( v.elapsedTime < 0 ) then
        if v.timeoutFunction then
          v.timeoutFunction()
        end
        table.remove(server.orderedMessages, i)
      end
    end
end


return server
