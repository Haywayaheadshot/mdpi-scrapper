require_relative 'modules/on_start'
require_relative 'modules/exit_app'
require_relative  'modules/create_csv'
require_relative 'modules/download_pdf'

class App
  include OnStart
  include CreateCSV
  include DownloadPDF
  include ExitApp
end
