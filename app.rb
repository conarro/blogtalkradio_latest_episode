require 'bundler'
Bundler.require
require_relative './blog_talk_page.rb'

get '/:show' do
  redirect BlogTalkPage.latest_episode_url(params['show'])
end

get '/health' do
  content_type :json
  {status: 'OK'}.to_json
end
