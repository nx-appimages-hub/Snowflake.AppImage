SOURCE="https://github.com/subhra74/snowflake/releases/download/v1.0.4/snowflake-1.0.4-setup-amd64.deb"
DESTINATION="build.deb"
OUTPUT="Snowflake.AppImage"


all:
	echo "Building: $(OUTPUT)"
	wget --output-document=$(DESTINATION) --continue $(SOURCE)

	dpkg -x $(DESTINATION) build

	wget --no-check-certificate --output-document=build.rpm --continue https://forensics.cert.org/centos/cert/8/x86_64/jdk-12.0.2_linux-x64_bin.rpm
	rpm2cpio build.rpm | cpio -idmv

	mkdir --parents AppDir/application
	mkdir -p AppDir/jre

	cp --recursive --force build/opt/snowflake/* AppDir/application
	cp --recursive --force usr/java/jdk-12.0.2/* AppDir/jre

	chmod +x AppDir/AppRun

	export ARCH=x86_64 && bin/appimagetool.AppImage AppDir $(OUTPUT)
	chmod +x $(OUTPUT)

	rm -rf *.deb *.rpm
	rm -rf AppDir/application
	rm -rf AppDir/jre
	rm -rf build
	rm -rf usr
