require_relative 'modules/on_start'
require_relative 'modules/exit_app'
require_relative 'modules/create_csv'
require_relative 'modules/download_pdf'
require_relative 'extract_pdf'

class App
  attr_reader :extractor

  def initialize
    @extractor = ExtractPDF.new
  end

  include OnStart
  include CreateCSV
  include DownloadPDF
  include ExitApp
end
