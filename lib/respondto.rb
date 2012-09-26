root = File.join(File.dirname(__FILE__), "..")

require "respondto/version"
require "compass"

Compass::Frameworks.register("respondto",
  :stylesheets_directory => File.join(root,"scss")
)