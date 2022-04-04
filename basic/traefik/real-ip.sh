#!/bin/bash

# install k3s
curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="--disable servicelb" sh -
kubectl patch svc traefik --patch '{"spec":{"externalIPs":["192.168.3.10"]}}' -n kube-system
kubectl patch deployment traefik --patch '{"spec":{"template":{"spec":{"hostNetwork":true}}}}' -n kube-system
