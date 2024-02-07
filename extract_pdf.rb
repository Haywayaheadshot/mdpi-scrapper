require 'nokogiri'
require 'open-uri'

class ExtractPDF
  def extract_pdf(url)
    html = URI.open(url)
    doc = Nokogiri::HTML(html)

    # Select all href attributes of anchor tags with class 'title-link'
    # within 'div' elements with class 'article-content' nested inside
    # 'div' elements with class 'article-item'
    doc.css('div.article-item div.article-content a.title-link').map { |link| link['href'] }
  rescue StandardError => e
    puts "Error: #{e.message}"
    []
  end
end
