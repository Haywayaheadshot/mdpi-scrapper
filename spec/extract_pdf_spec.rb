require '../extract_pdf'
require '../csv_creation'

RSpec.describe ExtractPDF do
  let(:extractor) { ExtractPDF.new }
  let(:csv_creation) { CSVCreation.new }
  let(:csv_arr) { [] }

  describe 'Extracts pdf_link' do
    it 'from hrefs of a-tags that leads to the pdf page' do
      pdf_link = extractor.extract_pdf(ENV.fetch('USER_URL', nil))
      csv_file = csv_creation.csv_creation(pdf_link)
      csv_file.each do |file|
        csv_arr.push({ 'id' => file[:csv_id], 'content' => file[:csv_file] })
      end
      pdf_link.each do |link|
        expect(csv_arr[0][:content]).to include(link)
      end
    end
  end
end
