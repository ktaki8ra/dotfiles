function extract_lan_ip
    set iface (ifconfig | awk '/flags/ {iface=$1} /status: active/ {print iface; exit}' | sed 's/://')
    if test -n "$iface"
        set lan_ip (ifconfig "$iface" | grep "inet " | awk '{print $2}')
    else
        set lan_ip "no_lan"
    end
    printf "$lan_ip"
    set vpn_ip (ifconfig -a | grep "\-\->" | awk '{print $2}' | head -n 1)
    if test -n "$vpn_ip"
        printf "#$vpn_ip"(set_color normal)'('(set_color green)'vpn'(set_color normal)')'
    end
end
