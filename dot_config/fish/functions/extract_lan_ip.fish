function extract_lan_ip
    set lan_ip (ifconfig | grep -E '192.168.10.|192.0.1.' | awk '{print $2}' | head -n 1)
    set vpn_ip (ifconfig -a | grep "\-\->" | awk '{print $2}' | head -n 1)
    if test -n "$lan_ip"
        if test -n "$vpn_ip"
            echo "$lan_ip#$vpn_ip"(set_color normal)'('(set_color green)'vpn'(set_color normal)')'
        else
            echo "$lan_ip"
        end
    else
        echo "no_lan"
    end
end
