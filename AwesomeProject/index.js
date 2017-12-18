import { AppRegistry, NativeModules } from 'react-native';
import App from './App';

const RNCoreML = NativeModules.RNCoreML;
RNCoreML.addEvent('ABC').then(name => {
    console.log(name);
});

AppRegistry.registerComponent('AwesomeProject', () => App);
