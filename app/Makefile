# This software is a part of the A.O.D (https://apprepo.de) project
# Copyright 2020 Alex Woroschilow (alex.woroschilow@gmail.com)
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
PWD:=$(shell pwd)

.PHONY: all


all: clean init

	mkdir --parents $(PWD)/build/Boilerplate.AppDir/snowflake

	$(PWD)/bin/Apprepo.AppImage --destination=$(PWD)/build appdir boilerplate \
	    libgdk-pixbuf2.0-0 libatk1.0-0 libatk-bridge2.0-0 libgtk2.0-0 \
	    libreadline8 at-spi2-core libpango-1.0-0 libselinux1 default-jdk

	wget --output-document=${PWD}/build/snowflake.jar \
		https://github.com/subhra74/snowflake/releases/download/v1.0.4/snowflake.jar

	echo ''                                                                                            >> $(PWD)/build/Boilerplate.AppDir/AppRun
	echo ''                                                                                            >> $(PWD)/build/Boilerplate.AppDir/AppRun
	echo 'PATH=$${PATH}:$${APPDIR}/lib64/jvm/default-java/bin'                                         >> $(PWD)/build/Boilerplate.AppDir/AppRun
	echo 'export PATH=$${PATH}'                                                                        >> $(PWD)/build/Boilerplate.AppDir/AppRun
	echo ''                                                                                            >> $(PWD)/build/Boilerplate.AppDir/AppRun
	echo ''                                                                                            >> $(PWD)/build/Boilerplate.AppDir/AppRun
	echo 'LD_LIBRARY_PATH=$${LD_LIBRARY_PATH}:$${APPDIR}/snowflake'                                    >> $(PWD)/build/Boilerplate.AppDir/AppRun
	echo 'export LD_LIBRARY_PATH=$${LD_LIBRARY_PATH}'                                                  >> $(PWD)/build/Boilerplate.AppDir/AppRun
	echo ''                                                                                            >> $(PWD)/build/Boilerplate.AppDir/AppRun
	echo ''                                                                                            >> $(PWD)/build/Boilerplate.AppDir/AppRun
	echo '$${APPDIR}/lib64/jvm/default-java/bin/java -jar $${APPDIR}/snowflake/snowflake.jar $${@}'    >> $(PWD)/build/Boilerplate.AppDir/AppRun

	cp --recursive --force $(PWD)/build/snowflake.jar $(PWD)/build/Boilerplate.AppDir/snowflake/

	rm --force $(PWD)/build/Boilerplate.AppDir/*.desktop

	cp --force $(PWD)/AppDir/*.desktop $(PWD)/build/Boilerplate.AppDir/
	cp --force $(PWD)/AppDir/*.png     $(PWD)/build/Boilerplate.AppDir/       || true
	cp --force $(PWD)/AppDir/*.svg     $(PWD)/build/Boilerplate.AppDir/       || true

	export ARCH=x86_64 && $(PWD)/bin/appimagetool.AppImage $(PWD)/build/Boilerplate.AppDir $(PWD)/Snowflake.AppImage
	chmod +x $(PWD)/Snowflake.AppImage


init:
	mkdir --parents $(PWD)/bin

	wget https://apprepo.de/appimage/download/apprepo \
		--output-document=$(PWD)/bin/Apprepo.AppImage
	chmod +x $(PWD)/bin/Apprepo.AppImage

	wget https://github.com/AppImage/AppImageKit/releases/download/13/appimagetool-x86_64.AppImage \
		--output-document=$(PWD)/bin/appimagetool.AppImage
	chmod +x $(PWD)/bin/appimagetool.AppImage

clean:
	rm -rf $(PWD)/*.AppImage
	rm -rf $(PWD)/bin/*
	rm -rf $(PWD)/build
