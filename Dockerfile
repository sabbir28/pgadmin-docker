# Start from the official dpage/pgadmin4 image, which includes the necessary dependencies
FROM dpage/pgadmin4:latest

# Set environment variables for pgAdmin
ENV PGADMIN_DEFAULT_EMAIL=admin@example.com
ENV PGADMIN_DEFAULT_PASSWORD=admin

# Remove sudo commands from the entrypoint script
RUN sed -i '/sudo/d' /entrypoint.sh

# Change permissions to allow the pgAdmin user to execute necessary commands
RUN chmod +x /entrypoint.sh && \
    chmod -R 755 /pgadmin4

# Expose pgAdmin’s default port
EXPOSE 80

# Set the non-root user
USER pgadmin

# Run pgAdmin with gunicorn directly without sudo or special privileges
CMD ["gunicorn", "--bind", "0.0.0.0:80", "--chdir", "/pgadmin4", "pgadmin4:app"]
