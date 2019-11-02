mkdir -p built && \
git clone git://github.com/sysstat/sysstat && \
cd sysstat/ && \
./configure --enable-install-cron && \
make && \
strip sar && strip sadc && strip iostat && \
cp -f sar ../built/ && cp -f sadc ../built/ && cp -f iostat ../built/ && \
cd .. && \
git clone https://github.com/hishamhm/htop.git && \
cd htop/ && \
./autogen.sh  && \
./configure && \
make && \
strip htop && \
cp -f htop ../built/ && \
cp -f /lib/x86_64-linux-gnu/libncursesw.so.5.9 ../built/libncursesw.so.5 && \
cp -f /lib/x86_64-linux-gnu/libtinfo.so.5.9 ../built/libtinfo.so.5 && \
cd .. && \
git clone https://github.com/lsof-org/lsof.git && \
cd lsof/ && \
./Configure linux && \
make && \
strip lsof && \
cp -f lsof ../built/ && \
cd .. && \
git clone https://github.com/strace/strace.git && \
cd strace/ && \
./bootstrap  && \
./configure --enable-mpers=no && \
make && \
strip strace && \
cp -f strace ../built/ && \
cd .. && \
curl -LO https://dev.yorhel.nl/download/ncdu-1.14.1.tar.gz && \
tar zxvf ncdu-1.14.1.tar.gz  && \
cd ncdu-1.14.1/ && \
./configure && \
make && \
strip ncdu && \
cp -f ncdu ../built/ && \
cd .. && \
git clone https://github.com/megastep/makeself.git && \
cd built && \
echo 'sh -c "LD_LIBRARY_PATH=$(pwd) PATH=$(pwd):$PATH PS1=\"CT \w> \" sh"' > runme.sh && \
echo 'sh -c "LD_LIBRARY_PATH=$(pwd) PATH=$(pwd):$PATH PS1=\"CT \w> \" bash"' > runme.bash && \
chmod +x runme.sh runme.bash && \
../makeself/makeself.sh --gzip --current --nox11 --nowait . tools.run "Chris Tools" rm -f tools.run
