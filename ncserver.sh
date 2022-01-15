#SPOTIFY64=`echo -n $SPOTIFYCLID:$SPOTIFYCLSEC | base64 -w 0`

#SPOTIFY=`curl -X "POST" -H "Authorization: Basic $SPOTIFY64" -d grant_type=client_credentials  -d scope=user-read-currently-playing -d username=earentir "https://accounts.spotify.com/api/token" | jq -r ".access_token"`

source /mnt/c/Users/Earentir/Documents/Projects/tmp/tokens.txt

while true; 
do JSON=$(curl -s -X "GET" "https://api.spotify.com/v1/me/player/currently-playing" -H "Accept: application/json" -H "Content-Type: application/json" -H "Authorization: Bearer $SPOTIFY");

ARTIST=$(echo $JSON | jq -r '.item.artists[0].name');
ALBUM=$(echo $JSON | jq -r '.item.album.name');
SONG=$(echo $JSON | jq -r '.item.name');
printf 'HTTP/1.1 200 OK\n\n%s' "<html><head><meta http-equiv="refresh" content="30"> </head><div>$ARTIST - $ALBUM <br/> $SONG</div></html>" | nc -l 8090 -w 1;
done
