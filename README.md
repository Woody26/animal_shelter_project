# Animal Shelter Project

This is a web app to handle the adoption of animals, adding new animals admitted to the shelter and editing animal/customer adoption details. 

It uses PSQL, Ruby, the Ruby package for PSQL - 'pg', the Ruby debugging package 'pry'. Sinatra is the web framework that was used through the Ruby packages 'sinatra' and 'sinatra/contrib/all'. 


# Running the Animal Shelter Project

To run the project, open the Terminal and carry out the following steps:
1.) Navigate to the 'animal_shelter' directory
2.) Type 'psql -d animal_shelter -f db/animal_shelter.sql' to run the SQL file
3.) Type 'ruby db/seeds.rb' to run the seeds file
Note: Type '!!!' to exit 'pry'.
4.) Type 'ruby app.rb' to run the main app.

Once sucessfully running, you will be given a port that is being used. 

Note: The port number in the below example is '4567' - please change to the port you are provided in the previous step.
Open a browser or new tab and type 'http://localhost:4567/animal_shelter'

The home page of the app will display. 
