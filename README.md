# Ruby on Rails Labs

![Inventory Management Program](https://github.com/ZeinabAbdelghaffar/Ruby-on-Rails/assets/87963230/eea767fe-41f5-45d9-85ec-d6ea96cfc490)

## Lab 1: Inventory Management Program

This Ruby program allows users to manage a simple inventory of books. Users can perform various operations on the inventory:

- **List all books**: Displays a list of all books in the inventory.
- **Add a book**: Adds a new book to the inventory.
- **Remove a book**: Removes a book from the inventory.
- **Sort books by ISBN**: Sorts all books in the inventory by ISBN.
- **Search by title**: Searches for books in the inventory by title.
- **Search by author**: Searches for books in the inventory by author.
- **Search by ISBN**: Searches for books in the inventory by ISBN.

## Lab 2: Bank Application

This Ruby program simulates a bank application where users can process transactions for different users. It includes the following features:

### Classes
- **Logger**: A module with methods for logging messages (`log_info`, `log_warning`, `log_error`) with timestamps and log types.
- **User**: A class representing a user with a name and balance instance variable.
- **Transaction**: A class representing a transaction with a user and value.
- **Bank**: An abstract class with a method `process_transactions(transactions, &callback)`.
- **CBABank**: A class that inherits from Bank and includes the Logger mixin. It implements the `process_transactions` method.

### CBABank Logic
- Logs processing of transactions.
- Checks if a transaction can make a user balance less than 0 and raises an exception if so.
- Logs a warning if a transaction makes the user balance 0.
- Logs success or failure of each transaction.
- Calls a callback block with the transaction result.

### Example Output
- 2024-05-11T01:00:13+03:00 -- info -- Processing Transactions...
- 2024-05-11T01:00:13+03:00 -- info -- User Ali transaction with value -20 succeeded
- 2024-05-11T01:00:13+03:00 -- warning -- Ali has 0 balance
- 2024-05-11T01:00:13+03:00 -- error -- User Ali transaction with value -100 failed with message Not enough balance

### Main Program
1. Creates instances of User representing bank users.
2. Creates an array of transactions.
3. Processes the transactions using CBABank and logs the results.
