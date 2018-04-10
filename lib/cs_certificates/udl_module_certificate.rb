module CsCertificates
class UdlModuleCertificate < Certificate
  
  def initialize(args={})
    super(args)
    @user_module_assessment = args.fetch(:user_module_assessment, nil)
  end

  def build_pdf
    @pdf.text = "This is a test pdf."
  end
end
end
