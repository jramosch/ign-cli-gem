How to Build a CLI Gem

1. Plan your gem, imagine your interface
2. Start with the project structure - google
3. Start with the entry point - the file run
4. Force that to build the CLI interface
5. Stub out the interface
6. Start making things real
7. Discover objects.
8. Program

A command line interface for video games ranked via IGN.

User types "IGN"

-Ask user to choose a platform.

PLATFORMS
Numbered list
- All
- Xbox 360
- PS3
- PC
- Wii U
- 3DS
- Vita
- iPhone
- Xbox One
- PS4

GAME OPTIONS
Numbered list
- "Editor's Choice"
- "New Releases"
  --sort by release date
- "Top 10 Games"
  --sort by rating
- "Coming Soon"
  --"http://www.ign.com/upcoming/games"
- "Browse by platform"
  --list_platforms
- "Browse by genre"
  --list_genres
- "Browse by rating"
  --"Choose a rating from 1 to 10"

A game has a name, genre, platform, release date, rating, and url.

DISPLAY EX;
1. "Dragon Ball FighterZ - 8.5/10 - Playstation 4"

Need a scraper class to generated game objects with scraped information on each game from website.
