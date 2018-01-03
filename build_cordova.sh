sdkPath=/home/deuke/Android/Sdk/build-tools/25.0.2

adb uninstall packge.id

# ionic cordova build android --prod --release

if ionic cordova build android; then
        echo 'build successful'
else
        echo 'build failure'
fi

cd ./platforms/android/build/outputs/apk
if ${sdkPath}/apksigner sign --key key.pk8 --cert certificate.pem *.apk ; then
        echo "apk signing successful"
else
        echo "apk signing failed"
fi

if adb install -r *.apk; then
      echo 'installation successful'
      adb shell am start -n packge.id/packge.id.MainActivity    
else
      echo 'installation failed'
fi
