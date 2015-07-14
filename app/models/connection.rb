class Connection < ActiveRecord::Base
  validates :user_id1, :user_id2, presence: true

  belongs_to(
    :user1,
    class_name: "User",
    foreign_key: :user_id1,
    primary_key: :id
  )

  belongs_to(
    :user2,
    class_name: "User",
    foreign_key: :user_id2,
    primary_key: :id
  )

end
