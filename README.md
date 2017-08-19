# Wireshark-for-iOS

Cross-compilation of wireshark for iOS

--build machine: x86_64-apple-darwin \
--host machine: arm64-apple-darwin

Just run two shell script and finish cross-compilation. First run
```
./build.sh
```
then
```
./buildmake.sh
```
The lib will be created in **build** folder.
