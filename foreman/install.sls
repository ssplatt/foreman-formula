# -*- coding: utf-8 -*-
# vim: ft=sls
# How to install foreman
{% from "foreman/map.jinja" import foreman with context %}

foreman_pkg:
  pkg.installed:
    - name: {{ foreman.pkg }}

foreman_run_installer:
  cmd.wait:
    - name: foreman-installer {{ foreman.installer_options|join(" ") }}
    - watch:
      - pkg: foreman_pkg
