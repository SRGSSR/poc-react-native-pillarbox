import React from 'react';

import { StyleSheet, View } from 'react-native';
import { PillarboxView } from 'react-native-pillarbox';

export default function App() {
  return (
    <View style={styles.container}>
      <PillarboxView color="#32a852" style={styles.box} />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
    backgroundColor: 'black',
  },
  box: {
    width: 500,
    height: 250,
    marginVertical: 20,
  },
});
