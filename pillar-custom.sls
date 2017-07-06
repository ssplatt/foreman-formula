# -*- coding: utf-8 -*-
# vim: ft=yaml
# Custom Pillar Data for foreman

foreman:
  enabled: True
  pkg: foreman-installer
  repos_managed: True
  mockup: true
  repos:
    - humanname: The Foreman
      file: foreman.list
      name: deb http://deb.theforeman.org/ jessie stable
      key_url: http://deb.theforeman.org/pubkey.gpg
    - humanname: The Forman plugins
      file: foreman.list
      name: deb http://deb.theforeman.org/ plugins stable
      key_url: http://deb.theforeman.org/pubkey.gpg
  installer_options:
    - "--enable-foreman-plugin-salt"
    - "--enable-foreman-proxy-plugin-salt"
  service:
    name: foreman
    state: running
    enable: true
  proxy:
    service:
      name: foreman-proxy
      state: running
      enable: true
