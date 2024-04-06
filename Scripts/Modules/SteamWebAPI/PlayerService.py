#!/usr/bin/env python

from . import STEAM_WEB_API_URL, STEAM_WEB_API_VERSION

import requests


class PlayerService:
    def __init__(self, api_key: str = "") -> None:
        self.requestSession = requests.Session()
        self.endpoint = f"{STEAM_WEB_API_URL}/IPlayerService"
        self.api_key = api_key

    def get_owned_games(
        self,
        steam_id: int,
        include_appinfo: bool = False,
        include_played_free_games: bool = False,
        include_free_sub: bool = False,
        skip_unvetted_apps: bool = "false",
        language: str = "en_US",
        include_extended_appinfo: bool = False,
    ):
        payload = {
            "key": self.api_key,
            "steamid": steam_id,
            "include_appinfo": include_appinfo,
            "include_played_free_games": include_played_free_games,
            "include_free_sub": include_free_sub,
            "skip_unvetted_apps": skip_unvetted_apps,
            "language": language,
            "include_extended_appinfo": include_extended_appinfo,
            "format": "json",
        }

        try:
            response = self.requestSession.get(
                f"{self.endpoint}/GetOwnedGames/{STEAM_WEB_API_VERSION}", params=payload
            )
            response.raise_for_status()
            return response.json()

        except requests.HTTPError as httpException:
            print(f"{httpException.response.text}")
            exit(1)


if __name__ == "__main__":
    print("You cannot invoke this module directly!")
    exit(1)
