#!/bin/bash
date=$(date)
echo -n "Push Message： "
read  message

if [ "$message"x != ""x ];then
	message="$message;　"
fi

git pull origin main:main
git add -A
git commit -m "${message}${USER} 更新于 ${date}."
git push --force

echo "更新并推送成功！"
exit 0;

