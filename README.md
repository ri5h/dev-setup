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

# To setup on ubuntu
1. Setup the git with below commands
    - sudo apt update && sudo apt install git -y
    - git config --global user.name "Rishiraj Purohit"
    - git config --global user.email "purohitji007@gmail.com"
    - ssh-keygen -t ed25519 -C "purohitji007@gmail.com"
    - eval "$(ssh-agent -s)"
    - ssh-add ~/.ssh/id_ed25519
    - cat ~/.ssh/id_ed25519.pub
    - Add it to github and test using below command
    - ssh -T git@github.com
2. git clone git@github.com:ri5h/dev-setup.git
3. cd dev-setup/ubuntu
4. chmod +x install
5. ./install
6. ansible-playbook bootstrap.yml --ask-become-pass