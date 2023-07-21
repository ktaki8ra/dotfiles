function extract_lan_ip
    set lan_ip (ifconfig | grep 192.168 | awk '{print $2}' | head -n 1)
    if test "$status" -ne 0
        return
    else
        echo "$lan_ip"
    end
end
