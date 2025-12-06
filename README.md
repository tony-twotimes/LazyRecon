# LazyRecon 🚀

> **An automated reconnaissance wrapper for bug bounty hunting and infrastructure mapping.**

LazyRecon is a Bash-based automation tool designed to streamline the initial phase of security assessments. It integrates industry-standard tools (`subfinder` and `httpx`) to perform subdomain enumeration, live service probing, and status code filtering in a single execution flow.

This tool was built to reduce repetitive manual entry and provide a clean, organized workspace for each target.

## ⚡ Features

* **Automated Workspace Management:** Automatically creates a directory structure for each target domain to keep scan data organized.
* **Passive Enumeration:** Uses `subfinder` to gather subdomains from public sources without directly touching the target infrastructure.
* **Active Probing:** Uses `httpx` to validate live web servers and filter out dead domains.
* **Smart Filtering:** Automatically categorizes results into:
    * `potential_takeovers.txt` (404 Not Found)
    * `forbidden.txt` (403 Forbidden)
    * `valid_200s.txt` (200 OK)
* **Quiet Mode:** Suppresses tool noise to provide a clean, readable status dashboard during execution.

## 🛠️ Prerequisites

This tool relies on the following Go-based utilities. Ensure they are installed and in your `$PATH`:

* [Subfinder](https://github.com/projectdiscovery/subfinder)
* [httpx](https://github.com/projectdiscovery/httpx)

```bash
# Install on Kali Linux / Debian
sudo apt install subfinder httpx-toolkit

