# Installing OpenTofu

This guide covers how to install OpenTofu on different operating systems.

---

## Requirements

- 64-bit operating system (Linux, macOS, or Windows)
- Internet access to download providers during `tofu init`

---

## macOS

### Using Homebrew (recommended)

```bash
brew install opentofu

# Verify installation
tofu version
```

### Using the official install script

```bash
curl --proto '=https' --tlsv1.2 -fsSL https://get.opentofu.org/install-opentofu.sh | sh -s -- --install-method brew
```

---

## Linux

### Using the official install script (recommended)

```bash
curl --proto '=https' --tlsv1.2 -fsSL https://get.opentofu.org/install-opentofu.sh | sh
```

### Manual installation (AMD64)

```bash
# Download the latest release
TOFU_VERSION=$(curl -s https://api.github.com/repos/opentofu/opentofu/releases/latest | grep tag_name | cut -d '"' -f 4 | sed 's/v//')
curl -LO "https://github.com/opentofu/opentofu/releases/download/v${TOFU_VERSION}/tofu_${TOFU_VERSION}_linux_amd64.zip"

# Unzip and install
unzip "tofu_${TOFU_VERSION}_linux_amd64.zip"
sudo install -m 755 tofu /usr/local/bin/tofu

# Verify installation
tofu version
```

### Debian/Ubuntu (APT)

```bash
# Add the OpenTofu apt repository
curl --proto '=https' --tlsv1.2 -fsSL https://get.opentofu.org/install-opentofu.sh | sh -s -- --install-method apt

# Verify installation
tofu version
```

### RHEL/CentOS/Fedora (YUM/DNF)

```bash
# Add the OpenTofu yum repository
curl --proto '=https' --tlsv1.2 -fsSL https://get.opentofu.org/install-opentofu.sh | sh -s -- --install-method rpm

# Verify installation
tofu version
```

---

## Windows

### Using winget

```powershell
winget install --id=OpenTofu.OpenTofu

# Verify installation (restart terminal first)
tofu version
```

### Using Chocolatey

```powershell
choco install opentofu

# Verify installation
tofu version
```

### Manual installation

1. Download the latest Windows release from https://github.com/opentofu/opentofu/releases
2. Extract `tofu.exe` from the zip file
3. Move `tofu.exe` to a directory in your PATH (e.g., `C:\Windows\System32` or a custom tools directory)
4. Verify: `tofu version`

---

## Verify Your Installation

After installation, run:

```bash
tofu version
```

You should see output like:

```
OpenTofu v1.8.0
on linux_amd64
```

---

## Installing Cloud Provider CLIs

To use cloud provider examples, you'll also need the provider CLIs:

### AWS CLI

```bash
# Linux
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
aws --version

# macOS
brew install awscli
aws --version
```

### Azure CLI

```bash
# Linux
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
az --version

# macOS
brew install azure-cli
az --version
```

### gcloud CLI (GCP)

```bash
# Follow instructions at:
# https://cloud.google.com/sdk/docs/install
gcloud --version
```

---

## Next Steps

- `03-opentofu-workflow.md` — Learn the OpenTofu workflow
- `../iac-basics/01-provider-block/` — Start with your first OpenTofu configuration
