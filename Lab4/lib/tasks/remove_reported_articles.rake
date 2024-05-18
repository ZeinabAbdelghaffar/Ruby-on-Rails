namespace :articles do
  desc "Remove articles with 6 or more reports"
  task remove_reported: :environment do
    Article.where("reports_count >= ?", 6).destroy_all
    puts "Articles with 6 or more reports have been removed."
  end
end