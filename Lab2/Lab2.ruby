require 'date'

module Logger
  def log_info(message)
    log("info", message)
  end

  def log_warning(message)
    log("warning", message)
  end

  def log_error(message)
    log("error", message)
  end

  private

  def log(type, message)
    timestamp = DateTime.now.strftime('%Y-%m-%dT%H:%M:%S%:z')
    puts "#{timestamp} -- #{type} -- #{message}"
  end
end

class User
  attr_reader :name, :balance

  def initialize(name, balance)
    @name = name
    @balance = balance
  end

  def update_balance(amount)
    @balance += amount
  end
end

class Transaction
  attr_reader :user, :value

  def initialize(user, value)
    @user = user
    @value = value
  end
end

class Bank
  def process_transactions(transactions, &callback)
    raise NotImplementedError, "Subclasses must implement a process_transactions method"
  end
end

class CBABank < Bank
  include Logger

  def process_transactions(transactions, &callback)
    log_info("Processing Transactions #{transactions.map { |t| "#{t.user.name} transaction with value #{t.value}" }.join(', ')}...")
    
    transactions.each do |transaction|
      begin
        if transaction.user.balance + transaction.value < 0
          raise StandardError, "Not enough balance"
        end

        transaction.user.update_balance(transaction.value)

        if transaction.user.balance == 0
          log_warning("#{transaction.user.name} has 0 balance")
        end

        log_info("#{transaction.user.name} transaction with value #{transaction.value} succeeded")
        callback.call(true)
      rescue StandardError => e
        log_error("User #{transaction.user.name} transaction with value #{transaction.value} failed with message #{e.message}")
        callback.call(false)
      end
    end
  end
end

module Menu
  def display_menu
    puts "\n=== Start of Menu ==="
    puts "1. Process Transactions"
    puts "2. Exit"
    puts "=== End of Menu ==="
    print "\nEnter your choice: "
    gets.chomp.to_i
  end
end

class Application
  include Menu

  def initialize
    @users = [
      User.new("Ali", 200),
      User.new("Peter", 500),
      User.new("Manda", 100)
    ]
    @cba_bank = CBABank.new
  end

  def run
    puts "\nWelcome to the Zeinab Bank Application!"

    loop do
      case display_menu
      when 1
        process_transactions_menu
      when 2
        puts "\nThank you for using the Zeinab Bank Application. Goodbye!"
        break
      else
        puts "Invalid choice. Please try again."
      end
    end
  end

  private

  def process_transactions_menu
    puts "\nEnter transaction details for each user (user_index value)"
    puts "user_index : 0 for Ali , 1 for Peter , 2 for Manda"
    puts "or Enter 'done' to finish."
    transactions = []

    loop do
      print "> "
      input = gets.chomp
      break if input.downcase == 'done'

      user_index, value = input.split.map(&:to_i)
      user = @users[user_index]

      if user
        transactions << Transaction.new(user, value)
      else
        puts "Invalid user index. Please try again."
      end
    end

    @cba_bank.process_transactions(transactions) do |success|
      if success
        puts "Transactions processed successfully."
      else
        puts "Some transactions failed. Please check the logs for details."
      end
    end
  end
end

app = Application.new
app.run