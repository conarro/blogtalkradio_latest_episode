require 'httparty'
require 'nokogiri'

class BlogTalkPage
  include HTTParty

  base_uri 'http://www.blogtalkradio.com'

  def self.latest_episode_url(show)
    page = get("/#{show}")
    doc  = Nokogiri::HTML(page)
    node = doc.at_css('.episode-container .episode-details a[itemprop="url"]')
    url  = node['href']

    url.include?('http') ? url : File.join(base_uri, url)
  end
end
