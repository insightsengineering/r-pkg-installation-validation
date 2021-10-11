FROM docker.io/rocker/tidyverse:4.1.1

# Copy validator and template
COPY report-generator.R /main.R
COPY template.Rmd /template.Rmd
COPY dependencies.R /dependencies.R

# Set exec permissions on entrypoint script
# and dependencies installer.
# Run the installer
RUN chmod +x /main.R /dependencies.R && \
      ./dependencies.R

# Set entrypoint
ENTRYPOINT ["/main.R"]
