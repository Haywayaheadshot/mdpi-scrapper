require_relative 'modules/on_start'
require_relative 'modules/exit_app'
require_relative 'modules/create_csv'
require_relative 'modules/download_pdf'
require_relative 'extract_pdf'
require_relative 'csv_creation'

class App
  attr_reader :extractor, :csv_creation, :csv_arr

  def initialize
    @extractor = ExtractPDF.new
    @csv_creation = CSVCreation.new
    @csv_arr = []
  end

  include OnStart
  include CreateCSV
  include DownloadPDF
  include ExitApp
end
