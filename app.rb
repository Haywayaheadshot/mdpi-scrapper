require_relative 'modules/on_start'
require_relative 'modules/exit_app'

class App
  include OnStart
  include ExitApp
end
