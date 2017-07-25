require 'rails_helper'

RSpec.describe "Test VCR" do
  it "should give synopsis" do
    VCR.use_cassette("synopsis") do
      response = Net::HTTP.get_response(URI('http://www.iana.org/domains/reserved'))
      expect(response.header.msg).to eq("OK")
    end
  end
end