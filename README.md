source repo: https://github.com/g0t4/consul-getting-started

on mac:

    vagrant up
    consul agent -config-file desky.local.json # to run `consul kv` etc

    open localhost:8500/ui
    open http://172.20.20.11/haproxy

to set values:

    curl -X PUT localhost:8500/v1/kv/prod/portal/haproxy/timeout-server -d 49s
    # or
    consul kv put prod/portal/haproxy/timeout-server 49s
