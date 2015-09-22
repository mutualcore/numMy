require 'unirest'
require 'uri'

class Yummly
	def self.search(params = {})

		response = Unirest.get("http://api.yummly.com/v1/api/recipes", headers:
                          { "Accept" => "application/json" },
                            parameters: { :_app_id => ENV['YUMMLY_APP_ID'].to_s,
                            :_app_key => ENV['YUMMLY_APP_KEY'].to_s , 
                            :allowedIngredient => params, 
                            :maxResult => 40})
    if response.code == 200
    	recipe_json = response.body
    else
    	recipe_json = nil
    end
  end

  def self.show(id)
  	response = Unirest.get("http://api.yummly.com/v1/api/recipe/#{id}", headers:
  												{ "Accept" => "application/json" },
  													parameters: { :app_id => ENV['YUMMLY_APP_ID'].to_s,
  													:_app_key => ENV['YUMMLY_APP_KEY'].to_s, })
  	if response.code == 200
    	recipe_json = response.body
    else
    	recipe_json = nil
    end	
  end											
end