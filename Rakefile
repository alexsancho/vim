require 'rake'
verbose false

#########################################
# Default task
#########################################
task :default => [ 'vim:init' ]
task :bootstrap => [	
	'pathogen:install', 
	'pathogen:helptags', 
	'vim:init', 
	'vim:update', 
]

namespace :pathogen do

	desc "Install pathogen plugin"
	task :install do
		system "mkdir -p ~/.vim/autoload ~/.vim/bundle"
		system "curl -so ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/HEAD/autoload/pathogen.vim"
	end

	desc "Re-build the helptags for all pathogen-installed plugins."
	task :helptags do
		system(%Q{vim -c "call pathogen#helptags()" -c "qa"})
	end

end

namespace :vim do

	desc "initialize vim plugins"
	task :init do
		puts "Initializing all submodules."

		system("cd ~/.vim && git submodule init && git submodule update")
	end

	desc "update vim plugins"
	task :update do
		puts "Updating all vim plugins to latest versions from github"
		system("cd ~/.vim && git submodule foreach git pull origin master")
	end

end