
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

Experience.create({
    user_id: 1,
    title: "Hairball tester",
    employer: "Fuzz inc",
    description: "I tested the specs of hairballs",
  })
  # create_table "experiences", force: :cascade do |t|
  #   t.integer "user_id"
  #   t.string  "title"
  #   t.string  "employer"
  #   t.text    "description"
  #   t.date    "start_date"
  #   t.date    "end_date"
  # end
