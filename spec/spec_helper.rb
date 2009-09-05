$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'matrimony'
require 'spec_helpers/matrimony_command'
require 'spec'
require 'spec/autorun'

SPEC_ROOT = File.dirname(__FILE__)

Spec::Runner.configure do |config|
  config.include MatrimonyCommand
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
