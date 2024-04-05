#!/bin/bash

sudo su

#stop minecraft server gracefully
docker exec mc rcon-cli stop