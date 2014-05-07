module Searchable
  extend ActiveSupport::Concern
	included do		
		include Elasticsearch::Model
  	
		settings index: {} do
		  settings analysis: {
		    filter: {
		      autocomplete_filter: {
		        type: "edge_ngram",
		        min_gram: 1,
		        max_gram: 20
		      }
		    },
		    analyzer: {
			    default: {
			     type: "standard"
			    },
			    autocomplete: {
			    	type: "custom",
			    	tokenizer: "standard",
			    	filter: [
			    		"lowercase",
			    		"autocomplete_filter"
			    	]
			    }
		      # default_index: {
		      #   type: 'standard'
		      # },
		      # default_search: {
		      #   type: 'standard'
		      # }
		    }
		  } 
      mapping do
      	indexes :name, type: 'multi_field' do
			    indexes :name, index_analyzer: 'autocomplete', search_analyzer: 'standard'
          indexes :raw, index: 'not_analyzed'
      	end

      	indexes :ingredients do
        	indexes :name, type: 'multi_field' do
            indexes :name
            indexes :tokenized, analyzer: 'keyword'
          end
				end        

        indexes :category do
        	indexes :name, analyzer: "keyword"
      	end
    
    #     indexes :manufacturers, type: 'multi_field' do
    #       indexes :manufacturers
    #       indexes :tokenized, analyzer: 'simple'
    #     end

    #, index: 'not_analyzed'
      end
    end


	  def as_indexed_json(options={})
	    self.as_json(
	      include: { category:               { only: :name },
	                 ingredients:            { only: :name }
	                 #manufacture_companies:  { only: :name }
	               })
	  end



	  def self.search(query, options={})

	  	_set_filters = lambda do |f|
	    	@search_definition[:filter][:and] ||= []
	    	@search_definition[:filter][:and]  |= [f]
	    end

	    @search_definition = {

	      query: {},

	      filter: {},

	      facets: {
	        categories: {
	          terms: {
	            field: 'category.name'
	          },
	          facet_filter: {}
	        },
	        ingredients: {
	          terms: {
	            field: 'ingredients.name'
	          }, 
	          facet_filter: {}
	        }
	        # manufacturers: {
	        #   terms: {
	        #     field: 'manufacture_companies.name'
	        #   },
	        #   facet_filter: {}
	        # }
	      }
	    }

	    unless query.blank?
	      @search_definition[:query] = {
	        bool: {
	          should: [
	            { match: { 
		            	name: {
		            	  query: query
		            	}
	            	}
	            },
	            { fuzzy: {
	            		name: query
	            	}
	          	}
	          ]
	        }
	      }
	    else 
	      @search_definition[:query] = { match_all: {} }
	    end

	    if options[:category]
	      f = { term: { 'category.name' => options[:category] } }

	      _set_filters.(f)
	    end

	    if options[:ingredients]
	    	f = { term: { 'ingredients.name' => options[:ingredients] } }
	    end
	    
	    __elasticsearch__.search(@search_definition)
	    
	  end
	end
end