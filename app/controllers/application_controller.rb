
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  #Create
  get '/articles/new' do
    @article = Article.new
    erb :new
  end

  post '/articles' do
    @article = Article.create(title: params[:title], content: params[:content])
    redirect :"/articles/#{@article.id}"
  end


  #Read
  get '/articles' do
    @articles = Article.all
    erb :index
  end

  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end


  #Update

  get '/articles/:id/edit' do
  @article = Article.find(params[:id])
  erb :edit
end

patch '/articles/:id' do
  @article = Article.find(params[:id])
  @article.update(params[:article])
  redirect :"/articles/#{@article.id}"
end


  #Delete

  delete '/articles/:id' do
    Article.delete(params[:id])
    redirect to "/articles"
  end

end
