# Indihood
A project to complete the [challenge](https://www.hackerearth.com/challenges/test/indihood-frontend-engineering-challenge-gaurav-gupta-072020/problems/5f559b7f1f11416d9a52874228248ed8/) by [Indihood](https://www.indihood.com)

## How to Run
#### Install flutter
This project uses [flutter](https://flutter.dev/) so download the flutter sdk and setup your environment by following the instructions [here](https://flutter.dev/docs/get-started/install)
#### Connect your device
Connect an android device to your computer, you can also run an emulator or iPhone simulator on your computer
#### Cd to project directory
Change your current working directory to the project directory. That is the directory containing this README file
```
cd indihood
```
#### Get flutter dependencies
```
flutter pub get
```
#### Run
To run in debug mode run
```
flutter run
```
To run in profile mode run (only for physical devices)
```
flutter run --profile
```
To run in release mode run (only for physical devices)
```
flutter run --release
```
This will run your app in the device connected to your computer

## How to Install
You can also build an apk and install it on your phone
#### Generate an apk
```
flutter build apk
mv build/app/outputs/apk/release/app-release.apk app.apk
```
#### Install the apk
```
adb install app.apk
```