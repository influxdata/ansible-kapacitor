# Ansible Kapacitor

Configuration management and change automation for Kapacitor on Linux.

This role will:
    - Install Kapacitor
    - Generate and install configs
    - Manage the Kapacitor service
    - Upload any TICK scripts specified
    - Manage any defined tasks

## Usage

Example playbook usage:

```
- hosts: 'kapacitor'
  roles:
      - 'kapacitor'
  vars:
    kapacitor_http_shared_secret: "topsecretsuperlong"
    kapacitor_tick_src_dir: '../../shared/files/tick'
    kapacitor_component_config:
      http:
        bind-address: ":9092"
        auth-enabled: false
        log-enabled: false
        write-tracing: false
        pprof-enabled: true
        https-enabled: false
        https-certificate: "/etc/ssl/kapacitor.pem"
        shutdown-timeout: "10s"
        shared-secret: ""
      logging:
        file: "/var/log/kapacitor/kapacitor.log"
        level: "WARN"
      config-override:
        enabled: false
      reporting:
        enabled: true
        url: "https://usage.influxdata.com"
      stats:
        enabled: true
        stats-interval: "10s"
        database: "_kapacitor"
        retention-policy: "autogen"
        timing-sample-rate: 0.1
        timing-movavg-size: 1000
      '[influxdb]':
        enabled: true
        name: "{{ site_environment }}"
        default: true
        urls: ["https://example.com:443"]
        username: ""
        password: ""
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
      slack:
        enabled: true
        url: "https://hooks.slack.com/services/xxx"
        channel: '#monitoring'
        global: false
        state-changes-only: false

```

See the `test/integration/ansible` for examples.

## Contributing

Clone this repository, hack and run tests with Kitchen. Then send us a pull-request!

```
$ bundle install
$ kitchen test
```
