import type {ViewProps} from 'ViewPropTypes';
import type {HostComponent} from 'react-native';
import codegenNativeComponent from 'react-native/Libraries/Utilities/codegenNativeComponent';

export interface NativeProps extends ViewProps {
  text?: string;
  // add other props here
}

export const PillarboxReactView = codegenNativeComponent<NativeProps>(
  'PillarboxReactView',
) as HostComponent<NativeProps>;
