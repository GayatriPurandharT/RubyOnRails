require "httparty"
class Ps1::GooglenewsController < ApplicationController
  include HTTParty
  base_uri 'https://newsapi.org/v2'
  format :json

  http_proxy ENV['http_addr'], ENV['http_port']


  def news
    @result = self.class.get('/top-headlines?sources=google-news&apiKey=0715c830e7c44e20898027980047ead2')
    @status = @result['articles']
    @n = @result['totalResults']
    @result2 = self.class.get('/everything?p=world-news&sources=bbc-news&apiKey=0715c830e7c44e20898027980047ead2')
    @status2 = @result2['articles']

    # puts @status[0]['title']
  end
end


