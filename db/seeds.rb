# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Team.create({name: "Atlanta Hawks", abv_code: "ATL", location: "Atlanta", logo_image: "https://cdn.vox-cdn.com/thumbor/JKbpgqUD0jF6NpLodiTBzzw6YLs=/800x0/filters:no_upscale()/cdn.vox-cdn.com/uploads/chorus_asset/file/8576931/8452_atlanta_hawks_alternate_2016.png", id: 0})
Team.create({name: "Boston Celtics", abv_code: "BOS", location: "Boston", logo_image: "https://s3.amazonaws.com/freebiesupply/large/2x/boston-celtics-logo-transparent.png"})
Team.create({name: "Chicago Bulls", abv_code: "CHI", location: "Chicago", logo_image: "https://vignette.wikia.nocookie.net/logopedia/images/d/d3/200px-Chicago_Bulls_logo_svg.png/revision/latest?cb=20100915185845", id: 1})
Team.create({name: "Cleveland Cavaliers", abv_code: "CLE", location: "Cleveland", logo_image: "https://www.cavaliersteamshop.com/content/images/thumbs/0029447_cavs-global-shield-pin_350.jpeg", id: 2})
Team.create({name: "Denver Nuggets", abv_code: "DEN", location: "Denver", logo_image: "http://i.cdn.turner.com/drp/nba/nuggets/sites/default/files/styles/logo/public/dn-sitelogo-pickaxe-105x105.png?itok=Y2Iq_8Lf", id: 3})
Team.create({name: "Golden State Warriors", abv_code: "GSW", location: "Oakland", logo_image: "https://usatftw.files.wordpress.com/2016/05/logo-golden-state-warriors1.png?w=516&h=504", id: 4})


User.create({name: "Jim", email: "j@gmail.com", password_digest: "abc"})




#models, associations, data in seed file, API routes in routes file (user#index..) and being able to see them in browser