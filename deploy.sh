#!/bin/bash

# Kachin Visions Empire - GitHub Pages Deploy Script

echo "🚀 Deploying Kachin Visions Empire to GitHub Pages..."

# Create required directories
mkdir -p docs

# Copy all files to docs folder
cp index.html docs/
cp sw.js docs/
cp manifest.json docs/

# Create .nojekyll file to disable Jekyll processing
touch docs/.nojekyll

# Create CNAME file for custom domain (optional)
# echo "yourdomain.com" > docs/CNAME

# Create README for GitHub
cat > docs/README.md << 'EOF'
# Kachin Visions Empire

Video Streaming Platform for Kachin Visions Empire

## Features
- 📺 Video streaming with multiple sources
- 🔐 Secure password protection
- 📱 Mobile responsive design
- 🔄 Offline capabilities
- 👥 User management system
- 🔗 Contact links management

## Access Methods

### 1. Web Browser
Visit: https://[your-username].github.io/[repository-name]

### 2. Android
1. Open Chrome browser
2. Go to the website
3. Tap menu (3 dots) → "Add to Home screen"
4. Launch like a native app

### 3. iOS
1. Open Safari browser
2. Go to the website
3. Tap Share button → "Add to Home Screen"
4. Launch like a native app

## Admin Access
Default admin credentials:
- Username: Sun Day
- Password: sunday@video!01234

## Technology Stack
- Firebase (Authentication, Firestore, Storage)
- HLS.js for adaptive streaming
- Progressive Web App (PWA) technology
- Service Workers for offline support
- CryptoJS for encryption

## Development
To run locally:
1. Clone repository
2. Open index.html in browser
3. For testing, use local Firebase emulator

## Deployment
This site is automatically deployed to GitHub Pages from the docs folder.

## License
© 2024 Kachin Visions Empire. All rights reserved.
EOF

# Create robots.txt
cat > docs/robots.txt << 'EOF'
User-agent: *
Allow: /
Disallow: /admin/
Sitemap: https://[your-username].github.io/[repository-name]/sitemap.xml
EOF

# Create sitemap.xml
cat > docs/sitemap.xml << 'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
  <url>
    <loc>https://[your-username].github.io/[repository-name]/</loc>
    <lastmod>2024-01-01</lastmod>
    <changefreq>daily</changefreq>
    <priority>1.0</priority>
  </url>
</urlset>
EOF

# Create offline fallback page
cat > docs/offline.html << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Offline - Kachin Visions Empire</title>
    <style>
        body {
            background: #0a0a1a;
            color: #f0f8ff;
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            text-align: center;
            padding: 20px;
        }
        .container {
            max-width: 500px;
        }
        h1 {
            color: #ff9900;
            margin-bottom: 20px;
        }
        .icon {
            font-size: 4rem;
            color: #ff9900;
            margin-bottom: 20px;
        }
        .btn {
            background: #ff9900;
            color: white;
            border: none;
            padding: 12px 24px;
            border-radius: 8px;
            font-size: 1rem;
            cursor: pointer;
            margin-top: 20px;
            text-decoration: none;
            display: inline-block;
        }
        .btn:hover {
            background: #ff5500;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="icon">📶</div>
        <h1>You're Offline</h1>
        <p>Please check your internet connection and try again.</p>
        <p>If you have downloaded videos, you can still watch them offline.</p>
        <button class="btn" onclick="window.location.reload()">Retry Connection</button>
    </div>
</body>
</html>
EOF

echo "✅ Deployment files created in docs folder!"
echo ""
echo "📝 Next steps:"
echo "1. Push to GitHub:"
echo "   git add docs/"
echo "   git commit -m 'Deploy to GitHub Pages'"
echo "   git push origin main"
echo ""
echo "2. Enable GitHub Pages:"
echo "   - Go to repository Settings"
echo "   - Click 'Pages' in sidebar"
echo "   - Set 'Source' to 'Deploy from a branch'"
echo "   - Select 'main' branch and '/docs' folder"
echo "   - Click Save"
echo ""
echo "3. Your site will be available at:"
echo "   https://[your-username].github.io/[repository-name]"