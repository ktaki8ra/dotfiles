function extract_lan_ip
    set lan_ip (ifconfig | grep -E '192.168.10.|192.0.1.' | awk '{print $2}' | head -n 1)
    if test -n "$lan_ip"
        echo "$lan_ip"
    else
        echo "no_lan"
    end
end
