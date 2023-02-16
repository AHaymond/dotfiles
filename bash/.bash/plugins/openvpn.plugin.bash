function openvpn_switch() {
  local vpns=("tm" "tap")
  current=$(ps aux | grep "/usr/bin/[o]penvpn" | awk '{print $(NF)}' | cut -f1 -d'.')

  if [ "$1" = "quit" ] && [ -n "$current" ]; then
    sudo systemctl stop openvpn-client@$current
    sleep 3
    resolver=$(tail -n-1 /etc/resolv.conf | awk '{print $2}')
    echo -e "Disconnected from VPN\ndns resolver: $resolver"
  else
    if [ -z "$current" ]; then
      echo "Not currently connected to a VPN"
      read -p "Start? (tap/tm): " vpnvar
    else
      echo "Currently connected to: $current"
      read -p "Switch to? (tap/tm): " vpnvar
    fi

    echo "VPN Selected: $vpnvar"

    if [[ ! "${vpns[*]}" =~ "${vpnvar}" ]]; then
      echo "ERROR: unknown vpn: $vpnvar"
    elif [ "$current" != "$vpnvar" ]; then
      if [ -n "$current" ]; then
        sudo systemctl stop openvpn-client@$current
      fi
      sudo systemctl start openvpn-client@$vpnvar
      sleep 3
      resolver=$(tail -n-1 /etc/resolv.conf | awk '{print $2}')
      echo -e "Now connected to $vpnvar vpn\ndns resolver: $resolver"
    else
      echo "Already connected to $current vpn, nothing to do."
    fi
  fi
}
