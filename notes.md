The “Fresh Astrologer” trivia game

- Scrapes Rotten Tomatoes for Certified Fresh in-theaters movie titles at https://www.rottentomatoes.com/browse/cf-in-theaters/
- Displays all movie titles
- Asks CLI user which film they’re interested in and gets user input
- Receives movie title input
- Uses movie title to scrape corresponding Rotten Tomatoes page for lead actor's name
- Asks user if they would like to guess the lead actor’s name or pass this challenge. If “guess”, prompt user for name input. If “pass”, display actor’s name.
- Uses each actor’s name to scrape actor's Wikipedia page and parse page for actor’s birthday.
- Matches birthday to star sign (hard codes star signs and their date ranges)
- Asks user to guess actor’s star sign, and gets user input.
- If user input is correct, displays “win” message. If incorrect, display “try again” message which asks if user would like to guess again, choose another title, or exit the game.

Classes
- Movie
    - Has lead actor
    - Has title
- Actor
    - Belongs to movie
    - Has birthday
    - Has star sign
- CertifiedFreshAstrologer::CLI
    - Says hello
    - Lists movies
    - Gets movie
    - Gets actor
    - Gets star sign
    - Says goodbye
- Scraper
    - First #method scrapes Rotten Tomatoes Certified Fresh page
    - Second #method scrapes Rotten Tomatoes individual movie pages
    - Third #method scrapes actor's Wikipedia page 
