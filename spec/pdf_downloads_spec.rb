require_relative '../pdf_downloads'
require 'open-uri'
require 'nokogiri'

RSpec.describe PDFDownloads do
  let(:pdf_downloads) { PDFDownloads.new }

  describe '#download_links' do
    let(:csv_arr) do
      [
        { 'id' => '1', 'content' => "pdf1.pdf\npdf2.pdf\n" },
        { 'id' => '2', 'content' => "pdf3.pdf\npdf4.pdf\n" }
      ]
    end

    context 'when given a valid id' do
      it 'downloads PDF files corresponding to the id' do
        allow(ENV).to receive(:fetch).with('BASE_URL', nil).and_return('http://example.com/')
        allow_any_instance_of(URI::HTTP).to receive(:open)
          .and_return("<a class='UD_ArticlePDF' href='pdf1-download-link'></a>")
        allow(File).to receive(:open)

        expect(pdf_downloads).to receive(:download_pdf_file).twice.with('http://example.com/pdf1-download-link',
                                                                        anything)

        pdf_downloads.download_links(true, csv_arr, '1')
      end
    end

    context 'when given an invalid id' do
      it 'does not download any PDF files' do
        allow(ENV).to receive(:fetch).with('BASE_URL', nil).and_return('http://example.com/')

        expect(pdf_downloads).not_to receive(:download_pdf_file)

        pdf_downloads.download_links(true, csv_arr, '3')
      end
    end
  end
end
