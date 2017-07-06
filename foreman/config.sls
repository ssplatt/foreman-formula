# -*- coding: utf-8 -*-
# vim: ft=sls
# How to configure foreman
{%- from "foreman/map.jinja" import foreman with context %}

foreman_sudoers_settings:
  file.managed:
    - name: /etc/sudoers.d/00_foreman-salt
    - source: salt://foreman/files/sudoers.j2
    - template: jinja
    - user: root
    - group: root
    - mode: 440
    - check_cmd: /usr/sbin/visudo -c -f
    
{% if foreman.mockup %}
foreman_salt_api_user:
  user.present:
    - name: saltuser
    - password: "$6$axpWTBXo$IOCQ6EwwB6nn1t/4cINNBssv.RPghw2Fhy3BM.b0FRbVjS6d3sjN9eQgINu.Eg8PwkDyYrfZ9wpK2DzZToSNN/"

foreman_saltmaster_settings:
  file.managed:
    - name: /etc/salt/master
    - source: salt://foreman/files/salt-master-conf.j2
    - user: root
    - group: root
    - mode: 644
{% endif %}

foreman_salt_autosign:
  file.managed:
    - name: /etc/salt/autosign.conf
    - user: root
    - group: foreman-proxy
    - mode: 660

foreman_proxy_salt_conf:
  file.managed:
    - name: /etc/foreman-proxy/settings.d/salt.yml
    - source: salt://foreman/files/foreman_proxy_salt.yml.j2
    - user: root
    - group: foreman-proxy
    - mode: 640
