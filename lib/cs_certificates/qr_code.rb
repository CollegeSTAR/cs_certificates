require 'rqrcode'

module CsCertificates

##
# This class is a wrapper around rqrcode
# 
# It dramatically simplifies the api and only returns png images

class QrCode
  DEFAULT_SIZE = 120
  DEFAULT_BORDER_MODULES = 2

  attr_reader :url, :size
  
  ##
  # Creates a QrCode object
  #
  # :args: url, size, qr_generator

  def initialize(args={})
    @url = args.fetch(:url, nil)
    @size = args.fetch(:size, DEFAULT_SIZE)
    @qr_generator = args.fetch(:qr_generator, RQRCode::QRCode)

    raise ArgumentError, ":url must not be blank" if @url == nil
  end

  ##
  # Returns a ChunkyPNG::Image object containing qrcode for given url

  def generate()
    @qrcode = @qr_generator.new(@url)
    @png = @qrcode.as_png(
      size: @size,
      border_modules: DEFAULT_BORDER_MODULES
    )
  end
end
end
