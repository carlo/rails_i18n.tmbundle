(RUBY_VERSION > "1.9") ? Encoding.default_external = Encoding::UTF_8 : $KCODE = 'UTF8' 

require 'rubygems'
require 'yaml' 
require 'active_support/all'
begin
  require "ya2yaml"
rescue LoadError 
  TextMate.message("The ya2yaml gem is missing, please install it.")
  TextMate.exit_discard
end

class String 
  def strip
    self.gsub(/\A\s*["']?|["']?\s*\z/,'') 
  end
end

class BundleConfig
  attr_reader :default_locale, :default_locale_file, :default_locale_content
  def initialize
    @config = YAML::load(File.open(ENV["TM_BUNDLE_SUPPORT"] + "/config/config.yml").read)
    
    @default_locale = @config['default_locale'] 
    @default_locale_file = File.join(ENV['TM_PROJECT_DIRECTORY'], @config['default_locale_file']) 
    begin
      File.open(@default_locale_file, 'w') { |f| f.write({@default_locale => {}}.ya2yaml) } unless File.exists?(@default_locale_file)  
    rescue 
      TextMate.message("Can't create #{@config['default_locale_file']}. Are you in RoR project?")
      TextMate.exit_discard 
      return
    end
    @default_locale_content = YAML::load(File.open(@default_locale_file).read)   
  end

end

BUNDLE_CONFIG = BundleConfig.new