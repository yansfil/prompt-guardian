.PHONY: watch-dev
watch-dev:
	@echo "Starting client and server with PM2..."
	pm2 cleardump
	pm2 flush
	bash -c "trap 'make stop-watch-dev' EXIT; \
	         pm2 logs & \
	         pm2 start; \
	         wait"

.PHONY: stop-watch-dev
stop-watch-dev:
	@echo "Stopping all PM2 processes..."
	pm2 stop all || :
	pm2 kill
