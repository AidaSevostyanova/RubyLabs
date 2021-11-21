module Resource
  def connection(routes)
    if routes.nil?
      puts "No route matches for #{self}"
      return
    end

    loop do
      print 'Choose verb to interact with resources (GET/POST/PUT/DELETE) / q to exit: '
      verb = gets.chomp
      break if verb == 'q'

      action = nil

      if verb == 'GET'
        print 'Choose action (index/show) / q to exit: '
        action = gets.chomp
        break if action == 'q'
      end


      action.nil? ? routes[verb].call : routes[verb][action].call
    end
  end
end

class PostsController
  extend Resource

  def initialize
    @posts = ["Hello World","Hello (again)"]
  end

  def index
    i=0
    if @posts.size!=0
      for p in @posts do
        puts "#{i}. #{p}"
        i=i+1
      end
    else
      puts "No posts."
    end
  end

  def show
    print "Enter post index: "
    i=gets.to_i
    if i<0
      puts "Invalid index. You must enter a natural number. Please try again."
    elsif @posts[i]==nil
      puts "Post with such index does not exist. Please try again."
    else
      puts "#{i}. #{@posts[i]}"
    end
  end

  def create
    print "Enter post text: "
    p=gets.chomp
    if p.empty?
      puts "You have not entered text. Please try again."
    else
      @posts << p
      puts "#{@posts.size-1}. #{@posts[-1]}"
    end
  end

  def update
    print "Enter post index: "
    i=gets.to_i
    if i<0
      puts "Invalid index. You must enter a natural number. Please try again."
    elsif @posts[i]==nil
      puts "Post with such index does not exist. Please try again."
    else
      print "Enter post text: "
      p=gets.chomp
      if p.empty?
        puts "You have not entered text. Please try again."
      else
        @posts[i] = p
        puts "#{i}. #{@posts[i]}"
      end
    end
  end

  def destroy
    print "Enter post index: "
    i=gets.to_i
    if i<0
      puts "Invalid index. You must enter a natural number. Please try again."
    elsif @posts[i]==nil
      puts "Post with such index does not exist. Please try again."
    else
      @posts.delete_at(i)
    end
  end
end

class CommentsController
  extend Resource

  def initialize
    @comments = ["Beautiful","Wonderful"]
  end

  def index
    i=0
    if @comments.size!=0
      for c in @comments do
        puts "#{i}. #{c}"
        i=i+1
      end
    else
      puts "No comments."
    end
  end

  def show
    print "Enter comment index: "
    i=gets.to_i
    if i<0
      puts "Invalid index. You must enter a natural number. Please try again."
    elsif @comments[i]==nil
      puts "Comment with such index does not exist. Please try again."
    else
      puts "#{i}. #{@comments[i]}"
    end
  end

  def create
    print "Enter comment text: "
    c=gets.chomp
    if c.empty?
      puts "You have not entered text. Please try again."
    else
      @comments << c
      puts "#{@comments.size-1}. #{@comments[-1]}"
    end
  end

  def update
    print "Enter comment index: "
    i=gets.to_i
    if i<0
      puts "Invalid index. You must enter a natural number. Please try again."
    elsif @comments[i]==nil
      puts "Comment with such index does not exist. Please try again."
    else
      print "Enter comment text: "
      c=gets.chomp
      if c.empty?
        puts "You have not entered text. Please try again."
      else
        @comments[i] = c
        puts "#{i}. #{@comments[i]}"
      end
    end
  end

  def destroy
    print "Enter comment index: "
    i=gets.to_i
    if i<0
      puts "Invalid index. You must enter a natural number. Please try again."
    elsif @comments[i]==nil
      puts "Comment with such index does not exist. Please try again."
    else
      @comments.delete_at(i)
    end
  end
end

class Router
  def initialize
    @routes = {}
  end

  def init
    resources(PostsController, 'posts')
    resources(CommentsController, 'comments')
    loop do
      print 'Choose resource you want to interact (1 - Posts, 2 - Comments, q - Exit): '
      choise = gets.chomp
      PostsController.connection(@routes['posts']) if choise == '1'
      CommentsController.connection(@routes['comments']) if choise == '2'
      break if choise == 'q'
    end

    puts 'Good bye!'
  end

  def resources(klass, keyword)
    controller = klass.new
    @routes[keyword] = {
      'GET' => {
        'index' => controller.method(:index),
        'show' => controller.method(:show)
      },
      'POST' => controller.method(:create),
      'PUT' => controller.method(:update),
      'DELETE' => controller.method(:destroy)
    }
  end
end

router = Router.new

router.init
