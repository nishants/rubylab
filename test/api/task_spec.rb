require './src/tasks/report'
require 'rspec'

require "./test/support/support"
require "./test/support/client"

RSpec.describe RubyLab::Report do

  describe "Should generate report" do

    before :each do
      @client = RubyLab::Client.new("http://localhost:4567")
    end

    it "should convert relative path to failed contract name" do
      actual = JSON.parse(@client.put("/evaluate", "'1,2,3'.split(',')"))
      expected = {"result" => ["1","2","3"]}
      expect(actual).to eq(expected)
    end

  end

end