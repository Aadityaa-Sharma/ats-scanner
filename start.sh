#!/bin/bash
# Startup script for Render deployment

echo "🚀 Starting Resume ATS Analyzer on Render..."

# Create necessary directories
mkdir -p uploads reports

# Set proper permissions
chmod 755 uploads reports

# Start the application with gunicorn for production
echo "📊 Starting server with gunicorn..."
exec gunicorn --bind 0.0.0.0:$PORT --workers 2 --timeout 120 app:app
