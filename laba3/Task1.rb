FILMS_LIST_PATH = "laba3/Films.txt"
BUFFER = 'laba3/buffer.txt'

def index
  File.foreach(FILMS_LIST_PATH) { |film| puts film }
end

def where(genre)
  File.foreach(FILMS_LIST_PATH).with_index do |film, index|
    @film_id = index if film.include?(genre)
  end
  @film_id
end

def update(id, film_genre)
  file = File.open(BUFFER, 'w')
  File.foreach(FILMS_LIST_PATH).with_index do |film, index|
    file.puts(id == index ? film_genre : film)
  end
  file.close
  File.write(FILMS_LIST_PATH, File.read(BUFFER))
  File.delete(BUFFER) if File.exist?(BUFFER)
end

def find(id)
  File.foreach(FILMS_LIST_PATH).with_index do |film,index|
    puts film if id==index
  end
end

def delete(id)
  file = File.open(BUFFER, 'w')
  File.foreach(FILMS_LIST_PATH).with_index do |film,index|
    file.puts(film) if index!=id
  end
  file.close
  File.write(FILMS_LIST_PATH,File.read(BUFFER))
  File.delete(BUFFER) if File.exist?(BUFFER)
end

index
where("drama")
update(2, "After - melodrama")
find(3)
delete(1)
