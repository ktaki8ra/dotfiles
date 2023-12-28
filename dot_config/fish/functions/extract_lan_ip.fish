function extract_lan_ip
    set lan_ip (ifconfig | grep 192. | awk '{print $2}' | head -n 1)
    if test -n "$lan_ip"
        echo "$lan_ip"
    else
        echo "no_lan"
    end
end
