class SlackChannelsController < ApplicationController

  get '/' do
    @slack_channels = SlackChannel.all
    erb :"slack_channels/index"
  end

  patch '/slack_channels/:slack_id' do
    @slack_channel = SlackChannel.find_by(:slack_id => params[:slack_id])
    @slack_channel.update(params[:slack_channel])

    if request.xhr?
      content_type :json
      @slack_channel.to_json
    else
      redirect "/slack_channels/#{@slack_channel.slack_id}"
    end
  end

end