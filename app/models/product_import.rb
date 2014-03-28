class ProductImport
  extend ActiveModel::Model
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_accessor :file

  def initialize
    
  end

  def persisted?
    false
  end


  def parse_spreadsheet
    result = []
    spreadsheet = open_spreadsheet
    if !spreadsheet.empty?(1,1)
      header = spreadsheet.row(1)
      (2..spreadsheet.last_row).each do |i|
        result << Hash[[header, spreadsheet.row(i)].transpose]
      end
    end
    result
  end

  def open_spreadsheet
    case File.extname(file.original_filename)
      when ".csv" then Roo::CSV.new(file.path, file_warning: :ignore)
      when ".xls" then Roo::Excel.new(file.path, file_warning: :ignore)
      else raise "Unknown file type: #{file.original_filename}"
    end
  end
end  