# Use the official pgAdmin image
FROM dpage/pgadmin4

# Set environment variables for pgAdmin
ENV PGADMIN_DEFAULT_EMAIL=admin@example.com  # Change this to your preferred email
ENV PGADMIN_DEFAULT_PASSWORD=admin           # Change this to your preferred password

# Expose pgAdmin's port
EXPOSE 80
