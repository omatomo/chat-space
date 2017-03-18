json.set! :body, @message.body
json.set! :name, @message.user.name
json.set! :time, @message.created_at.strftime("%Y/%m/%d %X")