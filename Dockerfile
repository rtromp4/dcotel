FROM ubuntu:20.04

# Set the timezone as a build argument (default to UTC)
ARG TZ=UTC

# Install required dependencies
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y make python build-essential git npm tzdata

# Set the timezone
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Clone the new repository and set up the working directory
RUN git clone https://github.com/rtromp4/shell-bot.git /app
WORKDIR /app

# Install Node.js dependencies
RUN npm install

# Start the server
CMD ["node", "server"]
