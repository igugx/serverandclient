// chame essa funçao para cada mensagem enviada pelos clients
const MAGIC_BYTES = "\88\11"
function decodeData(data) // em string example msgid:{id:100, data:"blockshoot"} // retorna o id e o conteudo
{
  if (data.startsWith(MAGIC_BYTES)) {
    try {
      let content = JSON.stringify( data.substring( content, MAGIC_BYTES.length ))
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
    let tok = MAGIC_BYTES+JSON.parse( { id : id, data:data })//  em string example msgid:{id:100, data:"receivedshoot"}
    return tok // send para enviar devolta ao seu client.
  }catch{ // evitar ruidos
  }
}
