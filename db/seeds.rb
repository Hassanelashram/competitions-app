User.all.destroy_all
Competition.all.destroy_all
Participation.all.destroy_all

user = User.create!(
    email: "test@gmail.com",
    password: "hassan",
    password_confirmation: "hassan"
)

competition = Competition.create!(
    name: "Funny Videos",
    price_cents: 200,
    rule: "Make a funny video",
    image: "https://images.unsplash.com/photo-1507808973436-a4ed7b5e87c9?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1400&q=80",
    award: 20,
    max_entries: 10,
    end_date:  Date.today + 7 
)

competition2 = Competition.create!(
    name: "Funny Pet Portraits",
    price_cents: 200,
    rule: "Make a funny video",
    image: "https://images.unsplash.com/photo-1466921583968-f07aa80c526e?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80",
    award: 100,
    max_entries: 100,
    end_date:  Date.today + 7 
)

participation = Participation.create!(
    user_id: user.id,
    competition_id: competition.id,
    amount_cents: competition.price_cents
)

participation2 = Participation.create!(
    user_id: user.id,
    competition_id: competition2.id,
    amount_cents: competition2.price_cents
)

file = URI.open('https://images.unsplash.com/photo-1517423738875-5ce310acd3da?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1005&q=80')
participation.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
participation2.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')