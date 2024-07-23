#!/bin/bash

# Altere os IP de acordo com a sua rede.
# Altere o nome da rede para um nome que faça sentido para você.
# o parent é a interface de rede que você deseja usar.

docker network create -d ipvlan \
  --subnet=192.168.0.0/24 \
  --gateway=192.168.0.1 \
  -o parent=wlp2s0 \
  my_ipvlan_wifi_network 