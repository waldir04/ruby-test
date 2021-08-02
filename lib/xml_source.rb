require 'nokogiri'
require 'open-uri'

class XmlSource
  def initialize(url)
      @url = url
  end

  def source
  	# open the file and read it as XML
    response = URI.open(@url)
    @xml     = Nokogiri::XML(response.read)
  end

end
