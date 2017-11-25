# easy-plex-media-server-in-linux

This is based on the excellent Docker build https://github.com/plexinc/pms-docker and packages it with some nice conveniences to aid getting running rather quickly.

It takes less than 5 minutes to have your Plex Server up and running!

## Configuration

- `export-configs.sh` - Configure env vars passed to the Docker container (and ultimately, your Plex Server).

- `PLEX_TZ` Set the timezone inside the container. For example: `Europe/London`. The complete list can be found here: https://en.wikipedia.org/wiki/List_of_tz_database_time_zones
- `PLEX_CLAIM` You can obtain a claim token to login your server to your plex account by visiting https://www.plex.tv/claim
- `PLEX_HOST_IP` Set the IP of your Plex server.
- `PLEX_DATA_PATH` Where Plex server config and transcoding data will sit.  You'll want to back this up regularly.
- `PLEX_DEFAULT_LIBRARY` Library exposed to the Plex Server.
- Allow `tcp` access to port `32400` as this is the primary port that Plex uses for communication and is required for Plex Media Server to operate. If you're running a firewall, say `ufw`, you'll need to allow access with `sudo ufw allow 32400/tcp`.

## Usage

Running the server is simple,

```
$ make run
```

You can also execute `make stop` to remove the container at any time.  Troubleshoot any issues with `docker logs plex`.

## Caveats / TODO

- Replace `run-plex-server.sh` with a `docker-compose.yml` file instead; use this template - https://github.com/plexinc/pms-docker/blob/master/docker-compose-bridge.yml.template

Feel free to contribute to this repo

## Contributing

If you want to contribute, your help is very welcome.  Constructive, helpful bug reports, feature requests and the noblest of all contributions: a good, clean pull request &mdash; are most appreciated!

### How to make a clean pull request

- Create a personal fork of the project on Github.
- Clone the fork on your local machine. Your remote repo on Github is called `origin`.
- Add the original repository as a remote called `upstream`.
- If you created your fork a while ago be sure to pull upstream changes into your local repository.
- Create a new branch to work on! Branch from `dev` if it exists, else from `master`.
- Implement/fix your feature, comment your code.
- Follow the code style of the project, including indentation.
- If the project has tests run them!
- Write or adapt tests as needed.
- Add or change the documentation as needed.
- Squash your commits into a single commit with git's [interactive rebase](https://help.github.com/articles/interactive-rebase). Create a new branch if necessary.
- Push your branch to your fork on Github, the remote `origin`.
- From your fork open a pull request in the correct branch. Target the project's `dev` branch if there is one, else go for `master`!
- …
- If the maintainer requests further changes just push them to your branch. The PR will be updated automatically.
- Once the pull request is approved and merged you can pull the changes from `upstream` to your local repo and delete
your extra branch(es).

And last but not least: Always write your commit messages in the present tense. Your commit message should describe what the commit, when applied, does to the code – not what you did to the code.

## License

This project is licensed under the terms of the MIT License.