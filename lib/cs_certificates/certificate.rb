require 'prawn'

module CsCertificates
class Certificate
  def initialize(args={})
    @output_file = args.fetch(:output_file, "certificate.pdf")
    @pdf_generator = args.fetch(:pdf_generator, Prawn::Document)
    @pdf = @pdf_generator.new
  end

  def build_pdf()
    raise NotImplementedError
  end

  def render()
    @pdf.render_file @output_file
  end
end
end
