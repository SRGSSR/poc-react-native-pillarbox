import React from 'react';
import type { ViewProps } from 'react-native';
import { Commands, PillarboxView } from './index';

type Props = ViewProps & {
    color: string
};

//type ComponentRef = InstanceType<typeof PillarboxView>;

export default class PillarboxComponent extends React.Component<Props> {
  ref = React.createRef<any>(); //ComponentRef

  // ADD THIS TRIGGER METHOD
  play = () => {
    if(this.ref.current) {
      Commands.play(this.ref.current);
    }
  }

  render() {
    return <PillarboxView {...this.props} ref={this.ref}/>
  }
};