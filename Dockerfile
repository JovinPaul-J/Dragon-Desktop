# Step 1: Start from the official Ubuntu base image
FROM ubuntu:latest

# Step 2: Set environment variables to avoid interactive prompts during installation
ENV DEBIAN_FRONTEND=noninteractive

# Step 3: Update the repository mirrors to an Indian mirror for Ubuntu 24.04 (Noble)
RUN echo "deb http://in.archive.ubuntu.com/ubuntu/ noble main restricted universe multiverse" > /etc/apt/sources.list && \
    echo "deb http://in.archive.ubuntu.com/ubuntu/ noble-updates main restricted universe multiverse" >> /etc/apt/sources.list && \
    echo "deb http://in.archive.ubuntu.com/ubuntu/ noble-security main restricted universe multiverse" >> /etc/apt/sources.list && \
    cat /etc/apt/sources.list && apt-get update

# Step 4: Clean apt cache and install necessary dependencies
RUN apt-get clean && apt-get update && apt-get install -y --fix-missing \
    ubuntu-mate-desktop \
    tightvncserver \
    novnc \
    websockify \
    ttyd \
    sudo \
    wget \
    curl \
    gnupg \
    openssh-server \
    && apt-get clean

# Step 5: Set environment variable USER to root (or any valid user)
ENV USER=root

# Step 6: Create the VNC password
RUN mkdir -p /root/.vnc && echo "ubuntumate" | vncpasswd -f > /root/.vnc/passwd && chmod 600 /root/.vnc/passwd

# Step 7: Generate SSL certificates (you can skip if you already have certificates)
RUN openssl req -new -newkey rsa:2048 -days 365 -nodes -x509 -keyout /etc/ssl/private/vnc.key -out /etc/ssl/certs/vnc.crt

# Step 8: 
EXPOSE 6080 5901

# Step 9: Set up a VNC server (on display :1) and start websockify with SSL/TLS for NoVNC and ttyd for terminal access
CMD bash -c "vncserver :1 && websockify --cert=/etc/ssl/certs/vnc.crt --key=/etc/ssl/private/vnc.key -D --web=/usr/share/novnc --resize 6080 localhost:5901 && ttyd --writable bash"

#JOV