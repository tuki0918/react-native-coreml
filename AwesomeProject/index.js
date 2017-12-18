import { AppRegistry, NativeModules } from 'react-native';
import App from './App';

const CalendarManager = NativeModules.CalendarManager;
CalendarManager.addEvent('ABC').then(name => {
    console.log(name);
});

AppRegistry.registerComponent('AwesomeProject', () => App);
