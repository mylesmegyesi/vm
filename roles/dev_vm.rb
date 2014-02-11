require 'etc'

USERNAME  = 'mylesmegyesi'
USER_HOME = Etc.getpwnam(USERNAME).dir
ZSH_DIR   = File.join(USER_HOME, '.zsh')

name 'dev_vm'
run_list [
  'recipe[build-essential]',
  'recipe[mysql::client]',
  'recipe[mysql::server]',
  'recipe[git]',
  'recipe[chruby]',
  'recipe[ruby_build]',
  'recipe[zsh]',
  'recipe[tmux]',
  'recipe[vim_nox]',
  'recipe[dotfiles]',
  'recipe[clojure]',
]

default_attributes({
  :chruby => {
    :auto_switch => true,
    :default     => 'system',
    :sh_dir      => ZSH_DIR,
    :sh_name     => 'chruby.zsh',
    :sh_owner    => USERNAME
  },
  :clojure => {
    :drip_home => File.join(USER_HOME, '.bin'),
    :lein_home => File.join(USER_HOME, '.lein'),
    :username  => USERNAME,
    :user_home => USER_HOME
  },
  :dotfiles => {
    :user_home => USER_HOME,
    :username  => USERNAME
  },
  :mysql => {
    :client => {
      :packages => %w(mysql-client libmysqlclient-dev ruby-mysql)
    },
    :server_root_password   => '',
    :server_repl_password   => '',
    :server_debian_password => ''
  }
})
