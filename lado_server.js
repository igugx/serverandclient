// chame essa funçao para cada mensagem enviada pelos clients
const MAGIC_BYTES = "md:"
function decodeData(data) // em string example msgid:{id:100, data:"blockshoot"} // retorna o id e o conteudo
{
    if (data.startsWith(MAGIC_BYTES)) {
    try {
      let content = JSON.parse( data.substring( MAGIC_BYTES.length ))
      let id = content.id || ""
      let message = content.data || ""
      return { id :id, message: message}
      // aqui oque deseja fazer com o conteudo que esta na variavel message
    }catch(err){ // evitar ruidos
      // retorna nada :)
      console.log(err)
    }
  }
  
}


function encodeData(_id, _data) // retorna o buffer json prontinho para ser mandando devolta para o client ou nil 
{
  try {
    let tok = MAGIC_BYTES+JSON.stringify( { id : _id, data: _data })//  em string example msgid:{id:100, data:"receivedshoot"}
    return tok // send para enviar devolta ao seu client.
  }catch{ // evitar ruidos
  }
}


const obj = {
    encode: encodeData,
    decode:decodeData
}



module.exports = obj
