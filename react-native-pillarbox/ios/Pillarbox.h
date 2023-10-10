
#ifdef RCT_NEW_ARCH_ENABLED
#import "RNPillarboxSpec.h"

@interface Pillarbox : NSObject <NativePillarboxSpec>
#else
#import <React/RCTBridgeModule.h>

@interface Pillarbox : NSObject <RCTBridgeModule>
#endif

@end
