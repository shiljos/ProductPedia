if Rails.env.test?
  Gibbon::Export.api_key = "fake" 
  Gibbon::Export.throws_exceptions = false 
end
Rails.configuration.mailchimp = Gibbon::API.new('381fe0b49778dd76eaac77d939f46e68-us8')