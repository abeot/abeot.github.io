#!/bin/bash
set -e

# Build the site
echo "Building site..."
make clean 2>/dev/null || true
make all

# Save the build directory
echo "Preparing deployment..."
cp -r build /tmp/gh-pages-build

# Switch to gh-pages branch
git checkout gh-pages

# Remove old files and copy new build
git rm -rf . 2>/dev/null || true
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
