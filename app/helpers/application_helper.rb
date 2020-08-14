module ApplicationHelper
  def user_avatar(user, size=40)
    if user.avatar.attached?
      user.avatar.variant(resize: "#{size}x#{size}!")
    else
      "https://ui-avatars.com/api/?background=0D8ABC&color=fff&name=#{user.name}"
    end
  end

  def topic_avatar(topic, size=40)
    if topic.avatar.attached?
      topic.avatar.variant(resize: "#{size}x#{size}!")
    else
      "https://ui-avatars.com/api/?background=0D8ABC&color=fff&name=#{topic.name}"
    end
  end
  def conditional_div(options={}, &block)
    if options.delete(:show_div)
      concat content_tag(:div, capture(&block), options)
    else
      concat capture(&block)
    end
  end
end
