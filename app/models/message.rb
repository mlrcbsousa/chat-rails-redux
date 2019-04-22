class Message < ApplicationRecord
  belongs_to :user
  belongs_to :channel

  validates :content, presence: true

  REACT_FORMAT = { methods: :author, except: %i[updated_at channel_id user_id] }

  def self.to_react(channel)
    where(channel: channel).as_json REACT_FORMAT
  end

  def to_react
    as_json REACT_FORMAT
  end

  def author
    user.email.split('@')[0]
  end
end
