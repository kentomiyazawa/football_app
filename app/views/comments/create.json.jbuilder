json.comment @comment.comment
json.user_name @comment.user.name
json.user @comment.user
json.created_at @comment.created_at.strftime("%Y-%m-%d %H:%M")
json.id @comment.id