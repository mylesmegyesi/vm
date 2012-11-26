package 'haskell-platform'

user_bash 'install cabal-dev' do
  code "cabal install cabal-dev"
end

zsh_file 'haskell'
