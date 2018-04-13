require "cs_certificates/version"
require "cs_certificates/qr_code"
require "cs_certificates/certificate"
require "cs_certificates/udl_module_certificate"

module CsCertificates
  def self.root
    File.dirname __dir__
  end
end
