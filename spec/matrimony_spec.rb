require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Matrimony do
  describe "on first run" do
    it "should ask for development email address" do
      open('|-') do |command|
        if sub.nil?
          Matrimony.run # What the gem executable calls
        else
          command.gets.should =~ /This is your first run/
        end
      end
    end
  end
  
  describe "after configuration" do
    matrimony_configured_with 'dev@mocra.com'
    
    # ...
  end
end
