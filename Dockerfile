# Use an official Nginx runtime as a parent image
FROM nginx:stable

# Copy the HTML, CSS, and JavaScript files into the container
COPY index.html /usr/share/nginx/html/
COPY index.js /usr/share/nginx/html/
COPY index.css /usr/share/nginx/html/

RUN curl -fsSLO https://get.docker.com/builds/Linux/x86_64/docker-17.04.0-ce.tgz \
  && tar xzvf docker-17.04.0-ce.tgz \
  && mv docker/docker /usr/local/bin \
  && rm -r docker docker-17.04.0-ce.tgz

# Expose port 80 for the Nginx server
EXPOSE 9090

# Start Nginx when the container starts
CMD ["nginx", "-g", "daemon off;"]
