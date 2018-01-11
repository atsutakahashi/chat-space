json.messages @new_messages.each do |message|
  json.name message.user.name
  json.time message.created_at.strftime("%Y/%M/%d %H:%M:%S")
  json.image message.image.to_s
  json.body message.body
  json.id message.id
end
