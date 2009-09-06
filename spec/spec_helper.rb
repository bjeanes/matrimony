$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'matrimony'
require 'spec'
require 'spec/autorun'

gem 'clispec'
require 'clispec'
require 'clispec/example_groups/runner'

# Interesting reads
# http://devver.net/blog/2009/08/unit-testing-filesystem-interaction/
# http://devver.net/blog/2009/07/a-dozen-or-so-ways-to-start-sub-processes-in-ruby-part-2/
# http://devver.net/blog/2009/07/a-command-line-prompt-with-timeout-and-countdown/

SPEC_ROOT = File.dirname(__FILE__)
Dir["#{SPEC_ROOT}/spec_helpers/*"].each { |helper| require helper }

Spec::Runner.configure do |config|
  config.include MatrimonyCommand
  config.include GitHelper

  config.mock_with :mocha
  
  config.before(:each) do
    Dir.chdir(SPEC_ROOT) { `tar xzf fixture_repo.tgz fixture_repo` }
    Dir.chdir(File.join(SPEC_ROOT, 'fixture_repo'))
  end
  
  config.after(:each) do
    Dir.chdir(SPEC_ROOT)
    `rm -rf fixture_repo`
  end
end