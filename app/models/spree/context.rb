module Spree
  class Context < ActiveRecord::Base

    include Spree::DynamicAttribute

    belongs_to :line_item, :class_name => 'Spree::LineItem', :foreign_key => 'line_item_id'
    has_many :option_values, :class_name => 'Spree::ContextOptionValue', :foreign_key => 'context_id', :dependent => :destroy

    def initialize_variables
      @temporal = {}
    end

    def get_temporal
      @temporal
    end

    def self.build_from_params(params, options = {})
      raise Exception.new("You must ebe explicit about temporal or not") if options[:temporal].nil?
      context_params = {}
      prefix = "#{params[:product_type]}_"
      params.each do |k, v|
      	if k.starts_with?(prefix)
      	  context_params[k.gsub(prefix, '')] = v
      	else
      	  context_params[k] = v
      	end
      end
      context = Spree::Context.new
      context.initialize_variables
      context.set_option_values(context_params, :temporal => options[:temporal])
      return context
    end

    def start_date(options = {:temporal => true})
      get_mixed_option_value(:start_date, options)
    end

    def end_date(options = {:temporal => true})
      get_mixed_option_value(:end_date, options)
    end

    def plan(options = {:temporal => true})
      get_mixed_option_value(:plan, options)
    end

    def adult(options = {:temporal => true})
      get_mixed_option_value(:adult, options)
    end

    def child(options = {:temporal => true})
      get_mixed_option_value(:child, options)
    end

  end
end
