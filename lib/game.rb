class Game
  # Допустимые ошибки
  TOTAL_ERRORS_ALLOWED = 7

  # Конструктор Game на вход получает строку с загаданным словом.
  def initialize(word)
    @letters = word.chars
    @user_guesses = []
  end

  # Возвращает ошибочные буквы
  def errors
    @user_guesses - normalized_letters(@letters)
  end

  # Возвращает количество ошибок, сделанных пользователем
  def errors_made
    errors.length
  end

  # Возвращает оставшееся число допустимых ошибок
  def errors_allowed
    TOTAL_ERRORS_ALLOWED - errors_made
  end

  # Возвращает массив с уже отгаданными буквами.
  def letters_to_guess
    result =
      @letters.map do |letter|
        if @user_guesses.include?(normalize_letter(letter))
          letter
        else
          nil
        end
      end
    result
  end

  # Преобразуем "Ё" в "Е" и "Й" в "И", облегчая игра.
  def normalize_letter(letter)
    if letter == 'Ё'
      return 'Е'
    elsif letter == 'Й'
      return 'И'
    end
    letter
  end

  def normalized_letters(letters)
    letters.map { |c| normalize_letter(c) }
  end

  # Если у пользователя не осталось ошибок (игра проиграна) возвращает true
  def lost?
    errors_allowed == 0
  end

  # Если игра закончена возвращает true
  def over?
    won? || lost?
  end

  # Основной игровой метод.
  def play!(letter)
    normalize_letter = normalize_letter(letter)

    if !over? && !@user_guesses.include?(normalize_letter)
      @user_guesses << normalize_letter
    end
  end

  # Если не осталось неотгаданных букв возвращает true
  def won?
    (normalized_letters(@letters) - @user_guesses).empty?
  end

  # Возвращает загаданное слово
  def word
    @letters.join
  end
end
