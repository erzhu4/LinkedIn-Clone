
password = BCrypt::Password.create("asdfasdf")

sennacy = User.create({
                        email: "sennacy@cats.com",
                        password_digest: password,
                        fname: "Sennacy",
                        lname: "TheGreat",
                        session_token: "sadfaewf",
                        title: "HairBall developer",
                        summary: "Hi my name is Sennacy, I am app academy's number one cat. Hire me!!."
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
                        title: "Cat painter",
                        summary: "I draw cats!"
                      })
sennacy = User.create({
                        email: "poncho@cats.com",
                        password_digest: password,
                        fname: "Poncho",
                        lname: "Gonzales",
                        session_token: "rsesdsa",
                        title: "Ball player",
                        summary: "I play ball"
                      })
sennacy = User.create({
                        email: "garr@cats.com",
                        password_digest: password,
                        fname: "Garr",
                        lname: "Field",
                        session_token: "rsesdsa",
                        title: "Face scratcher",
                        summary: "I Scratch up people's faces when they least expect it."
                      })
sennacy = User.create({
                        email: "scottie@cats.com",
                        password_digest: password,
                        fname: "Scottie",
                        lname: "Ogden",
                        session_token: "rsesdsa",
                        title: "Cattar(guitar for cats) player",
                        summary: "Musicallity is virtue!"
                      })
sennacy = User.create({
                        email: "darth@cats.com",
                        password_digest: password,
                        fname: "Darth",
                        lname: "Vadar",
                        session_token: "rsesdsa",
                        title: "Sith Lord",
                        summary: "I'm your father."
                      })
sennacy = User.create({
                        email: "mack@cats.com",
                        password_digest: password,
                        fname: "Mack",
                        lname: "Encheez",
                        session_token: "rsesdsa",
                        title: "Cheese eater",
                        summary: "Never underestimate the power of the cheese."
                      })
sennacy = User.create({
                        email: "wye@cats.com",
                        password_digest: password,
                        fname: "Wye",
                        lname: "Fye",
                        session_token: "rsesdsa",
                        title: "Comcats wifi technician",
                        summary: "I am a skilled professional in the world of analogue electronics!"
                      })
sennacy = User.create({
                        email: "bart@cats.com",
                        password_digest: password,
                        fname: "Bart",
                        lname: "Ender",
                        session_token: "rsesdsa",
                        title: "Comedian",
                        summary: "I make people laugh."
                      })
sennacy = User.create({
                        email: "eric@zhu.com",
                        password_digest: password,
                        fname: "Eric",
                        lname: "Zhu",
                        session_token: "sadfaewf",
                        title: "Web developer",
                        summary: "I am the creater of this app."
                      })
Connection.create({user_id1: 1, user_id2: 2})
Connection.create({user_id1: 2, user_id2: 1})
Connection.create({user_id1: 3, user_id2: 4})
Connection.create({user_id1: 4, user_id2: 3})
Connection.create({user_id1: 1, user_id2: 4})
Connection.create({user_id1: 4, user_id2: 1})
Connection.create({user_id1: 1, user_id2: 3})
Connection.create({user_id1: 3, user_id2: 1})
Connection.create({user_id1: 1, user_id2: 5})
Connection.create({user_id1: 5, user_id2: 1})
Connection.create({user_id1: 1, user_id2: 6})
Connection.create({user_id1: 6, user_id2: 1})
Connection.create({user_id1: 2, user_id2: 6})
Connection.create({user_id1: 6, user_id2: 2})
Connection.create({user_id1: 3, user_id2: 6})
Connection.create({user_id1: 6, user_id2: 3})
Connection.create({user_id1: 5, user_id2: 6})
Connection.create({user_id1: 6, user_id2: 5})
Connection.create({user_id1: 7, user_id2: 6})
Connection.create({user_id1: 6, user_id2: 7})
Connection.create({user_id1: 7, user_id2: 8})
Connection.create({user_id1: 8, user_id2: 7})
Connection.create({user_id1: 7, user_id2: 9})
Connection.create({user_id1: 9, user_id2: 7})
Connection.create({user_id1: 7, user_id2: 3})
Connection.create({user_id1: 3, user_id2: 7})
Connection.create({user_id1: 7, user_id2: 4})
Connection.create({user_id1: 4, user_id2: 7})
Connection.create({user_id1: 7, user_id2: 5})
Connection.create({user_id1: 5, user_id2: 7})
Connection.create({user_id1: 8, user_id2: 1})
Connection.create({user_id1: 1, user_id2: 8})
Connection.create({user_id1: 8, user_id2: 5})
Connection.create({user_id1: 5, user_id2: 8})
Connection.create({user_id1: 8, user_id2: 6})
Connection.create({user_id1: 6, user_id2: 8})
Connection.create({user_id1: 8, user_id2: 9})
Connection.create({user_id1: 9, user_id2: 8})
Connection.create({user_id1: 8, user_id2: 3})
Connection.create({user_id1: 3, user_id2: 8})
Connection.create({user_id1: 3, user_id2: 9})
Connection.create({user_id1: 9, user_id2: 3})
Connection.create({user_id1: 4, user_id2: 9})
Connection.create({user_id1: 9, user_id2: 4})
Connection.create({user_id1: 4, user_id2: 10})
Connection.create({user_id1: 10, user_id2: 4})
Connection.create({user_id1: 4, user_id2: 11})
Connection.create({user_id1: 11, user_id2: 4})

