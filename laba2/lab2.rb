def script(word)
  n=word.length()
  if word[n-2]=='c' && word[n-1]=='s'
    p 2**n
  else
    p word.reverse
  end
end

def pokemon
  puts "Сколько добавить покемонов?"
  num=gets.to_i
  pokemons=[]
  num.times do
    puts "Введите имя для Покемона:"
    name=gets.chomp()
    puts "Введите цвет для Покемона:"
    colour=gets.chomp()
    pokemons<<{name=>colour}
  end
  p pokemons
end

script("love")
pokemon
