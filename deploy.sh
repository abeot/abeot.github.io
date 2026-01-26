#!/bin/bash
set -e

# Build the site
echo "Building site..."
make clean 2>/dev/null || true
make all

# Save the build directory to temp location
echo "Preparing deployment..."
rm -rf /tmp/gh-pages-build
cp -r build /tmp/gh-pages-build

# Remove local build folder before switching branches
rm -rf build

# Switch to gh-pages branch
git checkout gh-pages

# Remove all files (except .git)
find . -maxdepth 1 ! -name '.git' ! -name '.' -exec rm -rf {} +

# Copy new build contents
cp -r /tmp/gh-pages-build/* .
rm -rf /tmp/gh-pages-build

# Commit and push
git add -A
if git diff --cached --quiet; then
    echo "No changes to deploy."
else
    git commit -m "Deploy site"
    git push origin gh-pages
    echo "Deployed successfully!"
fi

# Switch back to master
git checkout master
