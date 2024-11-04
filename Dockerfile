# Start from the official pgAdmin image to avoid building complex dependencies from scratch
FROM dpage/pgadmin4:latest

# Set environment variables for pgAdmin
ENV PGADMIN_DEFAULT_EMAIL=admin@example.com
ENV PGADMIN_DEFAULT_PASSWORD=admin

# Expose pgAdmin's default port
EXPOSE 80

# Copy custom configurations, if any, for pgAdmin (e.g., config_distro.py if needed)
# Uncomment the following lines if you have custom config files
# COPY config_distro.py /pgadmin4/config_distro.py

# Ensure permissions are set correctly for pgAdmin to run as a non-root user
USER pgadmin

# Start pgAdmin using the entrypoint provided in the official image
ENTRYPOINT ["/entrypoint.sh"]

# Set the default command for the container to run
CMD ["gunicorn", "--config", "/pgadmin4/gunicorn_config.py", "pgadmin4:app"]
