namespace :twitter do
	desc "Clears the user and the tweet tables"
	task :clear => :environment do
		User.destroy_all
		Tweet.destroy_all
	end

	desc "Creates fake Twitter posts and users"
	task :posts, [:user_count] => :environment do |t, args|
		FactoryGirl.create_list :user_with_tweets, args[:user_count].to_i
		puts "Users: #{ User.count }, tweets: #{ Tweet.count }"
	end

	desc "Fetches a number of tweets and inserts them into DB"
	task :search, [:query, :limit] => :environment do |t, args|
		$client.search(args[:query], :result_type => "recent").take(args[:limit].to_i).collect do |tweet|
			puts "#{tweet.text}"
			Tweet.create(:post => "#{tweet.text}")
		end
		# Fetch limit number of tweets matching query from Twitter and insert them into the DB
		# Don't bother creating users.
	end	
end

# rake twitter:search[butterfly,80] should get 80 butterfly tweets