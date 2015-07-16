# create_table "connections", force: :cascade do |t|
#   t.integer  "user_id1",   null: false
#   t.integer  "user_id2",   null: false
#   t.datetime "created_at"
#   t.datetime "updated_at"
# end
#
# add_index "connections", ["user_id1"], name: "index_connections_on_user_id1", using: :btree
# add_index "connections", ["user_id2"], name: "index_connections_on_user_id2", using: :btree
#
# create_table "requests", force: :cascade do |t|
#   t.integer  "sender_id",    null: false
#   t.integer  "responder_id", null: false
#   t.datetime "created_at"
#   t.datetime "updated_at"
# end
#
# add_index "requests", ["responder_id"], name: "index_requests_on_responder_id", using: :btree
# add_index "requests", ["sender_id"], name: "index_requests_on_sender_id", using: :btree
#
# create_table "users", force: :cascade do |t|
#   t.string "email",           null: false
#   t.string "password_digest", null: false
#   t.string "fname",           null: false
#   t.string "lname"
#   t.string "session_token"
#   t.string "title"
#   t.string "employer"
#   t.text   "summary"
# end
password = BCrypt::Password.create("asdfasdf")
sennacy = User.create({
                        email: "sennacy@cats.com",
                        password_digest: password,
                        fname: "Sennacy",
                        lname: "Tamboer",
                        session_token: "sadfaewf",
                        title: "HairBall Developer",
                        summary: "Hi my name is Sennacy."
                      })
sennacy = User.create({
                      email: "rocky@cats.com",
                      password_digest: password,
                      fname: "Rocky",
                      lname: "Top",
                      session_token: "gfhdjfsg",
                      title: "Meowologist",
                      summary: "Meow"
                    })

sennacy = User.create({
                        email: "gizmo@cats.com",
                        password_digest: password,
                        fname: "Gizmo",
                        lname: "Rountree ",
                        session_token: "5esgserg",
                        title: "Cat Painter",
                        summary: "I draw cats!"
                      })
sennacy = User.create({
                        email: "poncho@cats.com",
                        password_digest: password,
                        fname: "Poncho",
                        lname: "Gonzales",
                        session_token: "rsesdsa",
                        title: "Ball Player",
                        summary: "I play ball"
                      })
Connection.create({user_id1: 1, user_id2: 2})
Connection.create({user_id1: 2, user_id2: 1})
Connection.create({user_id1: 3, user_id2: 4})
Connection.create({user_id1: 4, user_id2: 3})
Connection.create({user_id1: 1, user_id2: 4})
Connection.create({user_id1: 4, user_id2: 1})
Connection.create({user_id1: 1, user_id2: 3})
Connection.create({user_id1: 3, user_id2: 1})
