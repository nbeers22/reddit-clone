json.array!(@replies) do |reply|
  json.extract! reply, :id, :body, :user_id, :link_id, :comment_id
  json.url reply_url(reply, format: :json)
end
