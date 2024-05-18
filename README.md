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

## Lab 3: Getting Started with Rails

This lab follows the steps outlined in the [Getting Started with Rails guide](https://guides.rubyonrails.org/getting_started.html) to create a simple blog application.

### Chapters Covered:

<table>
  <thead>
    <tr>
      <th>Chapter</th>
      <th>Sections Covered</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>1. Creating a New Rails Project</td>
      <td>1.1 Installing Rails <br> 1.2 Creating the Blog Application</td>
    </tr>
    <tr>
      <td>2. Hello, Rails!</td>
      <td>2.1 Starting Up the Web Server <br> 2.2 Say "Hello", Rails <br> 2.3 Setting the Application Home Page</td>
    </tr>
    <tr>
      <td>3. Autoloading</td>
      <td></td>
    </tr>
    <tr>
      <td>4. MVC and You</td>
      <td>4.1 Generating a Model <br> 4.2 Database Migrations <br> 4.3 Using a Model to Interact with the Database <br> 4.4 Showing a List of Articles</td>
    </tr>
    <tr>
      <td>5. CRUDit Where CRUDit Is Due</td>
      <td>5.1 Showing a Single Article <br> 5.2 Resourceful Routing <br> 5.3 Creating a New Article <br> 5.4 Updating an Article <br> 5.5 Deleting an Article</td>
    </tr>
    <tr>
      <td>6. Adding a Second Model</td>
      <td>6.1 Generating a Model <br> 6.2 Associating Models <br> 6.3 Adding a Route for Comments <br> 6.4 Generating a Controller</td>
    </tr>
    <tr>
      <td>7. Refactoring</td>
      <td>7.1 Rendering Partial Collections <br> 7.2 Rendering a Partial Form <br> 7.3 Using Concerns</td>
    </tr>
    <tr>
      <td>8. Deleting Comments</td>
      <td>8.1 Deleting Associated Objects</td>
    </tr>
  </tbody>
</table>

### Creating the Blog Application

After installing Rails, you can create a new Rails application by running the following command in your terminal:

```bash
$ rails new blog
```

- This will create a new directory called blog and generate the necessary files and folders for a Rails application. Here's a basic rundown of the function of each of the files and folders that Rails creates by default:

<table>
  <thead>
    <tr>
      <th>Chapter</th>
      <th>Sections Covered</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>1. Creating a New Rails Project</td>
      <td>1.1 Installing Rails <br> 1.2 Creating the Blog Application</td>
    </tr>
    <tr>
      <td>2. Hello, Rails!</td>
      <td>2.1 Starting Up the Web Server <br> 2.2 Say "Hello", Rails <br> 2.3 Setting the Application Home Page</td>
    </tr>
    <tr>
      <td>3. Autoloading</td>
      <td></td>
    </tr>
    <tr>
      <td>4. MVC and You</td>
      <td>4.1 Generating a Model <br> 4.2 Database Migrations <br> 4.3 Using a Model to Interact with the Database <br> 4.4 Showing a List of Articles</td>
    </tr>
    <tr>
      <td>5. CRUDit Where CRUDit Is Due</td>
      <td>5.1 Showing a Single Article <br> 5.2 Resourceful Routing <br> 5.3 Creating a New Article <br> 5.4 Updating an Article <br> 5.5 Deleting an Article</td>
    </tr>
    <tr>
      <td>6. Adding a Second Model</td>
      <td>6.1 Generating a Model <br> 6.2 Associating Models <br> 6.3 Adding a Route for Comments <br> 6.4 Generating a Controller</td>
    </tr>
    <tr>
      <td>7. Refactoring</td>
      <td>7.1 Rendering Partial Collections <br> 7.2 Rendering a Partial Form <br> 7.3 Using Concerns</td>
    </tr>
    <tr>
      <td>8. Deleting Comments</td>
      <td>8.1 Deleting Associated Objects</td>
    </tr>
  </tbody>
</table>


### Summary:
This lab provides a comprehensive introduction to Ruby on Rails, covering key concepts like MVC architecture, model generation, database interactions, routing, and basic security considerations. By following the steps in this guide, you will have created a functional blog application that demonstrates the core principles of Rails development.


## Lab 4: Blog Application with Authentication and Reporting

This lab extends the functionality of the blog application created in Lab 3 to include user authentication, article reporting, and automated tasks using Rake and the Whenever gem.

### Features Implemented:

#### User Authentication:
- Users can register for a new account.
- Registered users can log in to the application.
- using **username** `Zeinab` and **password** `123123123`.
- User authentication is required for creating, editing, and deleting articles.

#### Article Management:
- Users can create multiple articles.
- Articles can be read by all users, but only the author can edit or delete them.
- Authors can add images to their articles.

#### Reporting Articles:
- Users can report articles they find inappropriate.
- The application tracks the number of reports each article receives (`reports_count` column).

#### Article Archiving:
- Articles with 3 or more reports are automatically archived using a callback.

#### Bonus Tasks:
- **Rake Task for Removing Articles**: Implemented a Rake task to remove articles with 6 or more reports.
- **Cronjob with Whenever Gem**: Scheduled the Rake task to run every 5 minutes using the Whenever gem.

#### Output
![image](https://github.com/ZeinabAbdelghaffar/Ruby-on-Rails/assets/87963230/9b347aa4-6c2b-4036-bd40-13884b3e7866)
![image](https://github.com/ZeinabAbdelghaffar/Ruby-on-Rails/assets/87963230/3fc2e872-6056-4673-993e-84ed0d9b2a47)
![image](https://github.com/ZeinabAbdelghaffar/Ruby-on-Rails/assets/87963230/160b466a-9789-4cb3-9b20-b467a60bb9e4)
![image](https://github.com/ZeinabAbdelghaffar/Ruby-on-Rails/assets/87963230/110096b0-bad5-44a9-b890-d016aebc84de)
![image](https://github.com/ZeinabAbdelghaffar/Ruby-on-Rails/assets/87963230/6c42e912-bad9-4be9-92e4-a3d750fd93d6)
![image](https://github.com/ZeinabAbdelghaffar/Ruby-on-Rails/assets/87963230/422aded8-0b33-4fcc-bda0-9f6d479ad7b8)
![image](https://github.com/ZeinabAbdelghaffar/Ruby-on-Rails/assets/87963230/fce357b5-8746-4d85-9746-ccfadd53b502)
![image](https://github.com/ZeinabAbdelghaffar/Ruby-on-Rails/assets/87963230/c1c33227-6810-4a0a-91e4-9dd7e5b1bf93)
![image](https://github.com/ZeinabAbdelghaffar/Ruby-on-Rails/assets/87963230/3b989b67-8ef3-4f8f-bc2b-e13c49123573)
![image](https://github.com/ZeinabAbdelghaffar/Ruby-on-Rails/assets/87963230/2f0ffbf8-d91c-447c-bd9e-c5dc70341c82)
![image](https://github.com/ZeinabAbdelghaffar/Ruby-on-Rails/assets/87963230/ae9dc507-39b6-4c93-8183-28c7754a097d)
![image](https://github.com/ZeinabAbdelghaffar/Ruby-on-Rails/assets/87963230/7b60cb83-0862-406e-8aed-254299d99132)
![image](https://github.com/ZeinabAbdelghaffar/Ruby-on-Rails/assets/87963230/3600c720-6e7e-4b73-be85-fd2c90be9256)
![image](https://github.com/ZeinabAbdelghaffar/Ruby-on-Rails/assets/87963230/87519273-90d5-4df4-904c-0c92d5767bbc)
