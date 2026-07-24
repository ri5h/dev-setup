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
1. Install Git and basic sudo support
    - sudo apt update && sudo apt install git -y
    - sudo apt install sudo -y
    - git config --global user.name "Rishiraj Purohit"
    - git config --global user.email "purohitji007@gmail.com"
    - ssh-keygen -t ed25519 -C "purohitji007@gmail.com"
    - eval "$(ssh-agent -s)"
    - ssh-add ~/.ssh/id_ed25519
    - cat ~/.ssh/id_ed25519.pub
    - Add the public key to GitHub and verify it with:
      - ssh -T git@github.com

2. Clone this repository
    - git clone git@github.com:ri5h/dev-setup.git
    - cd dev-setup/ubuntu

3. Make the installer executable and run it
    - chmod +x install
    - ./install

4. Run the Ansible bootstrap with a sudo password prompt
    - ansible-playbook bootstrap.yml --ask-become-pass

5. If your user does not have passwordless sudo yet, enable it once on the machine and verify it
    - echo "$USER ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/$USER
    - sudo chmod 0440 /etc/sudoers.d/$USER
    - sudo visudo -cf /etc/sudoers
    - sudo -n true

6. If k3s is installed but kubectl cannot read the cluster config, copy the kubeconfig into your user-owned kube directory
    - mkdir -p "$HOME/.kube"
    - sudo cp /etc/rancher/k3s/k3s.yaml "$HOME/.kube/config"
    - sudo chown "$USER:$USER" "$HOME/.kube/config"
    - chmod 600 "$HOME/.kube/config"
    - echo 'export KUBECONFIG="$HOME/.kube/config"' >> ~/.profile
    - source ~/.profile

7. Verify the cluster is reachable
    - kubectl get nodes
    - kubectl get pods -A

If kubernetes is not working/installing, check the following first:
- `sudo -n true` should succeed without prompting for a password
- `kubectl get nodes` should work after copying the kubeconfig into `$HOME/.kube/config`
- `KUBECONFIG=$HOME/.kube/config kubectl get nodes` is the quickest manual validation if the shell has not been reloaded yet
