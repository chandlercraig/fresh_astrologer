The “Certified Fresh Astrologer” trivia game

- Scrapes Rotten Tomatoes for Certified Fresh in-theaters movie titles at https://www.rottentomatoes.com/browse/cf-in-theaters/
- Displays all titles
- Asks CLI user which film they’d like to play the game with, and request input
- Receives movie title input
- Uses movie title to query MediaWiki API and parse page for director’s name
- Asks user if they would like to guess the director’s name or pass this challenge. If “guess”, prompt user for name input. If “pass”, display director’s name.
- Uses each director’s name to query MediaWiki API and parse page for director’s birthday.
- Matches birthday to star sign (hard code star signs)
- Asks user to guess director’s star sign, and request input.
- If correct, displays “win” message. If incorrect, display “try again” message which asks if user would like to guess again, choose another title, or exit the game.

Classes
- Movie
    - belongs to director
    - has title
- Director
    - has movie
    - has birthday
    - has star sign
- CertifiedFreshAstrologer::CLI
- Scraper
- API
