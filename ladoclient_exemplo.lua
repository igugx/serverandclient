local client = {}



local MAGIC_BYTES = "md:"

function sendToServer(content)
 -- envie o content para o server aqui
end

function client.sendToServer(content, successFunction, timeoutFunction)
	local id = math.random(0,100000) -- inseguro vc deve implementar seu proprio gerador de id que vai colocar um id unico ja que o random pode cair no mesmo valor...
	table.insert(client.orderedMessages, {
		id = id,
		successFunction = successFunction,
		timeoutFunction = timeoutFunction,
		elapsedtIME = 3
	})
	local gotoserver = MAGIC_BYTES .. json.encode({ -- vai formar algo como msgid:{ id:100, data:"blockshoot"}
	id = id,
	data = content
	})
sendToServer(gotoserver)
end

-- chame essa funçao quando receber uma mensagem vindo do client
function message(content) -- em string exemplo msgid:{id:100, data:"blockshoot"}
if content:sub(1, #MAGIC_BYTES) == MAGIC_BYTES then
local state, content = pcall(json.decode, content:sub(#MAGIC_BYTES+1) )
if state then -- evitar ruidos vindo do servidor
	local message_id = content.id
	local data = content.data
	for i,v in ipairs(client.orderedMessages) do
		if message_id == v.id then
			v.successFunction() -- essa ira invocar a funçao caso use uma engine como defold seja preferivei fazer o msg.post na url do gameobject..
			table.remove(client.orderedMessages, i)
		end
	end
end
end
end

function client.update(deltaTime) -- deve ser atualizada com uma certa frequencia.
for i,v in ipairs(client.orderedMessages) do
v.elapsedTime = v.elapsedTime - deltaTime
if ( v.elapsedTime < 0 ) then
	if v.timeoutFunction then
		v.timeoutFunction()
	end
	table.remove(client.orderedMessages, i)
end
end
end

