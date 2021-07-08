#!/bin/bash
YELLOW=$'\e[1;33m'
PURPLE=$'\e[1;35m'
CYAN=$'\e[1;36m'
NC=$'\e[0m'
echo "${PURPLE}Starting Jibber Jabber!${NC}"
echo "${YELLOW}Pulling latest images for all services!${NC}"
docker-compose pull -q
echo "${YELLOW}That's it! Everything up to date!${NC}"
echo "${CYAN}Building nginx!${NC}"
docker-compose build -q
echo "${CYAN}Okay, ready to roll!${NC}"
docker-compose up --force-recreate
echo "${PURPLE}Thanks! Have a nice day!${NC}"