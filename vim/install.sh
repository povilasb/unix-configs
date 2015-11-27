cp vimrc ~/.vimrc

VIM_COLORS_DIR=~/.vim/colors
mkdir -p ${VIM_COLORS_DIR}
cp povilasb_colors.vim ${VIM_COLORS_DIR}

mkdir -p ~/.vim

rm -rf ~/.vim/configs
cp -r ./configs ~/.vim/configs

cp -rf ./syntax ~/.vim/
cp -rf ./ftplugin ~/.vim/
