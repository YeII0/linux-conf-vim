# INSTALLATION
#===================================================================================

actual_path=$(readlink -f "${BASH_SOURCE[0]}")
script_dir=$(dirname "$actual_path")

# Replace old configs by symlinks to new one from repo.
sudo rm -rf ~/.vim /root/.vim
ln -s $script_dir ~/.vim
sudo ln -s $script_dir /root/.vim
