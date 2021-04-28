function get_iplayer --description "Download videos from BBC iPlayer"
  docker run --rm \
    --mount type=bind,src=(pwd),dst=/data/output \
    --mount type=volume,src=get_iplayer_cache,dst=/data/config \
    barwell/get-iplayer $argv
end
