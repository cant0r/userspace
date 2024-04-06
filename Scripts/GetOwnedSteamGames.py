import argparse
from Modules.SteamWebAPI.PlayerService import PlayerService


argumentParser = argparse.ArgumentParser(
    description="Retrieves all the games owned by the input SteamId"
)
argumentParser.add_argument(
    "-i", "--steam-id", help="The input SteamId.", required=True
)
argumentParser.add_argument(
    "-k", "--api-key", help="Your Steam Web API key", required=True
)

args = argumentParser.parse_args()
playerService = PlayerService(args.api_key)

print(f"Getting games owned by {args.steam_id}")

data = playerService.get_owned_games(args.steam_id, include_appinfo=True)["response"]
game_count = data["game_count"]
games = data["games"]

for index, game in enumerate(games):
    print(f"[{game_count}/{index + 1}] {game["name"]}")
