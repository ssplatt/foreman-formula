# -*- coding: utf-8 -*-
# vim: ft=sls
# Manage service for service foreman
{%- from "foreman/map.jinja" import foreman with context %}

foreman_service:
 service.{{ foreman.service.state }}:
   - name: {{ foreman.service.name }}
   - enable: {{ foreman.service.enable }}
   - watch:
     - service: foreman_proxy_service

foreman_proxy_service:
  service.{{ foreman.proxy.service.state }}:
    - name: {{ foreman.proxy.service.name }}
    - enable: {{ foreman.proxy.service.enable }}
    - watch:
      - file: foreman_proxy_salt_conf
