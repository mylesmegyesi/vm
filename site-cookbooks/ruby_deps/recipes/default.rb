
(node['ruby_build']['install_pkgs_jruby'] + node['ruby_build']['install_pkgs_cruby']).each do |pkg|
  package pkg do
    action :install
  end
end
