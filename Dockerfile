FROM ubuntu:20.04

# Install required dependencies
RUN apt-get update && \
    apt-get install -y make python build-essential git npm

# Clone the repository and set up the working directory
RUN git clone https://github.com/botgram/shell-bot.git /app
WORKDIR /app

# Install Node.js dependencies
RUN npm install

# Start the server as root
CMD ["node", "server"]
