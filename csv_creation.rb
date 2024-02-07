class CSVCreation
  def csv_creation(pdf_links)
    csv_id = generate_csv_id
    csv_file = generate_csv_file(pdf_links)

    # Create a hash with csv_id and csv_file
    csv_data = { csv_id: csv_id, csv_file: csv_file }

    # Push the hash into @csv_arr
    @csv_arr ||= []
    @csv_arr << csv_data
  end

  private

  def generate_csv_id
    # use a timestamp for id
    Time.now.strftime('%Y%m%d%H%M%S')
  end

  def generate_csv_file(pdf_links)
    # use pdf_links as the content
    pdf_links.join("\n") # Convert pdf_links array to a string with each link on a new line
  end
end
