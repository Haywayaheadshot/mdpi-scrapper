require 'dotenv/load'

module CreateCSV
  def create_csv
    puts 'Please input url'
    url = gets.chomp.to_s
    puts "id: #{url}"
    puts 'Please copy the csv id and paste after choosing command 2'
    pdf_links = @extractor.extract_pdf(ENV.fetch('PDF_URL', nil))
    puts pdf_links
    csv_file = @csv_creation.csv_creation(pdf_links)
    puts csv_file
  end
end
