def script(word)
  n=word.length()
  if word[n-2]=='c' && word[n-1]=='s'
    puts 2**n
  else puts word.reverse
  end
end

script("bmw_cs")

puts "Сколько добавить покемонов?"

pokemons={name:'pickachu',color:'green'},{name:'gfhfgj',color:'yellow'}
puts pokemons
