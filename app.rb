require_relative './modules/on_start'
require_relative './modules/exit_app'

class App

  def initialize
  end

  include OnStart
  include ExitApp
end