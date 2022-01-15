JSON=$(twitch.exe api get goals?broadcaster_id=28355632)
CUR=$(echo $JSON | jq -r ".data[0].current_amount")
TARGET=$(echo $JSON | jq -r ".data[0].target_amount")

GOAL="<html><head><meta http-equiv="refresh" content="60"></head><div>$CUR/$TARGET</div></html>"

while true; do
printf 'HTTP/1.1 200 OK\n\n%s' "<html><head><meta http-equiv="refresh" content="30"> </head><div>$GOAL</div></html>" | nc -l 8091 -w 1;
done
