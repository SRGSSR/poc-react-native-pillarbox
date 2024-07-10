import React, { useRef,useEffect } from 'react';

import { Pressable, StyleSheet, View } from 'react-native';
import PillarboxComponent from '../../src/PillarboxComponent';

export default function App() {
  const pillarbox=useRef<any>();
  return (
    <View style={styles.container}>
      <PillarboxComponent ref={pillarbox} color={"#32a852"} style={styles.box} />
      <Pressable
        style={{
          width: 50,
          height: 50,
          backgroundColor: 'red',
          position: 'absolute',
        }}
        onPress={() => pillarbox.current.play()}
      />
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
