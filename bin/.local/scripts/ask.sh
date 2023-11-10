#!/usr/bin/sh

tokens=${2:-256}

command=`cat <<EOS
curl -s https://api.openai.com/v1/chat/completions \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $OPENAI_API_KEY" \
  -d '{
  "model": "gpt-3.5-turbo",
  "messages": [
    {
      "role": "user",
      "content": "$1"
    }
  ],
  "temperature": 1,
  "max_tokens": $tokens,
  "top_p": 1,
  "frequency_penalty": 0,
  "presence_penalty": 0
}' | jq '.choices[]'.message.content
EOS`

echo "\nInput Message": "$1"
echo "\nOutput Message:" 
echo "$(eval ${command} 2>/dev/null)"

#DEST="$HOME/learn/netsec/nyu/material"
#echo "\nInput Message": "$1" >> $DEST/ask.md
#echo "$(eval ${command})" >> $DEST/ask.md
#pandoc --from markdown+hard_line_breaks -V geometry:margin=1in -o $DEST/ask.pdf $DEST/ask.md
#wslview ./learn/netsec/nyu/material/lec7.pdf
