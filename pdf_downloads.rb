# rubocop:disable all

class PDFDownloads
  def download_links(_csv_found, csv_arr, id)
    csv_arr.each do |file|
      next unless file['id'] == id.to_s

      pdf_links = file['content'].split("\n")

      pdf_links.each do |link|
        base_url = ENV.fetch('BASE_URL', nil)
        pdf_url = "#{base_url}#{link}"

        html = URI.open(pdf_url)

        doc = Nokogiri::HTML(html)

        end_point = doc.at_css('a.UD_ArticlePDF')['href']

        # Construct the full URL for the PDF download
        pdf_download_url = "#{base_url}#{end_point}"

        download_path = File.join(Dir.home, 'Downloads')

        download_pdf_file(pdf_download_url, download_path)
      end
    end
  end

  private

  def download_pdf_file(url, path)
    end_point = url.split('/').last
    full_path = File.join(path, "#{end_point}.pdf")
    File.open(full_path, 'wb') do |file|
      file << URI.open(url).read
    end
  rescue StandardError => e
    puts "Error downloading #{url}: #{e.message}"
  end
end
