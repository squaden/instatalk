class UserPresenceChannel < ApplicationCable::Channel
  def subscribed
    logger.info 'Subscribed to UserPresenceChannel'

    stream_from 'user_presence_channel'

    speak('is_online' => true)
  end

  def unsubscribed
    logger.info 'Unsubscribed to UserPresenceChannel'

    speak('is_online' => false)
  end

  def speak(data)
    logger.info "UserPresenceChannel, speak: #{data.inspect}"

    UserService.new(user: current_user, is_online: data['is_online']).perform
  end
end
