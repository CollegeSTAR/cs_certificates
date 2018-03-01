require 'spec_helper'

RSpec.describe CsCertificates::Certificate do
  let(:cert_attributes) {
    {
      output_file: "output_file.pdf"
    }
  }
  let(:cert) { CsCertificates::Certificate.new }
  describe "Certificate#new" do
    it "returns a Certificate Instance" do
      expect(cert).to be_instance_of(CsCertificates::Certificate)
    end
    it "initializes a pdf document" do
      prawn_document_double = double("Document")
      prawn_double = object_double("Prawn::Document", new: prawn_document_double)

      CsCertificates::Certificate.new pdf_generator: prawn_double
      expect(prawn_double).to have_received(:new)
    end
  end

  describe "Certificate#build_pdf" do
    it "raises NotImplementedError" do
      expect{ cert.build_pdf }.to raise_error(NotImplementedError)
    end
  end

  describe "Certificate#render" do
    it "calls the pdf_generators render_file method" do
      prawn_document_double = double("Document", render_file: true)
      prawn_double = object_double("Prawn::Document", new: prawn_document_double)
      cert = CsCertificates::Certificate.new output_file: cert_attributes[:output_file], pdf_generator: prawn_double

      cert.render
      expect(prawn_document_double).to have_received(:render_file).with(cert_attributes[:output_file])
    end
  end
end
