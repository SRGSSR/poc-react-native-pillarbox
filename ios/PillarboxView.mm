#ifdef RCT_NEW_ARCH_ENABLED
#import "PillarboxView.h"

#import <react/renderer/components/RNPillarboxViewSpec/ComponentDescriptors.h>
#import <react/renderer/components/RNPillarboxViewSpec/EventEmitters.h>
#import <react/renderer/components/RNPillarboxViewSpec/Props.h>
#import <react/renderer/components/RNPillarboxViewSpec/RCTComponentViewHelpers.h>

#import "RCTFabricComponentsPlugins.h"
#import "Utils.h"

using namespace facebook::react;

@interface PillarboxView () <RCTPillarboxViewViewProtocol>

@end

@implementation PillarboxView {
    UIView * _view;
}

+ (ComponentDescriptorProvider)componentDescriptorProvider
{
    return concreteComponentDescriptorProvider<PillarboxViewComponentDescriptor>();
}

- (instancetype)initWithFrame:(CGRect)frame
{
  NSLog(@"Jaja");
  if (self = [super initWithFrame:frame]) {
    static const auto defaultProps = std::make_shared<const PillarboxViewProps>();
    _props = defaultProps;

    _view = [[UIView alloc] init];

    self.contentView = _view;
  }

  return self;
}

- (void)updateProps:(Props::Shared const &)props oldProps:(Props::Shared const &)oldProps
{
    const auto &oldViewProps = *std::static_pointer_cast<PillarboxViewProps const>(_props);
    const auto &newViewProps = *std::static_pointer_cast<PillarboxViewProps const>(props);

    if (oldViewProps.color != newViewProps.color) {
        NSString * colorToConvert = [[NSString alloc] initWithUTF8String: newViewProps.color.c_str()];
        [_view setBackgroundColor: [Utils hexStringToColor:colorToConvert]];
    }

    [super updateProps:props oldProps:oldProps];
}

Class<RCTComponentViewProtocol> PillarboxViewCls(void)
{
    return PillarboxView.class;
}

@end
#endif
