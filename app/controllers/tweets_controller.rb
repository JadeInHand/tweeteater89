class TweetsController < ApplicationController
	def index
		@tweets = Tweet.all
		render json: @tweets
	end

	def search
		@search_results=[]
		$client.search(params['searchKey'], :result_type => "recent").take(7).collect do |tweet|
			@search_results.push("#{tweet.text}")
		end

		render json: @search_results
	end
end
