require 'spec_helper'

RSpec.describe CsCertificates::QrCode do
  let(:qrcode_attributes) { 
    {
      url: "http://example.com",
      size: 140
    }
  }
  let(:qrcode) { CsCertificates::QrCode.new( qrcode_attributes ) }

  describe "CsCertificates::QrCode#new" do
    it "assigns url to QrCode#url" do
      expect(qrcode.url).to eq(qrcode_attributes[:url])
    end
    it "assigns size to QrCode#size" do
      expect(qrcode.size).to eq(qrcode_attributes[:size])
    end
    it "assigns default values" do
      qrcode = CsCertificates::QrCode.new(url: qrcode_attributes[:url])
      expect(qrcode.size).to eq(CsCertificates::QrCode::DEFAULT_SIZE)
    end

    it "raises exception if no url is provided" do
      expect{ CsCertificates::QrCode.new }.to raise_error(ArgumentError)
    end
  end
end
