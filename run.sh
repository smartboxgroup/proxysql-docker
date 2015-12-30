#!/bin/bash
proxysql --initial -f -c $CONF_FILE -D $DATA_DIR
