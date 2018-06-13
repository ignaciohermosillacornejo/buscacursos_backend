@answer = "Reporte número: #{@report.id}\n"
@answer += "\"#{@report.text}\"\n"
@answer += "hecho por: #{@report.user.first_name.titleize} #{@report.user.last_name.titleize} \n"
@answer += "Review: \"#{@report.review.content}\" \n"
@answer += "Este review tiene #{@report.review.reports.length - 1} reportes más \n"
#for report in @reports do
#    @answer += "Reporte número: #{report.id}\n"
#    @answer += "\"#{report.text}\"\n\n"
#end


json.method "sendMessage"
json.chat_id @chat_id
json.text @answer
