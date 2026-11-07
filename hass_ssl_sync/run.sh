#!/command/with-contenv bashio

sync_file() {
    local source="$1"
    local target="$2"

    if ! cmp -s "${source}" "${target}"; then
        cp "${source}" "${target}" && bashio::log.info "Updated ${target}"
    fi
}

bashio::log.info "Starting SSL certificate sync"

sync_file /homeassistant/.cloud/remote_private.pem /ssl/remote_private.pem
sync_file /homeassistant/.cloud/remote_fullchain.pem /ssl/remote_fullchain.pem

bashio::log.info "Finished SSL certificate sync"
