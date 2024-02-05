module CreateCSV
  def create_csv
    puts 'Please input url'
    url = gets.chomp.to_s
    puts "id: #{url}"
    puts 'Please copy the csv id and paste after choosing command 2'
  end
end
