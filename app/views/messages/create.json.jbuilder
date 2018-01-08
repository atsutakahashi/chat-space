json.name @message.user.name
json.time @message.created_at.strftime("%Y-%m-%d %H:%M:%S")
json.image @message.image.to_s
json.body @message.body