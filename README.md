# ubuntu 桌面版本的基础配置



你是刚安装的 ubuntu系统 请执行下面指令

```bash
tee ./install.sh <<-'EOF'
sudo apt update 
sudo apt install -y ssh \
                    net-tools \
                    python3 \
                    python3-pip \
                    curl \
                    wget \
                    neovim \
                    git \
                    nodejs \
                    npm \
                    openjdk-8-jre-headless \
                    unzip
sudo apt upgrade -y
EOF

sudo bash ./install.sh && rm ./install.sh

 
```







[ubuntu配置脚本](./src/ubuntu_config.sh)

[neovim配置脚本](./src/init.vim)



