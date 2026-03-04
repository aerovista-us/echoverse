# Quick Start Guide - EchoVerse Homepage

## Prerequisites

- Docker Desktop (Windows/Mac) or Docker Engine (Linux)
- Docker Compose v2.0+

## Getting Started

### 1. Build and Start

```bash
docker-compose up -d --build
```

### 2. Verify It's Running

Open your browser: http://localhost:5301

Or check health endpoint:
```bash
curl http://localhost:5301/health
```

### 3. View Logs

```bash
docker-compose logs -f echovers-homepage
```

### 4. Stop the Service

```bash
docker-compose down
```

## What's New

### ✅ Improved Docker Configuration

- **Health checks** - Automatic container health monitoring
- **Networks** - Isolated Docker network for better security
- **Resource limits** - Prevents resource exhaustion
- **Custom nginx config** - Optimized for performance and security

### ✅ Security Enhancements

- Security headers (X-Frame-Options, CSP, etc.)
- Hidden server tokens
- Gzip compression
- Smart caching strategy

### ✅ Performance Optimizations

- Gzip compression for text assets
- Browser caching headers
- Optimized nginx worker processes

## File Structure

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
    ├── AUDIT.md          # Comprehensive audit report
    └── QUICK_START.md    # This file
```

## Troubleshooting

### Port Already in Use

If port 5301 is already in use, change it in `docker-compose.yml`:

```yaml
ports:
  - "5302:80"  # Change 5301 to any available port
```

### Container Won't Start

1. Check logs: `docker-compose logs echovers-homepage`
2. Verify nginx.conf syntax: `docker-compose exec echovers-homepage nginx -t`
3. Rebuild: `docker-compose up -d --build --force-recreate`

### Health Check Failing

The health check uses curl. If it fails:
1. Verify container is running: `docker ps`
2. Check nginx is responding: `curl http://localhost:5301`
3. Check health endpoint: `curl http://localhost:5301/health`

## Next Steps

1. Review [AUDIT.md](./AUDIT.md) for upgrade recommendations
2. Consider adding HTTPS (see audit document)
3. Set up monitoring (optional)
4. Implement CI/CD pipeline (optional)

## Support

For issues or questions:
1. Check the audit document for detailed recommendations
2. Review Docker logs for errors
3. Verify all files are present and correctly formatted
