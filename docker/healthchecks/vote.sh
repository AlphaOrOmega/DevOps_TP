#!/bin/sh
# Health check script for Flask app

if curl --fail http://localhost:5000/; then
    exit 0
else
    exit 1
fi