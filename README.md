# Ruby on Rails i18n Bundle #

Originally by [Ryan Stout](http://www.agileproductions.com/); extended by Isaac Sparling & Geoff Hichborn & Dariusz Gertych.

MyGengo & Google Translate support stripped out by [Carlo Zottmann](http://github.com/carlo/).


## About ##

I did fine another Rails bundle that had i18n helpers, but none of them worked how I wanted them to, so I started over.

To make things easy, everything is based on using a default locale (english by default, which can be changed in Support/lib/config.rb)  It also assumes the location of the english file is config/locales/en.yml

Read more about Rails' i18n here: http://guides.rubyonrails.org/i18n.html


## Requirements ##

This bundle requires the `ya2yaml` gem.

	sudo gem install ya2yaml
	
It should work with ruby 1.8.7 or 1.9.


## Install ##
To Install:

	mkdir -p ~/Library/Application\ Support/TextMate/Bundles
	cd ~/Library/Application\ Support/TextMate/Bundles
	git clone git://github.com/carlo/rails_i18n.tmbundle.git "Ruby on Rails i18n.tmbundle"
	osascript -e 'tell app "TextMate" to reload bundles'


### Add to locale ###

Select a section of text and hit CMD+SHIFT+I, this will then ask you for the token that identifies this string.  By default the bundle will build create token according to the position of file. So inserted tokens will look like examples below:

	t('views.admin.users.new.your_token') or t('controllers.admin.users.new.your_token')


### Edit translation ###

Select a token key and hit CMD+SHIFT+E, this will try to find a text associated to the token.  It'll show a box with translated text, where you can easily edit translation. 


### Edit config ###
  
Selecting "Edit config" from the bundle menu will open the `config.yml` where you can adjust the settings.

