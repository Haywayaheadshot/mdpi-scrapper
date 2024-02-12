require 'dotenv/load'

module CreateCSV
  def create_csv
    puts 'Please input url'
    url = gets.chomp.to_s
    puts 'Please copy the csv id and paste after choosing command 2'

    pdf_links = @extractor.extract_pdf(url.to_s)

    csv_file = @csv_creation.csv_creation(pdf_links)

    csv_file.each do |file|
      puts "CSV ID: #{file[:csv_id]}"
      @csv_arr.push({ 'id' => file[:csv_id], 'content' => file[:csv_file] })
    end
  end
end
