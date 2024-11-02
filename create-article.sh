#!/bin/bash

# 引数から記事のURLを取得
URL=$1

# 記事のURLが指定されているか確認
if [ -z "$URL" ]; then
  echo "記事のURLを指定してください。"
  exit 1
fi

# URLがアルファベットの小文字、半角数字と - のみ利用されていることを確認
if ! [[ "$URL" =~ ^[a-z0-9-]+$ ]]; then
  echo "記事のURLに無効な文字が含まれています。"
  exit 1
fi

echo "記事のURLはこちらで問題ありませんか：https://example.com/$URL"
read -p "Yes/No: " CONFIRMATION

if [[ "$CONFIRMATION" != "Yes" && "$CONFIRMATION" != "yes" ]]; then
  echo "操作がキャンセルされました。"
  exit 1
fi

# ディレクトリを作成
mkdir -p "./content/blog/$URL"

# ユーザからタイトルを取得
while true; do
  read -p "記事のタイトルを入力してください（40文字以内）: " TITLE
  if [ ${#TITLE} -le 40 ]; then
    break
  else
    echo "タイトルは40文字以内で入力してください。"
  fi
done

# ユーザから公開日時を取得
while true; do
  read -p "公開日時を入力してください（YYYY-MM-DD）: " DATE
  if [[ "$DATE" =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]]; then
    break
  else
    echo "公開日時はYYYY-MM-DD形式で入力してください。"
  fi
done

# ユーザからカテゴリを取得
while true; do
  read -p "カテゴリを入力してください（other, dev, life のいずれか）: " CATEGORY
  if [[ "$CATEGORY" == "other" || "$CATEGORY" == "dev" || "$CATEGORY" == "life" ]]; then
    break
  else
    echo "カテゴリは other, dev, life のいずれかで入力してください。"
  fi
done

# ユーザから description を取得
read -p "記事の説明を入力してください: " DESCRIPTION

# ユーザから絵文字を取得
read -p "記事の絵文字を入力してください: " EMOJI

# ディレクトリ内に index.md ファイルを作成
FILE_PATH="./content/blog/$URL/index.md"
cat <<EOL > "$FILE_PATH"
---
title: "$TITLE"
date: "$DATE"
category: "$CATEGORY"
description: "$DESCRIPTION"
emoji: "$EMOJI"
---

この記事はまだ書かれていません。
EOL

# 作成したファイルのパスを出力
echo "記事が作成されました: $FILE_PATH"
