module Searchable
  extend ActiveSupport::Concern
	included do		
		include Elasticsearch::Model
  
		settings index: {} do
		  settings analysis: {
		    # filter: {
		    #   filter_shingle: {
		    #     ...
		    #   },
		    #   filter_stop: {
		    #     ...
		    #   }
		    # },
		    analyzer: {
			    default: {
			     type: 'standard'
			    }
		      # default_index: {
		      #   type: 'standard'
		      # },
		      # default_search: {
		      #   type: 'keyword'
		      # }
		    }
		  } 
      mapping do
      	indexes :name, type: 'multi_field' do
			    indexes :name, index: 'not_analyzed'
          indexes :tokenized
      	end

    #   	indexes :ingredients do
    #     	indexes :name, type: 'multi_field' do
    #         indexes :name, index: 'not_analyzed'
    #         indexes :tokenized, analyzer: 'keyword'
    #       end
				# end        

        # indexes :category, analyzer: "keyword"

    #        			
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



	  def self.search(query)

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
	            { match: { name: query } },
	            { fuzzy: { name: query } }
	          ]
	        }
	      }
	    else 
	      @search_definition[:query] = { match_all: {} }
	    end

	    # if options[:category]
	    #   #f = { term: { categories: options[:category] } }
	    # end
	    
	    __elasticsearch__.search(@search_definition)
	    
	  end
	end
end