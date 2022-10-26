// chame essa funçao para cada mensagem enviada pelos clients
function receiveMessageWithId(data) // em string example msgid:{id:100, data:"blockshoot"}
{

  if (data.startsWith("msgid:")) {
    try {
      let content = JSON.stringify( data.substring(content, 6) )
      let id = content.id || ""
      let message = content.data || ""
      
      // aqui oque deseja fazer com o conteudo que esta na variavel message
    }catch{ // evitar ruidos
      
    }
  }
}


function sendMessageWithId(socket, id, data)
{
  try {
    let tok = "msgid:"+JSON.parse( { id : id, data:data })//  em string example msgid:{id:100, data:"receivedshoot"}
    socket.send(tok) // send para enviar devolta ao seu client.
  }catch{
    
  }
}
