# Ansible Kapacitor

[![Ansible Galaxy](https://img.shields.io/badge/ansible--galaxy-influxdata.kapacitor-blue.svg)](https://galaxy.ansible.com/influxdata/kapacitor/)

Configuration management and change automation for Kapacitor on Linux.

This role will:
* Install Kapacitor
* Generate and install configs
* Manage the Kapacitor service
* Upload any TICK scripts specified
* Manage any defined tasks

## Installation

`$ ansible-galaxy install influxdata.kapacitor`

## Usage

Example playbook usage:

```
- hosts: 'kapacitor'
  become: true
  roles:
      - 'kapacitor'
  vars:
    kapacitor_config_influx:
      - name: "production01"
        enabled: true
        default: true
        urls: ["https://influxdb.production01.megacorp.com:443"]
        username: "username"
        password: "password"
        ssl-ca: ""
        ssl-cert: ""
        ssl-key: ""
        insecure-skip-verify: false
        timeout: "0s"
        disable-subscriptions: false
        subscription-protocol: "http"
        subscription-mode: "cluster"
        kapacitor-hostname: "{{ ansible_hostname }}"
        http-port: 0
        udp-bind: ""
        udp-buffer: 1000
        udp-read-buffer: 0
        startup-timeout: "5m0s"
        subscriptions-sync-interval: "1m0s"
    kapacitor_http_shared_secret: "topsecretsuperlong"
    kapacitor_tick_script_dir: '../../shared/files/tick'
    kapacitor_slack_enabled: true
    kapacitor_slack_url: "https://hooks.slack.com/services/XXX/ZZZ/SECRET"
    kapacitor_slack_channel: '#monitoring'
    kapacitor_slack_global: false
    kapacitor_slack_state_changes_only: false
```

See the `test/integration/ansible` for examples.

## Contributing

Clone this repository, hack and run tests with Kitchen. Then send us a pull-request!

```
$ bundle install
$ kitchen test
```
