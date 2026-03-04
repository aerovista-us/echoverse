# EchoVerse Homepage

A modern, static homepage for EchoVerse Audio - an internal hub for audio content, downloads, tools, and project management.

## Features

- 🎨 Modern dark theme with gradient accents
- 📱 Fully responsive design
- 🚀 Fast static site served via Nginx
- 🐳 Dockerized for easy deployment
- 🔒 Security headers and optimizations
- 💚 Health checks and monitoring ready

## Quick Start

### Prerequisites

- Docker Desktop (Windows/Mac) or Docker Engine (Linux)
- Docker Compose v2.0+

### Run Locally

```bash
# Build and start
docker-compose up -d --build

# View logs
docker-compose logs -f echovers-homepage

# Access site
# Open http://localhost:5301 in your browser

# Health check
curl http://localhost:5301/health

# Stop
docker-compose down
```

## Project Structure

```
homepage/
├── docker-compose.yml    # Docker Compose configuration
├── dockerfile            # Docker image definition
├── nginx.conf            # Nginx server configuration
├── .dockerignore         # Files excluded from Docker build
├── index.html            # Main homepage
├── about.html            # About page
├── listen.html           # Listen page
├── downloads.html        # Downloads page
├── tools.html            # Tools page
├── projects.html         # Projects page
├── thank-you.html        # Thank You page
└── docs/
    ├── AUDIT.md          # Comprehensive audit and upgrade recommendations
    └── QUICK_START.md    # Quick start guide
```

## Port Configuration

The site runs on port **5301** by default (mapped from container port 80).

To change the port, edit `docker-compose.yml`:

```yaml
ports:
  - "YOUR_PORT:80"
```

## Documentation

- **[Quick Start Guide](docs/QUICK_START.md)** - Get up and running quickly
- **[Audit & Upgrades](docs/AUDIT.md)** - Comprehensive audit report with upgrade recommendations

## Recent Improvements

### ✅ Docker Enhancements
- Health checks for container monitoring
- Custom nginx configuration with optimizations
- Security headers (X-Frame-Options, CSP, etc.)
- Gzip compression
- Smart caching strategy
- Resource limits
- Isolated Docker network

### ✅ Performance
- Gzip compression for text assets
- Browser caching headers
- Optimized nginx worker processes

### ✅ Security
- Security headers implemented
- Server tokens hidden
- Health check endpoint
- .dockerignore to prevent secret leakage

## Development

### Adding Assets

1. Create an `assets/` directory in the project root
2. Add your assets (images, CSS, JS, fonts, etc.)
3. Update the Dockerfile to copy assets:
   ```dockerfile
   COPY assets/ /usr/share/nginx/html/assets/
   ```
4. Rebuild: `docker-compose up -d --build`

### Modifying Pages

1. Edit the HTML files directly
2. Rebuild the container: `docker-compose up -d --build`
3. Or use volumes for development (see docker-compose.dev.yml in audit doc)

## Troubleshooting

### Port Already in Use
Change the port in `docker-compose.yml`:
```yaml
ports:
  - "5302:80"
```

### Container Won't Start
1. Check logs: `docker-compose logs echovers-homepage`
2. Verify nginx config: `docker-compose exec echovers-homepage nginx -t`
3. Rebuild: `docker-compose up -d --build --force-recreate`

### Health Check Failing
1. Verify container: `docker ps`
2. Check nginx: `curl http://localhost:5301`
3. Check health: `curl http://localhost:5301/health`

## Upgrade Path

See [AUDIT.md](docs/AUDIT.md) for:
- Priority 1: HTTPS, CSP, Asset Optimization
- Priority 2: Dev/Prod configs, Monitoring, CI/CD
- Priority 3: Static Site Generator migration, PWA, CDN

## License

Internal use only - EchoVerse Audio

## Support

For issues or questions, refer to:
- [Quick Start Guide](docs/QUICK_START.md)
- [Audit Document](docs/AUDIT.md)

---

**Last Updated:** 2025-01-15
