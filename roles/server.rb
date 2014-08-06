name "server"
description "basic server configuration"

run_list [
  "recipe[chef-client]",
  "recipe[apt]",
  "recipe[hostname]",
  "recipe[timezone-ii]",
  "recipe[ntp]",
  "recipe[locales]",
  "recipe[locale]",
  "recipe[limits]",
  "recipe[cron]",
  "recipe[logrotate]",

  "recipe[packages]",
  "recipe[users]",
  "recipe[backup]",
  "recipe[eita]",

  "recipe[git]",
  "recipe[mercurial]",
]

default_attributes({
  chef_client: {
  },
  ohai: {
    disabled_plugins: [
      ":GCE",
    ],
  },
  tz: "America/Sao_Paulo",
  ntp: {
    sync_clock: true,
    servers: [
      'a.ntp.br', 'b.ntp.br', 'c.ntp.br', 'pool.ntp.br',
    ],
    apparmor_enabled: false,
  },
  locales: {
    default: "pt_BR.UTF-8",
  },
  locale: {
    lang: "pt_BR.UTF-8",
    lc_all: "pt_BR.UTF-8",
  },
  limits: {
    system_limits: [
      {domain: "*", type: "-", item: "nice", value: "0"},
    ]
  },
  packages: ['htop'],
  backup: {
    user: "backup",
    group: "backup",
    config_path: "/home/backup",
    log_path: "/home/backup/log",
  },

  users: {
    create_list: [
      {
        id: "backup",
        shell: "/bin/bash",
        ssh_keys: [
          "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDbq0LXkcxNVwyXFi6TLmk/QckCBeF4IbOLtIz9A9pQOdvjtgTnP03zLA66FIcE9i5znOTNim86lel2dLA+5R5LZCnqmbgdgmD608DFylUf+oOKxz4P8Z2dSMoaxcakH4V27alQM0czvjxBZquLqtsfRNKYUFGe/O1SyRcVvWPaYjLbieZK5Zw1TI1KdmPPa4eTHBA0Dj6mj0YQvaUC4KGPEP//DLb0Rf1jUYXJgktQnYkdNPYxyR7nBFCGU9gNHz9U6QEZ8h3bKtiUK58ZsbsIAkGcHE7Lvaiy28FLGwypdKzFTwWAQ88FK6v3Sz+ARhdWdggRDVpEzDNr0lwrWyA7 eita"
        ],
      },
    ],
  },
  eita: {
    users: [
      {
        id: "backup",
        install_ssh_keys: ["eita"],
      },
    ],
  },

  mercurial: {
  },

  java: {
    install_flavor: "openjdk",
    jdk_version: "7",
  },

  nginx: {
    client_max_body_size: 0,
    keepalive_timeout: 20,
    default_site_enabled: false,
  },

  postfix: {
    main: {
      #maximal_queue_lifetime: "7d",
      #queue_run_delay: "15m",
    },
  },

  noosfero: {
    backup: {
      enable: true,
      to: {
        host: "bhakta.eita.org.br",
        port: 22,
        user: "backup",
      },
    },

    awstats: {
      enable: true,
    },
  },

})
