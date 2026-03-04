FROM nginx:alpine

# Install curl for health checks (optional)
RUN apk add --no-cache curl

# Copy custom nginx configuration
COPY nginx.conf /etc/nginx/nginx.conf

# Copy all HTML pages into nginx web root
COPY ./*.html /usr/share/nginx/html/

# Create assets directory
RUN mkdir -p /usr/share/nginx/html/assets

# Copy assets directory if it exists
# Note: If asset/ directory doesn't exist in build context, 
# create it first: mkdir -p asset
COPY asset/ /usr/share/nginx/html/assets/

# Create health check script
RUN echo '#!/bin/sh' > /healthcheck.sh && \
    echo 'curl -f http://localhost/health || exit 1' >> /healthcheck.sh && \
    chmod +x /healthcheck.sh || true

# Expose port 80
EXPOSE 80

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD /healthcheck.sh || exit 1

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
