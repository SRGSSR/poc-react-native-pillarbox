import type {HostComponent, ViewProps} from 'react-native';
import codegenNativeComponent from 'react-native/Libraries/Utilities/codegenNativeComponent';
import codegenNativeCommands from 'react-native/Libraries/Utilities/codegenNativeCommands';

interface NativeProps extends ViewProps {
  color?: string;
}

type ComponentType = HostComponent<NativeProps>;

export default codegenNativeComponent<NativeProps>(
  'PillarboxView',
) as HostComponent<NativeProps>;

// Add NativeCommands interface including trigger as the new
// fabric native component method
interface NativeCommands {
  play: (
    viewRef: React.ElementRef<ComponentType>
  ) => void;
}
// Execute codegeNativeCommands function with proper supportedCommands
// as shown below and export it
export const Commands: NativeCommands = codegenNativeCommands<NativeCommands>({
  supportedCommands: ['play'],
});