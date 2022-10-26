// chame essa funçao para cada mensagem enviada pelos clients
function decodeData(data) // em string example msgid:{id:100, data:"blockshoot"} // retorna o id e o conteudo
{
  if (data.startsWith("msgid:")) {
    try {
      let content = JSON.stringify( data.substring(content, 6) )
      let id = content.id || ""
      let message = content.data || ""
      return id, message
      // aqui oque deseja fazer com o conteudo que esta na variavel message
    }catch{ // evitar ruidos
      // retorna nada :)
    }
  }
}


function encodeData(socket, id, data) // retorna o buffer json prontinho para ser mandando devolta para o client ou nil 
{
  try {
    let tok = "msgid:"+JSON.parse( { id : id, data:data })//  em string example msgid:{id:100, data:"receivedshoot"}
    return tok // send para enviar devolta ao seu client.
  }catch{ // evitar ruidos
  }
}
