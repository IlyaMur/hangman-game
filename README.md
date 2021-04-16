# Виселица

###### tested: Ruby v.3.0

CLI-версия популярной настольной игры Виселица.  
Можно играть как одному так и с друзьями. Присутствуют забавные анимации ;)

### Узнать больше: 

[Википедия](https://ru.wikipedia.org/wiki/%D0%92%D0%B8%D1%81%D0%B5%D0%BB%D0%B8%D1%86%D0%B0_(%D0%B8%D0%B3%D1%80%D0%B0))

![Hangman Demo](https://i.imgur.com/aOIx2nB.png)

### Как запустить?
```$ bundle install```
```$ bundle exec main.rb```
```$ ruby main.rb```

### Как играть:

* При запуске Игра выбирает случайное слово.
* Игрок отгадывает загаданное слово последовательным вводом букв.
* Если буква в слове есть - Игра отображает верную букву.
* Для победы необходимо угадать все буквы из слова.
* У Игрока 7 попыток.
* Буквы "Е" - "Ё", "И" - "Й" являются эквивалентными.
* Игра не чувствительна к регистру.

### Добавить новые слова:
Просто отредактируйте словарик: data/words.txt

##### Free License
