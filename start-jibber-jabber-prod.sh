#!/bin/bash

YELLOW=$'\e[1;33m'
RED=$'\e[0;31m'
PURPLE=$'\e[1;35m'
CYAN=$'\e[1;36m'
NC=$'\e[0m'

cd ~/jibber-jabber-infrastructure/
docker-compose -f ./docker-compose.prod.yml down
echo "${PURPLE}Starting Jibber Jabber!${NC}"
echo "${RED}Current profile: Prod${NC}"
echo "${YELLOW}Pulling latest images for all services!${NC}"
docker-compose -f ./docker-compose.prod.yml pull -q
echo "${YELLOW}That's it! Everything up to date!${NC}"
echo "${CYAN}Building nginx!${NC}"
docker-compose -f ./docker-compose.prod.yml build -q
echo "${CYAN}Okay, ready to roll!${NC}"
docker-compose -f ./docker-compose.prod.yml up --force-recreate -d
echo "${CYAN}Jibber Jabber is now running!${NC}"
echo "${PURPLE}Thanks! Have a nice day!${NC}"
./init-letsencrypt.prod.sh