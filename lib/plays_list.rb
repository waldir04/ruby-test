require 'nokogiri'
require 'open-uri'

class PlaysList
  def initialize
    @url = "http://www.ibiblio.org/xml/examples/shakespeare/"
  end

  #TO-DO Iemplement get method
  def get
    @html = Nokogiri::HTML(URI.open(@url))

    self
  end

  def list
    extract_names_and_urls = lambda do |link|
      [extact_url(@url, link), extract_titles(link)]
    end

    html.css('ul a').map(&extract_names_and_urls)
  end

  def html
    # @html it is set on get method
    @html
  end

  def extact_url(base_url, link)
    base_url + link['href']
  end

  def extract_titles(link)
    link.content
  end

end
