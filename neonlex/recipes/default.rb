package 'tmux' do
  action :install
end

package 'zsh' do
  action :install
end

git node[:neonlex][:dotfiles][:directory] do
  repository 'https://github.com/neonlex/dotfiles.git'
  reference :master
  action :sync
end

execute 'install dotfiles' do
  command 'yes | rake install'
  cwd node[:neonlex][:dotfiles][:directory]
  action :run
end
