require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Matrimony" do
  describe "on first run" do
    it "should ask for development email address" do
      matrimony.should =~ /This is your first run/
    end
  end
end
