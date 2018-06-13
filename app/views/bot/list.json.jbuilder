@answer = "Listado de reportes:\n"
for report in @reports do
    



    @answer += "Reporte número: #{report.id}\n"
    @answer += "\"#{report.text}\"\n\n"
end

if @reports[0].nil? 
    @answer += "No quedan reportes por revisar\n" 
end







json.method "sendMessage"
json.chat_id @chat_id
json.text @answer
