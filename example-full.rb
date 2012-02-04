require 'rubygems'
require 'sinatra'

# list other gems
require 'erb'
require 'sass'

# list other files
require './lib/helpers'


# A route handler
get '/' do
  erb :index
end

get '/:year/:month/:day' do |year, month, day|
  @date = Date.new(year.to_i, month.to_i, day.to_i)
  
  erb :dynamic_route_using_dates
end

get '/scss/:name.css' do |name|
  scss name.to_sym, :style => :expanded
end

# Use the 'helper' block to define methods accessible from within views
helpers do
  def pretty_date(date)
    date.strftime("yy-mm-dd")
  end

  # include common helpers 
  include Rack::Utils
  
  # include own helpers
  include MyHelpers
  
  # write shortcuts for commonly used helpers
  alias_method :h, :escape_html
  
  
end
