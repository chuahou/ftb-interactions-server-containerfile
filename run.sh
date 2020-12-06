#!/usr/bin/env bash
# SPDX-License-Identifier: MIT
# Copyright (c) 2020 Chua Hou

cp -r /install/. /minecraft
cd /minecraft
echo "eula=true" > eula.txt
java -server -XX:+UseG1GC -XX:+UnlockExperimentalVMOptions -Xmx5500M -Xms4250M -jar forge-*.jar nogui
