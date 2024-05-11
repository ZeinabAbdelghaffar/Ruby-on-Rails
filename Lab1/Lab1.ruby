require 'json'
require 'fileutils'

class Book
  attr_reader :title, :author, :isbn

  def initialize(title, author, isbn)
    @title = title
    @author = author
    @isbn = isbn
  end

  def to_json
    { title: @title, author: @author, isbn: @isbn }
  end

  def self.from_json(json)
    data = JSON.parse(json)
    new(data['title'], data['author'], data['isbn'])
  end
end

class Inventory
  def initialize(file_path)
    @file_path = file_path
    create_file_if_not_exist
    load_books
  end

  def list_books(title = "Books Inventory")
    puts title
    @books.each do |book|
      puts "#{book.title} by #{book.author} (ISBN: #{book.isbn})"
    end
  end

  def add_book(title, author, isbn)
    @books << Book.new(title, author, isbn)
    save_books
  end

  def remove_book(isbn)
    @books.reject! { |book| book.isbn == isbn }
    save_books
  end

  def sort_books_by_isbn
    @books.sort_by!(&:isbn)
    save_books
  end

  private

  def create_file_if_not_exist
    FileUtils.touch(@file_path) unless File.exist?(@file_path)
  end

  def load_books
    @books = []
    if File.zero?(@file_path)
      puts "JSON file is empty."
    else
      File.truncate(@file_path, 0)
      puts "JSON file has been truncated."
    end
  end  

  def save_books
    File.open(@file_path, 'w') do |file|
      @books.each do |book|
        file.puts(book.to_json)
      end
    end
  end

  public

  def search_by_title(title)
    found_books = @books.select { |book| book.title.downcase.include?(title.downcase) }
    display_search_results(found_books, "Search results for '#{title}' in title:")
  end

  def search_by_author(author)
    found_books = @books.select { |book| book.author.downcase.include?(author.downcase) }
    display_search_results(found_books, "Search results for '#{author}' in author:")
  end

  def search_by_isbn(isbn)
    found_books = @books.select { |book| book.isbn.include?(isbn) }
    display_search_results(found_books, "Search results for '#{isbn}' in ISBN:")
  end

  private

  def display_search_results(books, message)
    puts message
    if books.empty?
      puts "No books found."
    else
      books.each do |book|
        puts "#{book.title} by #{book.author} (ISBN: #{book.isbn})"
      end
    end
  end
end

def display_menu
  puts "1. List all books"
  puts "2. Add a book"
  puts "3. Remove a book"
  puts "4. Sort books by ISBN"
  puts "5. Search by title"
  puts "6. Search by author"
  puts "7. Search by ISBN"
  puts "8. Exit"
end

inventory = Inventory.new('books.json')

loop do
  display_menu
  print "Select an option: "
  option = gets.chomp.to_i

  case option
  when 1
    inventory.list_books("Books Inventory")
  when 2
    print "Enter title: "
    title = gets.chomp
    print "Enter author: "
    author = gets.chomp
    print "Enter ISBN: "
    isbn = gets.chomp
    inventory.add_book(title, author, isbn)
  when 3
    print "Enter ISBN of the book to remove: "
    isbn = gets.chomp
    inventory.remove_book(isbn)
  when 4
    inventory.sort_books_by_isbn
    puts "Books sorted by ISBN."
  when 5
    print "Enter title to search: "
    title = gets.chomp
    inventory.search_by_title(title)
  when 6
    print "Enter author to search: "
    author = gets.chomp
    inventory.search_by_author(author)
  when 7
    print "Enter ISBN to search: "
    isbn = gets.chomp
    inventory.search_by_isbn(isbn)
  when 8
    puts "Exiting program..."
    break
  else
    puts "Invalid option. Please select a valid option."
  end

  puts ("-------------------------------------------------------------------------")
end
