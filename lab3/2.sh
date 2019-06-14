#!/bin/bash

ps ax o pid,start_time --sort=start_time | tail -1
