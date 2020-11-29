# # This file is used by Rack-based servers to start the application.
#
# require_relative 'config/environment'
#
# run Rails.application
# # run Proc.new {[200,{'Content-Type' => 'text/plain'}, ["hello world"]]}


RAILS_RELATIVE_URL_ROOT="/${app_path}"
require ::File.expand_path('../config/environment',  __FILE__)
if RAILS_RELATIVE_URL_ROOT then
        map RAILS_RELATIVE_URL_ROOT do
                run Rails.application
        end
else
        run Rails.application
end
