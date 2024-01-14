# Use an official Node.js image as base
FROM node:latest

# Set the working directory
WORKDIR /app

# Install required packages
RUN apt-get update && apt-get install -y make python build-essential git

# Clone the repository
RUN git clone https://github.com/rtromp4/shell-bot.git

# Change to the repository directory
WORKDIR /app/shell-bot

# Install Node.js dependencies
RUN npm install

# Expose the necessary port (if applicable)
# EXPOSE <your_port_number>

# Command to run the application
CMD ["node", "server"]
