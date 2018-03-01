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

  describe "CsCertificates::QrCode#generate" do
    it "calls new on qr_generator" do
      rqrcode_double = double('RQRCode')
      generator = double('QRGenerator', new: rqrcode_double)
      allow(rqrcode_double).to receive(:as_png)

      expect(generator).to receive(:new).with(qrcode_attributes[:url])
      qrcode = CsCertificates::QrCode.new url: qrcode_attributes[:url], qr_generator: generator
      qrcode.generate
    end
    it "calls as_png on qr_generator" do
      rqrcode_double = double('RQRCode')
      generator = double('QRGenerator', new: rqrcode_double)

      expect(rqrcode_double).to receive(:as_png).with( 
        size: CsCertificates::QrCode::DEFAULT_SIZE, 
        border_modules: CsCertificates::QrCode::DEFAULT_BORDER_MODULES 
      )
      qrcode = CsCertificates::QrCode.new url: qrcode_attributes[:url], qr_generator: generator
      qrcode.generate
    end
    it "returns a ChunkyPNG::Image instance" do
      expect(qrcode.generate).to be_instance_of(ChunkyPNG::Image)
    end
  end
end
