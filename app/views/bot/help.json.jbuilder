json.method "sendMessage"
json.chat_id @chat_id
json.text "
Existo para manejar los comentarios reportados de telegram

/list lista todos los reportes que no estan solucionados
/get id obtiene toda la información de un review y sus reportes
/reject id rechaza el review de una persona y la baja
/accept id acepta el review de una persona y la deja
"
