cd $IN_DOWN
tar -zxvf sphinx-${VERS['sphinx']}-release.tar.gz
cd sphinx-${VERS['sphinx']}-release
./configure \
--prefix=$IN_DIR/sphinx \
--with-mysql \
--without-unixodbc \
--enable-id64
make && make install

file_cp action.sphinx $IN_DIR/action/sphinx
if [ ! $IN_DIR = "/www/lanmps" ]; then
	sed -i 's:/www/lanmps:'$IN_DIR':g' $IN_DIR/action/sphinx
fi

chmod +x $IN_DIR/action/sphinx

if [ $ETC_INIT_D_LN = 1 ]; then
	ln -s $IN_DIR/action/sphinx $IN_DIR/init.d/sphinx
fi