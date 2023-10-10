import type { TurboModule } from 'react-native';
import { TurboModuleRegistry } from 'react-native';

export interface Spec extends TurboModule {

}

export const Pillarbox = TurboModuleRegistry.getEnforcing<Spec>('Pillarbox');