require 'nokogiri'
require 'open-uri'
require 'pry'

module DownloadPDF
  def download_pdf
    if @csv_arr.empty?
      puts "CSV array is empty. Please populate @csv_arr before downloading PDFs."
      return
    end

    puts 'Paste CSV id'
    id = gets.chomp.to_i

    csv_found = false
    @pdf_downloads.download_links(csv_found, @csv_arr, id)
    
    unless csv_found
      puts "The CSV ID you entered does not exist."
    end
  end
end
