class ReadNotificationsService
  def initialize(receiver)
    @receiver = receiver
  end

  def mark_as_read
    NotificationCounter.new(@receiver).set_to_zero

    # remove_notifications(@recipient.id)
    "read"
  end
end
