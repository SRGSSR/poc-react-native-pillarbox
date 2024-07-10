#import <React/RCTViewManager.h>
#import <React/RCTUIManager.h>
#import "RCTBridge.h"
#import "Utils.h"
#import "react_native_pillarbox/react_native_pillarbox-Swift.h"
#import <UIKit/NSLayoutConstraint.h>

@interface PillarboxViewManager : RCTViewManager
@end

@implementation PillarboxViewManager

RCT_EXPORT_MODULE(PillarboxView)

- (UIView *)view
{
  return [[UIView alloc] init];
}

RCT_CUSTOM_VIEW_PROPERTY(color, NSString, UIView)
{
  [view setBackgroundColor: [Utils hexStringToColor:json]];
  UIView *playerView = PlayerView.view;
  [view addSubview:playerView];
  playerView.translatesAutoresizingMaskIntoConstraints = NO;
  [NSLayoutConstraint activateConstraints:@[
    [playerView.topAnchor constraintEqualToAnchor:view.topAnchor],
    [playerView.bottomAnchor constraintEqualToAnchor:view.bottomAnchor],
    [playerView.leadingAnchor constraintEqualToAnchor:view.leadingAnchor],
    [playerView.trailingAnchor constraintEqualToAnchor:view.trailingAnchor]
  ]];
}

@end
