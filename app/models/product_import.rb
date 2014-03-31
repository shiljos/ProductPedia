class ProductImport
  extend ActiveModel::Model
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_accessor :file

  def initialize(attributes = {})
    attributes.each { |name, value| send("#{name}=",  value) }
  end

  def persisted?
    false
  end

  # def parse_spreadsheet
  #   result = []
  #   spreadsheet = open_spreadsheet
  #   if !spreadsheet.empty?(1,1)
  #     header = spreadsheet.row(1)
  #     (2..spreadsheet.last_row).each do |i|
  #       result << Hash[[header, spreadsheet.row(i)].transpose]
  #     end
  #   end
  #   result
  # end
  
  def save
    if imported_products.map(&:valid?).all?
      imported_products.each(&:save!)
      true
    else
      imported_products.each_with_index do |product, index|
        product.errors.full_messages.each do |message|
          errors.add :base, "Row #{index+2}: #{message}"
        end
      end
      false
    end
  end

  def imported_products
    @imported_products ||= load_imported_products
  end

  def load_imported_products
    result = []
    spreadsheet = open_spreadsheet
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      product = Product.find_by_id(row["id"]) || Product.new
      #product.attributes = row.to_hash.slice(:name, :description)
      if !Category.find_by(name: row["category"]).nil?
        product.category_id = Category.find_by(name: row["category"]).id
      end
      if !Company.find_by(name: row["manufacturer"]).nil?
        manufact = Company.find_by(name: row["manufacturer"])
        if product.new_record?
          product.manufacturers.build(company_id: manufact.id)
        else
          Manufacturer.update(product.manufacturers.first, company_id: manufact.id)
        end
      end
      if !Company.find_by(name: row["distributer"]).nil?
        distribute = Company.find_by(name: row["distributer"])
        if product.new_record?
          product.distributers.build(company_id: distribute.id)
        else
          Distributer.update(product.distributers.first, company_id: distribute.id)
        end
      end
        #puts "ALERT #{row['barcode']}"
      if !BarCode.find_by(barcode: row["barcode"]).nil?
        #puts "ALERT #{row['barcode']}"
        product.bar_codes.first.barcode = row["barcode"]
      else
        product.bar_codes.build(barcode: row["barcode"])
      end

      ingredients = row["ingredients"].split(",")
      ingredients.each do |ingredient|
        ingredient = ingredient.strip
        ing = Ingredient.find_or_create_by(name: ingredient)
        product.product_ingredients.build(ingredient_id: ing.id)
      end


      nutritions = row["nutritions"].split(",")
      nutritions.each do |nut|
        nut = nut.strip
        nut_ing = nut.split("#")
        nut_name = nut_ing[0]
        nut_amount = nut_ing[1].to_i
        nutrition = Nutrition.find_or_create_by(name: nut_name)
        product.product_nuts.build(nutrition_id: nutrition.id, amount: nut_amount)
        end
  
      product.name = row["name"]
      product.description = row["description"]
      product.owner_id = row["owner_id"]
      result << product
    end
    result
  end

  def open_spreadsheet
    case File.extname(file.original_filename)
      when ".csv" then Roo::CSV.new(file.path, file_warning: :ignore)
      when ".xls" then Roo::Excel.new(file.path, file_warning: :ignore)
      when ".xlsx" then Roo::Excel.new(file.path, file_warning: :ignore)
      when ".ods" then Roo::LibreOffice.new(file.path, file_warning: :ignore)
      else raise "Unknown file type: #{file.original_filename}"
    end
  end
end  