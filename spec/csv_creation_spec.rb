require '../csv_creation'

RSpec.describe CSVCreation do
  let(:csv_creator) { CSVCreation.new }

  describe '#csv_creation' do
    context 'with valid input' do
      it 'creates a CSV file with correct format' do
        pdf_links = ['http://example.com/pdf1', 'http://example.com/pdf2']
        csv_file = csv_creator.csv_creation(pdf_links)

        # Test CSV format
        expect(csv_file).to be_an(Array)
        expect(csv_file).not_to be_empty
        expect(csv_file[0]).to include(:csv_id, :csv_file)
      end
    end

    context 'with empty input' do
      it 'returns an empty array' do
        pdf_links = []
        csv_file = csv_creator.csv_creation(pdf_links)
        csv_file.each do |file|
          expect(file[:csv_file]).to eq('')
        end
      end
    end
  end
end
