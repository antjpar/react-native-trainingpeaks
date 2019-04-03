
# react-native-training-peaks

## Getting started

`$ npm install react-native-training-peaks --save`

### Mostly automatic installation

`$ react-native link react-native-training-peaks`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-training-peaks` and add `RNTrainingPeaks.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNTrainingPeaks.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.reactlibrary.RNTrainingPeaksPackage;` to the imports at the top of the file
  - Add `new RNTrainingPeaksPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-training-peaks'
  	project(':react-native-training-peaks').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-training-peaks/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-training-peaks')
  	```

## Usage

### Scopes

https://github.com/TrainingPeaks/Rails-API-Example/wiki#scopes
