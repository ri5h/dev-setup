curl https://raw.githubusercontent.com/ri5h/dev-setup/main/mac-bootstrap.sh

# Below line creates a sudo session for brew install
sudo echo "hello brew!"

curl https://raw.githubusercontent.com/ri5h/dev-setup/main/brew.sh



# To setup on mac

1. git clone this repo
2. ´chmod +x ./macos/install´
3. sudo echo "becoming sudo for install"
4. ./macos/install


# To setup on Windows

1. Open an elevated PowerShell session
2. Run `irm https://raw.githubusercontent.com/ri5h/dev-setup/main/windows/install.ps1 | iex` to install Git + Ansible
3. Restart your terminal, then: `git clone https://github.com/ri5h/dev-setup.git`
4. `cd dev-setup/windows`
5. Run `ansible-playbook bootstrap.yml` to install browsers, VS Code, etc.

Re-run `ansible-playbook bootstrap.yml` anytime to ensure all tools are installed.


Needed to do ssh setup in 1password and github 