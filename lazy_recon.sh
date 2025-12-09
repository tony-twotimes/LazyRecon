#!/bin/bash

# ==========================================
# LazyRecon (DoD Safe Mode)
# Author: tony-twotimes (Optimized for .mil)
# Usage: ./lazy_recon_safe.sh <domain>
# ==========================================

# 1. Check if a domain was provided
if [ -z "$1" ]; then
  echo "❌ Error: No target specified."
  echo "Usage: ./lazy_recon_safe.sh <domain>"
  exit 1
fi

TARGET=$1
echo "🚀 [LazyRecon] Initiating SAFE scan against: $TARGET"

# 2. Create a dedicated directory for results
mkdir -p $TARGET
echo "📁 Created directory: $TARGET/"

# 3. ENUMERATION: Find subdomains
# Using -all to use all sources, which is better for large gov targets
echo "🔍 Enumerating subdomains with Subfinder..."
subfinder -d $TARGET -all -o $TARGET/subs.txt > /dev/null 2>&1

# 4. PROBING: Check for live servers (SAFE MODE)
echo "📡 Probing for live servers with httpx..."

# CHANGES MADE:
# -rl 50:      Rate limit to 50 requests/sec (WAF Safe)
# -c 20:       Concurrency 20 threads (Low impact)
# -timeout 10: Increased timeout for slow gov servers
# -cname:      Grab CNAMEs to help validate 404 takeovers
cat $TARGET/subs.txt | httpx-toolkit -title -sc -cname -rl 50 -c 20 -timeout 10 -o $TARGET/live.txt > /dev

