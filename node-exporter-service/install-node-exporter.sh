# Create a system user for node_exporter without a home directory or login shell
sudo useradd --no-create-home node_exporter

# Download the Node Exporter binary for macOS (version 1.7.0)
wget https://github.com/prometheus/node_exporter/releases/download/v1.7.0/node_exporter-1.7.0.darwin-amd64.tar.gz

# Extract the downloaded archive (using the correct filename)
tar xzf node_exporter-1.7.0.darwin-amd64.tar.gz

# Copy the node_exporter binary to a system directory
sudo cp node_exporter-1.7.0.darwin-amd64/node_exporter /usr/local/bin/node_exporter

# Remove the downloaded archive and extracted directory
rm -rf node_exporter-1.7.0.darwin-amd64.tar.gz node_exporter-1.7.0.darwin-amd64

# Copy the systemd service file for node_exporter
sudo cp node-exporter.service /etc/systemd/system/node-exporter.service

# Reload systemd to recognize the new service
sudo systemctl daemon-reload

# Enable the node_exporter service to start at boot
sudo systemctl enable node-exporter

# Start the node_exporter service
sudo systemctl start node-exporter

# Check the status of the node_exporter service
sudo systemctl status node-exporter