Experience.create({
    user_id: 1,
    title: "Hairball tester",
    employer: "Fuzz inc",
    description: "Tested the specs of hairballs to ensure product durability.",
    start_date: "2015-03-24"
})

Experience.create({
    user_id: 1,
    title: "Hairball roller",
    employer: "Fuzz inc",
    description: "Roller of final fuzzballs to ensure no production defects.",
    start_date: "2014-03-24",
    end_date: "2015-01-14"
})

Experience.create({
    user_id: 2,
    title: "Head of research",
    employer: "Meowological Research Firm",
    description: "Lead team of researchers in the study of how to produce the best meow",
    start_date: "2012-03-24",
})

Experience.create({
    user_id: 3,
    title: "Freelance painter",
    employer: "Self Employment",
    description: "Expereinced painter, please contact to set up appointment!"
})

Experience.create({
    user_id: 3,
    title: "Cashier",
    employer: "Kittens R Us",
    description: "Cashiered for many months. Gained many skills in counting!",
    start_date: "2012-03-24",
    end_date: "2014-06-14"
})

Experience.create({
    user_id: 4,
    title: "Overnight stocker",
    employer: "Kittens R Us",
    description: "Lots and lots of manual labor and hard work.",
    start_date: "2014-07-24",
    end_date: "2015-06-14"
})

Experience.create({
    user_id: 5,
    title: "Actor",
    employer: "Itchie and Scratchie's Reality Show",
    description: "Acted in a reality show involving scratching people's faces out of nowhere.",
    start_date: "2014-10-24"
})

Experience.create({
    user_id: 5,
    title: "Instructor",
    employer: "Carate Dojo",
    description: "Instructor and black belt certifier.",
    start_date: "2010-10-24",
    end_date: "2015-06-14"
})

Experience.create({
    user_id: 6,
    title: "Musician",
    employer: "The Aristacats",
    description: "Front man of the popular band The Aristacats."
})

Experience.create({
    user_id: 7,
    title: "Recruiter",
    employer: "The Dark Side",
    description: "Join the dark side!",
    start_date: "2012-10-24"
})

Experience.create({
    user_id: 9,
    title: "Wifi technician",
    employer: "ComCats",
    description: "Repaired receiver components and assisted in system installation.",
    start_date: "2010-10-24"
})

Experience.create({
    user_id: 9,
    title: "Manager",
    employer: "Wacky Joe's Ice Cream",
    description: "Buy and sell ice cream for all the hungry kittens",
    start_date: "2010-10-24",
    end_date: "2012-09-14"
})

Experience.create({
    user_id: 11,
    title: "Assembly Engineer",
    employer: "Volkswagen Group of America",
    description: "Worked on exterior quality improvement projects",
    start_date: "2013-10-24",
})
  # create_table "experiences", force: :cascade do |t|
  #   t.integer "user_id"
  #   t.string  "title"
  #   t.string  "employer"
  #   t.text    "description"
  #   t.date    "start_date"
  #   t.date    "end_date"
  # end
