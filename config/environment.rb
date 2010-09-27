# Load the rails application
require File.expand_path('../application', __FILE__)

I18n.default_locale = :es

# Initialize the rails application
Yourquestion::Application.initialize!

WillPaginate::ViewHelpers.pagination_options[:renderer] = 'PaginationListLinkRenderer'

