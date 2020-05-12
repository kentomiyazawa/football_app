json.text @blogcomment.text
json.user_name @blogcomment.user.name
json.user @blogcomment.user
json.created_at @blogcomment.created_at.strftime("%Y年%m月%d日")
json.id @blogcomment.id