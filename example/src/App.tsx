import * as React from 'react';
import {TurboModuleRegistry} from 'react-native';
import { StyleSheet, View, Text } from 'react-native';

import {Pillarbox} from 'react-native-pillarbox'

export default function App() {
  return (

    <View style={styles.container}>
      <Text>Coucou pillarbox</Text>
    </View>
  );
}


const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  box: {
    width: 60,
    height: 60,
    marginVertical: 20,
  },
});
