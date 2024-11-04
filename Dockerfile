# Start from the official pgAdmin image
FROM dpage/pgadmin4:latest

# Set environment variables for pgAdmin
ENV PGADMIN_DEFAULT_EMAIL=admin@example.com
ENV PGADMIN_DEFAULT_PASSWORD=admin

# Remove sudo commands from the entrypoint script to avoid permission issues
RUN sed -i '/sudo/d' /entrypoint.sh

# Update permissions to allow the 'pgadmin' user to execute necessary commands
RUN chmod +x /entrypoint.sh && \
    chmod -R 755 /pgadmin4

# Expose the default port for pgAdmin
EXPOSE 80

# Switch to non-root user for security
USER pgadmin

# Start pgAdmin using gunicorn without sudo or special privileges
CMD ["gunicorn", "--bind", "0.0.0.0:80", "--chdir", "/pgadmin4", "pgadmin4:app"]
