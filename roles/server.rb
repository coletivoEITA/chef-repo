name "server"
description "basic server configuration"

run_list [
  "recipe[chef-client]",
  "recipe[chef-client::config]",
  "recipe[apt]",
  "recipe[hostname]",
  "recipe[timezone-ii]",
  "recipe[ntp]",
  "recipe[locales]",
  "recipe[limits]",
  "recipe[cron]",
  "recipe[logrotate]",

  "recipe[packages]",
  "recipe[users]",
  "recipe[backup]",

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
    #sync_clock: true,
    servers: [
      'a.ntp.br', 'b.ntp.br', 'c.ntp.br', 'pool.ntp.br',
    ],
    apparmor_enabled: false,
  },
  locales: {
    default: "pt_BR.UTF-8",
    available: ["pt_BR.UTF-8", "en_US.UTF-8"],
    # workaround for https://github.com/hw-cookbooks/locale/issues/13
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
      #FIXME: don't work, block emails
      #smtpd_recipient_restrictions: "permit_mynetworks",
    },
  },

  mysql: {
    tunable: {
      key_buffer: '64M',
    },
  },

  postgresql: {
    config: {
      shared_buffers: "128MB",
      effective_cache_size: "512MB",
      datestyle: "iso, dmy",
      lc_messages: "pt_BR.UTF-8",
      lc_monetary: "pt_BR.UTF-8",
      lc_numeric: "pt_BR.UTF-8",
      lc_time: "pt_BR.UTF-8",
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


