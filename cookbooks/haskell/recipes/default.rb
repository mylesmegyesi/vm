package 'haskell-platform'

execute "apt-get-update" do
  command "cabal update"
end

execute "install cabal-dev" do
  command "cabal install cabal-dev"
end

zsh_file 'haskell'
