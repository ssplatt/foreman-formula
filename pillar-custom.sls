# -*- coding: utf-8 -*-
# vim: ft=yaml
# Custom Pillar Data for foreman

foreman:
  enabled: True
  installer_options:
    - "--enable-foreman-plugin-salt"
    - "--enable-foreman-proxy-plugin-salt"
  smartproxy:
    enabled: true
  service:
    name: foreman
    state: running
    enable: true
  proxy:
    service:
      name: foreman-proxy
      state: running
      enable: true
