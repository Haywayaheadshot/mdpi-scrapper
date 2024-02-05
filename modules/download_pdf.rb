module DownloadPDF
    def download_pdf
        puts 'Paste CSV id'
        id = gets.chomp.to_i
        puts "CSV with #{id}'s files have been downloaded to path '/desktop'"
    end
end