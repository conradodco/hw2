# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
# TODO!

Movie.destroy_all
Role.destroy_all
Studio.destroy_all
Actor.destroy_all

# Generate models and tables, according to the domain model.
# TODO!

# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.

#######################################

actor_new = Actor.create(name: "Christian Bale")

actor_new = Actor.create(name: "Michael Caine")

actor_new = Actor.create(name: "Liam Neeson")

actor_new = Actor.create(name: "Katie Holmes")

actor_new = Actor.create(name: "Gary Oldman")

actor_new = Actor.create(name: "Heath Ledger")

actor_new = Actor.create(name: "Aaron Eckhart")

actor_new = Actor.create(name: "Maggie Gyllenhaal")

actor_new = Actor.create(name: "Tom Hardy")

actor_new = Actor.create(name: "Joseph Gordon-Levitt")

actor_new = Actor.create(name: "Anne Hathaway")

#######################################

studio_new = Studio.new
studio_new["name"] = "Warner Bros."
studio_new.save

#######################################

warner = Studio.find_by({"name" => "Warner Bros."})

#######################################

movie_new = Movie.new
movie_new["title"] = "Batman Begins"
movie_new["year_released"] = 2005
movie_new["rated"] = "PG-13"
movie_new["studio_id"] = warner["id"]
movie_new.save

movie_new = Movie.new
movie_new["title"] = "The Dark Night"
movie_new["year_released"] = 2008
movie_new["rated"] = "PG-13"
movie_new["studio_id"] = warner["id"]
movie_new.save

movie_new = Movie.new
movie_new["title"] = "The Dark Night Rises"
movie_new["year_released"] = 2012
movie_new["rated"] = "PG-13"
movie_new["studio_id"] = warner["id"]
movie_new.save

#######################################

begins = Movie.find_by({"title" => "Batman Begins"})
knight = Movie.find_by({"title" => "The Dark Night"})
rises = Movie.find_by({"title" => "The Dark Night Rises"})

bale = Actor.find_by({"name" => "Christian Bale"})
caine = Actor.find_by({"name" => "Michael Caine"})
neeson = Actor.find_by({"name" => "Liam Neeson"})
holmes = Actor.find_by({"name" => "Katie Holmes"})
oldman = Actor.find_by({"name" => "Gary Oldman"})
ledger = Actor.find_by({"name" => "Heath Ledger"})
eckhart = Actor.find_by({"name" => "Aaron Eckhart"})
maggie = Actor.find_by({"name" => "Maggie Gyllenhaal"})
hardy = Actor.find_by({"name" => "Tom Hardy"})
joseph = Actor.find_by({"name" => "Joseph Gordon-Levitt"})
hathaway = Actor.find_by({"name" => "Anne Hathaway"})

#######################################

role_new = Role.new
role_new["character_name"] = "Bruce Wayne"
role_new["movie_id"] = begins["id"]
role_new["actor_id"] = bale["id"]
role_new.save

role_new = Role.new
role_new["character_name"] = "Alfred"
role_new["movie_id"] = begins["id"]
role_new["actor_id"] = caine["id"]
role_new.save

role_new = Role.new
role_new["character_name"] = "Ra's Al Ghul"
role_new["movie_id"] = begins["id"]
role_new["actor_id"] = neeson["id"]
role_new.save

role_new = Role.new
role_new["character_name"] = "Rachel Dawes"
role_new["movie_id"] = begins["id"]
role_new["actor_id"] = holmes["id"]
role_new.save

role_new = Role.new
role_new["character_name"] = "Commissioner Gordon"
role_new["movie_id"] = begins["id"]
role_new["actor_id"] = oldman["id"]
role_new.save

role_new = Role.new
role_new["character_name"] = "Bruce Wayne"
role_new["movie_id"] = knight["id"]
role_new["actor_id"] = bale["id"]
role_new.save

role_new = Role.new
role_new["character_name"] = "Joker"
role_new["movie_id"] = knight["id"]
role_new["actor_id"] = ledger["id"]
role_new.save

role_new = Role.new
role_new["character_name"] = "Harvey Dent"
role_new["movie_id"] = knight["id"]
role_new["actor_id"] = eckhart["id"]
role_new.save

role_new = Role.new
role_new["character_name"] = "Alfred"
role_new["movie_id"] = knight["id"]
role_new["actor_id"] = caine["id"]
role_new.save

role_new = Role.new
role_new["character_name"] = "Rachel Dawes"
role_new["movie_id"] = knight["id"]
role_new["actor_id"] = maggie["id"]
role_new.save

role_new = Role.new
role_new["character_name"] = "Bruce Wayne"
role_new["movie_id"] = rises["id"]
role_new["actor_id"] = bale["id"]
role_new.save

role_new = Role.new
role_new["character_name"] = "Commissioner Gordon"
role_new["movie_id"] = rises["id"]
role_new["actor_id"] = oldman["id"]
role_new.save

role_new = Role.new
role_new["character_name"] = "Bane"
role_new["movie_id"] = rises["id"]
role_new["actor_id"] = hardy["id"]
role_new.save

role_new = Role.new
role_new["character_name"] = "John Blake"
role_new["movie_id"] = rises["id"]
role_new["actor_id"] = joseph["id"]
role_new.save

role_new = Role.new
role_new["character_name"] = "Selina Kyle"
role_new["movie_id"] = rises["id"]
role_new["actor_id"] = hathaway["id"]
role_new.save

# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output.
# TODO!


movies = Movie.joins(:studio).select("movies.title, movies.year_released, movies.rated, studios.name")

for movie in movies 
      puts "#{movie.title}\t#{movie.year_released}\t#{movie.rated}\t#{movie.name}\n"
end



# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.
# TODO!
