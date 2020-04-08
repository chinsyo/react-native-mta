import { NativeModules } from 'react-native';

const { Mta } = NativeModules;
console.log("!!!RCTMta", Mta)

export default Mta;
