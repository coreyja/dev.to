class TwilioTokensController < ApplicationController
  after_action(:verify_authorized)
  def show
    video_channel = params[:id].split("private-video-channel-")[1] if params[:id].start_with?("private-video-channel-")

    unless video_channel
      skip_authorization
      render(json: {
        status: "failure",
        token: @twilio_token,
      }, status: 404)
      return
    end

    @chat_channel = ChatChannel.find(video_channel.to_i)
    authorize(@chat_channel)
    @twilio_token = TwilioToken.new(current_user, params[:id]).get
    render(json: {
      status: "success",
      token: @twilio_token,
    }, status: 200)
  end
end
