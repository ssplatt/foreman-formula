# -*- coding: utf-8 -*-
# vim: ft=sls
{% from "foreman/map.jinja" import foreman with context %}
# these settings should be run on salt masters and/or syndics

# foreman-proxy user to run salt and salt-key
foreman_smartproxy_sudoers_settings:
  file.managed:
    - name: /etc/sudoers.d/99_foreman-salt
    - source: salt://foreman/files/proxy_sudoers.j2
    - template: jinja
    - user: root
    - group: root
    - mode: 640
    #- check_cmd: /usr/sbin/visudo -c -f
    # broken in 2017.7.0, kitchen-salt 0.0.27
    # https://github.com/saltstack/salt/issues/21774

# allow foreman-proxy user to add minions to salt
foreman_smartproxy_salt_autosign:
  file.managed:
    - name: /etc/salt/autosign.conf
    - user: root
    - group: foreman-proxy
    - mode: 660
    - replace: false

foreman_smartproxy_salt_foreman_conf:
  file.managed:
    - name: /etc/salt/foreman.yml
    - source: salt://foreman/files/salt-foreman.yml.j2
    - user: root
    - group: root
