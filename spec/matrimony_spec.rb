require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Matrimony, :type => :runner do
  stub_exit!
  
  describe "on first run" do
    it_exits_successfully
    
    it "should ask for development email address" do
      run do |command|
        command.gets.should =~ /This is your first run/
      end
    end
  end
  
  describe "after configuration" do
    # matrimony_configured_with 'dev@mocra.com'
    
    # ...
  end
end
