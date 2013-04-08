android_device_wiko_s9091
=========================


initialize repo with cm9 repository:
	
	repo init -u git://github.com/CyanogenMod/android.git -b ics

Now retrieve Wiko PEAX repositories (Should be using local_manifests.xml instead):

	for folder in device kernel vendor;
	do
		mkdir -p $folder/wiko/s9091;
		git clone "http://github.com/skritchz/android_"$folder"_wiko_s9091.git" -b ics $folder/wiko/s9091;
	done


Now prepare to build

	. build/envsetup.sh
	brunch s9091

And there we are :). Now debugging time ...
