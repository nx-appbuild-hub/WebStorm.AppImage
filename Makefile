SOURCE="https://download-cf.jetbrains.com/webstorm/WebStorm-2020.2.1.tar.gz"
DESTINATION="build.tar.bz2"
OUTPUT="WebStorm.AppImage"


all:
	echo "Building: $(OUTPUT)"
	wget -O $(DESTINATION) -c $(SOURCE)

	tar -zxvf $(DESTINATION)
	rm -rf AppDir/opt

	mkdir --parents AppDir/opt/application
	cp -r WebStorm-*/* AppDir/opt/application

	chmod +x AppDir/AppRun
	export ARCH=x86_64 && bin/appimagetool.AppImage AppDir $(OUTPUT)
	chmod +x $(OUTPUT)

	rm -rf WebStorm-193.5233.80
	rm -f $(DESTINATION)
	rm -rf AppDir/opt
