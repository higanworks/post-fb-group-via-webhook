# coding: utf-8
require 'fb_graph'
require 'sinatra/base'
require 'uri'

class FBPoster < Sinatra::Base

  configure do
    disable :logging
  end

  get '/fbg/:page_id/:token' do |page_id, token|
    @group = FbGraph::Group.new(params[:page_id], access_token: params[:token])
    res = @group.feed! message: 'getchef blogの更新 via feedposter from zapier', link: params[:link]
  end

  get '/debug/:page_id/:token' do |page_id, token|
    @group = FbGraph::Group.new(ENV['FB_GID'], access_token: ENV['FB_ACCESS_TOKEN'])
    res = @group.feed! message: 'getchef blogの更新 via feedposter from zapier', link: params[:link]
  end
end
