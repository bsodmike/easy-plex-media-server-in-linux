run:
	source ./export-configs.sh && ./run-plex-server.sh
stop:
	@docker stop plex && docker rm plex
