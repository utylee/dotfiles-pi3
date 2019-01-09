./configure --with-features=huge --enable-multibyte --enable-rubyinterp=yes --enable-perlinterp=yes --enable-luainterp=yes --enable-pythoninterp=yes --with-python-config-dir=/usr/lib/python2.7/config-arm-linux-gnueabihf/ --enable-python3interp=yes --with-python3-config-dir=/home/pi/.pyenv/versions/3.6.5/lib/python3.6/config-3.6m-arm-linux-gnueabihf/ --enable-gui=gtk2 --enable-cscope

# ruby는 libruby-dev 형식이 아니고 ruby-dev 로 apt-get install 해야..
# 나머지 include 파일은 sudo apt-get install libXXX-dev 형식이었다 대부분

# youcompleteme git 페이지에 나온 (즐겨찾기) wiki 로부터..
# sudo apt install libncurses5-dev libgnome2-dev libgnomeui-dev \
#libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
#libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev \
#python3-dev ruby-dev lua5.1 liblua5.1-dev libperl-dev git
