# Use a base image with a lightweight web server
FROM nginx:alpine

# Remove the default Nginx configuration
RUN rm /etc/nginx/conf.d/default.conf

# Copy the custom Nginx configuration file
COPY nginx.conf /etc/nginx/conf.d/

# Copy the application files to the appropriate directory
COPY index.html /usr/share/nginx/html/
COPY css/style.css /usr/share/nginx/html/css/
COPY js/main.js /usr/share/nginx/html/js/

# Expose the port on which the application will run
EXPOSE 80

# Start the Nginx web server
CMD ["nginx", "-g", "daemon off;"]
