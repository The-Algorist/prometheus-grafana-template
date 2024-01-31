# Create a system user named 'prometheus' without a home directory:
sudo useradd --no-create-home prometheus

# Create directories for Prometheus configuration and data:
sudo mkdir /etc/prometheus
sudo mkdir /var/lib/prometheus

# Download the Prometheus release archive:
wget  https://github.com/prometheus/prometheus/releases/download/v2.49.1/prometheus-2.49.1.darwin-amd64.tar.gz

# Extract the archive:
tar -xvf prometheus-2.23.0.linux-amd64.tar.gz

# Copy Prometheus binaries to system directories:
sudo cp prometheus-2.23.0.linux-amd64/prometheus /usr/local/bin
sudo cp prometheus-2.23.0.linux-amd64/promtool /usr/local/bin

# Copy console files and libraries:
sudo cp -r prometheus-2.23.0.linux-amd64/consoles /etc/prometheus/
sudo cp -r prometheus-2.23.0.linux-amd64/console_libraries /etc/prometheus
sudo cp prometheus-2.23.0.linux-amd64/promtool /usr/local/bin/

# Remove downloaded archive and an older version (if present):
rm -rf prometheus-2.23.0.linux-amd64.tar.gz prometheus-2.19.0.linux-amd64

# Copy configuration file and systemd service file:
sudo cp prometheus.yml /etc/prometheus/
sudo cp prometheus.service /etc/systemd/system/prometheus.service

# Set ownership of files and directories:
sudo chown prometheus:prometheus /etc/prometheus
sudo chown prometheus:prometheus /usr/local/bin/prometheus
sudo chown prometheus:prometheus /usr/local/bin/promtool
sudo chown -R prometheus:prometheus /etc/prometheus/consoles
sudo chown -R prometheus:prometheus /etc/prometheus/console_libraries
sudo chown -R prometheus:prometheus /var/lib/prometheus

# Reload systemd units, enable and start Prometheus service:
sudo systemctl daemon-reload
sudo systemctl enable prometheus
sudo systemctl start prometheus

# Check the status of the Prometheus service:
sudo systemctl status prometheus