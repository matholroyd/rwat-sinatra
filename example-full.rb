require 'rubygems'
require 'sinatra'

# list other gems
require 'sass'
require 'haml'

# list other files
require './lib/helpers'


# A route handler
get '/' do
  erb :index
end

get '/plain-text' do
  "If a string is returned, Sinatra just renders the text (no layout)"
end

get '/plain-text-with-layout' do
  erb "If specifying a layout, need to pick a parser (e.g. <code>erb</code>)", :layout => :layout
end

get '/haml' do
  haml :haml_example
end


get '/:year/:month/:day' do |year, month, day|
  @date = Date.new(year.to_i, month.to_i, day.to_i)
  
  erb :dynamic_route_using_dates
end

# To get SCSS stylesheets dynamically generated, put behind
# a special route. Note that the main.scss file is in /views/, but
# referred to in the HTML <head> as /scss/main.css
get '/scss/:name.css' do |filename|
  scss filename.to_sym, :style => :expanded
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
