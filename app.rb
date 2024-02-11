require_relative 'modules/on_start'
require_relative 'modules/exit_app'
require_relative 'modules/create_csv'
require_relative 'modules/download_pdf'
require_relative 'extract_pdf'
require_relative 'csv_creation'
require_relative 'pdf_downloads'

class App
  attr_reader :extractor, :csv_creation, :csv_arr, :pdf_downloads

  def initialize
    @extractor = ExtractPDF.new
    @csv_creation = CSVCreation.new
    @pdf_downloads = PDFDownloads.new
    @csv_arr = []
  end

  def populate_csv_arr(csv_data)
    @csv_arr = csv_data
  end

  include OnStart
  include CreateCSV
  include DownloadPDF
  include ExitApp
end
