root = File.join(File.dirname(__FILE__), "..")

require "responder/version"
require "compass"

module Sass::Script::Functions
  def regex(string,regex)
    assert_type string, :String
    assert_type regex, :String
    /#{regex.value}/.match string.value
    $1 ? match = $1 : match = ''
    Sass::Script::String.new(match)
  end
  declare :regex, :args => [:string, :string]
end

Compass::Frameworks.register("responder",
  :stylesheets_directory => File.join(root,"scss")
)