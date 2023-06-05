
# react-native-the-pool-cue-chamption

## Getting started

`$ npm install react-native-the-pool-cue-chamption --save`

### Mostly automatic installation

`$ react-native link react-native-the-pool-cue-chamption`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-the-pool-cue-chamption` and add `RNThePoolCueChamption.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNThePoolCueChamption.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.reactlibrary.RNThePoolCueChamptionPackage;` to the imports at the top of the file
  - Add `new RNThePoolCueChamptionPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-the-pool-cue-chamption'
  	project(':react-native-the-pool-cue-chamption').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-the-pool-cue-chamption/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-the-pool-cue-chamption')
  	```

#### Windows
[Read it! :D](https://github.com/ReactWindows/react-native)

1. In Visual Studio add the `RNThePoolCueChamption.sln` in `node_modules/react-native-the-pool-cue-chamption/windows/RNThePoolCueChamption.sln` folder to their solution, reference from their app.
2. Open up your `MainPage.cs` app
  - Add `using The.Pool.Cue.Chamption.RNThePoolCueChamption;` to the usings at the top of the file
  - Add `new RNThePoolCueChamptionPackage()` to the `List<IReactPackage>` returned by the `Packages` method


## Usage
```javascript
import RNThePoolCueChamption from 'react-native-the-pool-cue-chamption';

// TODO: What to do with the module?
RNThePoolCueChamption;
```
  