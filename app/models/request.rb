class Request < ActiveRecord::Base

  belongs_to(
    :sender,
    class_name: "User",
    foreign_key: :sender_id,
    primary_key: :id
  )

  belongs_to(
    :responder,
    class_name: "User",
    foreign_key: :responder_id,
    primary_key: :id
  )

end
