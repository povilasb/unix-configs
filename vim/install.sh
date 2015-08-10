cp vimrc ~/.vimrc

VIM_COLORS_DIR=~/.vim/colors
mkdir -p ${VIM_COLORS_DIR}
cp povilasb_colors.vim ${VIM_COLORS_DIR}

mkdir -p ~/.vim
cp -r ./configs ~/.vim/configs
cp -rf ./syntax ~/.vim/
