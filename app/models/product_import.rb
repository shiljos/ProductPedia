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

  def load_category(product, category)
    if !Category.find_by(name: category).nil?
      product.category_id = Category.find_by(name: category).id
    else
      false
    end
  end

  def load_manufacturer(product, manufacturer)
    if !Company.find_by(name: manufacturer).nil?
      manufact = Company.find_by(name: manufacturer)
      product.manufacturers.build(company_id: manufact.id)
    else
      false
    end
  end

  def load_distributer(product, distributer)
    if !Company.find_by(name: distributer).nil?
      distribute = Company.find_by(name: distributer)
      product.distributers.build(company_id: distribute.id)
    else
      false
    end
  end

  def load_ingredients(product, ingredients)
    prod_ingredients = ingredients.split(",")
    prod_ingredients.each do |ingredient|
      ingredient = ingredient.strip
      ing = Ingredient.find_or_create_by(name: ingredient)
      product.product_ingredients.build(ingredient_id: ing.id)
    end
  end

  def load_nutritions(product, nutritions)
    prod_nutritions = nutritions.split(",")
    prod_nutritions.each do |nut|
      nut = nut.strip
      nut_ing = nut.split("#")
      nut_name = nut_ing[0]
      nut_amount = nut_ing[1].to_i
      nutrition = Nutrition.find_or_create_by(name: nut_name)
      product.product_nuts.build(nutrition_id: nutrition.id, amount: nut_amount)
    end
  end

  def load_imported_products
    result = []
    spreadsheet = open_spreadsheet
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      product = Product.new
      if load_category(product, row["category"]) == false
        return
      end
      if load_manufacturer(product, row["manufacturer"]) == false
        return
      end
      if load_distributer(product, row["distributer"]) == false
        return
      end
      load_ingredients(product, row["ingredients"])
      load_nutritions(product, row["nutritions"])
      product.bar_codes.build(barcode: row["barcode"])
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