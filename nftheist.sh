BASEPATH=https://public.nftstatic.com

NFTPATHS=$(xpath -e ListBucketResult//Contents//Key 1000nfts | cut -d'>' -f 2 | cut -d'<' -f 1 | grep -v fant)

while IFS= read -r NFTLINES; do
	wget $(curl -s $BASEPATH/$NFTLINES | jq -r ".image");
done <<< $NFTPATHS
