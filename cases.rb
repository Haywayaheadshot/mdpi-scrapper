require './app'

class Cases < App
  puts '--------------------------------------------------'
  puts 'Welcome to the PDF Library'

  def initialize()
    @app = App.new
    super()
  end

  def on_start
    puts @app.on_start
    input = gets.chomp.to_i
    show_menu(input)
  end

  def show_menu(par)
    @user_pick = {
      1 => 'create_csv',
      2 => 'download_pdf',
      3 => 'exit_app'
    }

    case par
    when 1..2
      @app.send(@user_pick[par])
      on_start
    when 3
      @app.send(@user_pick[par])
    else
      puts 'Option doesn\'t exist ¯\_(ﾟ～ﾟ)_/¯, select another one!'
      on_start
    end
  end
end
