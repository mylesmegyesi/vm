
cache_path  = Chef::Config['file_cache_path']
dotfiles_dir    = "#{cache_path}/mm-dotfiles"

directory dotfiles_dir do
  recursive true
end

git dotfiles_dir do
  repository 'https://github.com/mylesmegyesi/dotfiles.git'
  action :sync
  enable_submodules true
end

bash 'Install the dotfiles' do
  code "#{File.join(dotfiles_dir, 'install.rb')} #{node['dotfiles']['user_home']} #{node['dotfiles']['username']}"
end
