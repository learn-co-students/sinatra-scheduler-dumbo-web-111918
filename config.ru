require_relative './config/environment'

run ApplicationController
use Rack::MethodOverride
