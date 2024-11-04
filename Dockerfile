# Use the official pgAdmin image
FROM dpage/pgadmin4

# Set environment variables for pgAdmin
ENV PGADMIN_DEFAULT_EMAIL=admin@example.com
ENV PGADMIN_DEFAULT_PASSWORD=admin

# Expose pgAdmin's port
EXPOSE 80
