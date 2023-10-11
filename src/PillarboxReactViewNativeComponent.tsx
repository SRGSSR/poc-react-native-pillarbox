import type {ViewProps} from 'ViewPropTypes';
import type {HostComponent} from 'react-native';
import codegenNativeComponent from 'react-native/Libraries/Utilities/codegenNativeComponent';

export interface NativeProps extends ViewProps {
  // add other props here
}
export default codegenNativeComponent<NativeProps>(
  'PillarboxReactView',
) as HostComponent<NativeProps>;