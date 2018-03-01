module CsCertificates
class QrCode
  DEFAULT_SIZE = 120

  attr_reader :url, :size

  def initialize(args={})
    @url = args.fetch(:url, nil)
    @size = args.fetch(:size, DEFAULT_SIZE)

    raise ArgumentError, ":url must not be blank" if @url == nil
  end
end
end
