class ConsoleInterface
  # Константа с массивом фигур, файлы из папки figures
  FIGURES =
      Dir["#{__dir__}/../data/figures/*.txt"].
      sort.
      map { |file_name| File.read(file_name) }

  # Экземпляр класса Game на входе у конструктора ConsoleInterface
  def initialize(game)
    @game = game
  end

  # Выводится текущее состояние игры.
  def print_out
    puts <<~END
      Слово: #{word_to_show}
      #{figure}
      Ошибки (#{@game.errors_made}): #{errors_to_show}
      У вас осталось ошибок: #{@game.errors_allowed}

    END

    if @game.won?
      puts "Поздравляем, вы выиграли!"
    elsif @game.lost?
      puts "Вы проиграли, загаданное слово: #{@game.word}"
    end
  end

  # Возвращает фигуру из массива FIGURES, соответствующую количеству ошибок.
  def figure
    FIGURES[@game.errors_made]
  end

  # Метод, который готовит слово для вывода "на игровом табло".
  def word_to_show
    result =
      @game.letters_to_guess.map do |letter|
        if letter == nil
          "__"
        else
          letter
        end
      end

    result.join(" ")
  end

  # Склеивает массив ошибочных букв
  def errors_to_show
    @game.errors.join(", ")
  end
    
  def greeting
    puts "Всем привет!"
    puts 'Начинаем игру Виселица!'
  end

  # Метод получает букву и приводит её к верхнему регистру
  def get_input
    print "Введите следующую букву: "
    input = gets
    input.upcase[0]
  end
end
