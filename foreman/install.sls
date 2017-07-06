# -*- coding: utf-8 -*-
# vim: ft=sls
# How to install foreman
{%- from "foreman/map.jinja" import foreman with context %}

{% if foreman.repos_managed %}
  {% for repo in foreman.repos %}
foreman_repos_{{ repo.humanname }}:
  pkgrepo.managed:
    - humanname: {{ repo.humanname }}
    - name: {{ repo.name }}
    - file: /etc/apt/sources.list.d/{{ repo.file }}
    - key_url: {{ repo.key_url }}
  {% endfor %}
{% endif %}

{% if foreman.mockup %}
foreman_set_hostname:
  network.system:
    - enabled: True
    - hostname: localhost.local
    - apply_hostname: True
    - require_reboot: True

foreman_install_saltmaster:
  pkg.installed:
    - name: salt-master
{% endif %}

foreman_pkg:
  pkg.installed:
    - name: {{ foreman.pkg }}

foreman_run_installer:
  cmd.wait:
    - name: foreman-installer {{ foreman.installer_options|join(" ") }}
    - watch:
      - pkg: foreman_pkg
