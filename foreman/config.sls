# -*- coding: utf-8 -*-
# vim: ft=sls
{% from "foreman/map.jinja" import foreman with context %}

foreman_proxy_salt_conf:
  file.managed:
    - name: /etc/foreman-proxy/settings.d/salt.yml
    - source: salt://foreman/files/foreman_proxy_salt.yml.j2
    - user: root
    - group: foreman-proxy
    - mode: 640
