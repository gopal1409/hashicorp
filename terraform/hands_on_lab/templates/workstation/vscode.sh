#!/usr/bin/env bash
set -e

echo "--> Writing VSCode"
sudo mkdir /workstation/vscode
sudo tee /workstation/vscode/vscode.sh > /dev/null <<"EOF"
sudo curl -fsSL https://code-server.dev/install.sh -o /workstation/vscode/vscode_install.sh
sudo chmod +x /workstation/vscode/vscode_install.sh
sudo chown -R "${training_username}:${training_username}" "/workstation/vscode"
EOF

echo "--> Installing VSCode"
sudo chmod +x /workstation/vscode/vscode.sh
sudo chown -R "${training_username}:${training_username}" "/workstation/vscode"
sudo /workstation/vscode/vscode.sh
sudo bash /workstation/vscode/vscode_install.sh

echo "--> Configuring VSCode"
sudo mkdir /home/"${training_username}"/.config/code-server
sudo tee /home/"${training_username}"/.config/code-server/config.yaml > /dev/null <<"EOF"
bind-addr: 0.0.0.0:443
auth: password
password: "${training_password}"
cert: true
EOF
sudo chown -R "${training_username}:${training_username}" "/home/"${training_username}"/.config/code-server"

echo "--> Configuring VSCode for 443 Access"
sudo setcap cap_net_bind_service=+ep /usr/lib/code-server/lib/node

echo "--> Enable and Start VSCode"
sudo systemctl enable --now code-server@"${training_username}"
sudo systemctl restart code-server@"${training_username}"