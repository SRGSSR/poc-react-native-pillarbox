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
  
  UIViewController *playerViewController = PlayerView.view;
  UIViewController *rootViewController = [[[[UIApplication sharedApplication] windows] firstObject] rootViewController];
  
  
  [rootViewController addChildViewController:playerViewController];
  playerViewController.view.frame = rootViewController.view.frame;
  [rootViewController.view addSubview:playerViewController.view];
  [playerViewController didMoveToParentViewController:rootViewController];

  
  playerViewController.view.translatesAutoresizingMaskIntoConstraints = NO;
  [NSLayoutConstraint activateConstraints:@[
    [playerViewController.view.topAnchor constraintEqualToAnchor:rootViewController.view.topAnchor],
    [playerViewController.view.bottomAnchor constraintEqualToAnchor:rootViewController.view.bottomAnchor],
    [playerViewController.view.leadingAnchor constraintEqualToAnchor:rootViewController.view.leadingAnchor],
    [playerViewController.view.trailingAnchor constraintEqualToAnchor:rootViewController.view.trailingAnchor]
  ]];
}

@end
