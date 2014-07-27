name "server"
description "basic server configuration"

run_list [
  "recipe[hostname]",
  "recipe[locales]",
  "recipe[locale]",
  "recipe[timezone-ii]",
  "recipe[limits]",
  "recipe[backup]",
  "recipe[apt]",
]

default_attributes({
  "tz" => "America/Sao_Paulo",
  "locales" => {
    "default" => "pt_BR.UTF-8",
  },
  "locale" => {
    "lang" => "pt_BR.UTF-8",
    "lc_all" => "pt_BR.UTF-8",
  },
  "limits" => {
    "system_limits" => [
      {"domain" => "*", "type" => "-", "item" => "nice", "value" => "0"},
    ]
  },
  "backup" => {
    "user" => "backup",
    "group" => "backup",
    "config_path" => "/home/backup",
    "log_path" => "/home/backup/log",
  },
})
