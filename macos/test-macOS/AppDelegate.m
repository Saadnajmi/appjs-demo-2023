#import "AppDelegate.h"

#import <React/RCTBridge.h>
#import <React/RCTBundleURLProvider.h>
#import <React/RCTRootView.h>
#include "ViewController.h"

@interface AppDelegate () <RCTBridgeDelegate>

@end

@implementation AppDelegate

- (void)awakeFromNib {
  [super awakeFromNib];

  _bridge = [[RCTBridge alloc] initWithDelegate:self launchOptions:nil];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
  // Insert code here to initialize your application

  // 2
  NSStatusBar *statusBar = [NSStatusBar systemStatusBar];
  [self setStatusItem:[statusBar statusItemWithLength:NSVariableStatusItemLength]];

  NSButton *button = [_statusItem button];
  [button setImage:[NSImage imageWithSystemSymbolName:@"calendar" accessibilityDescription:nil]];
  [button setTarget:self];
  [button setAction:@selector(showPopover:)];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
  // Insert code here to tear down your application
}

// 3
- (void)showPopover:(id)sender {
  NSPopover *popover = [[NSPopover alloc] init];
  [popover setBehavior:NSPopoverBehaviorTransient];


  NSViewController *popoverViewController = [ViewController new];
  [popover setContentViewController:popoverViewController];


  NSButton *statusButton = [_statusItem button];
  [popover showRelativeToRect:[statusButton bounds] ofView:statusButton preferredEdge:NSMinYEdge];
}

#pragma mark - RCTBridgeDelegate Methods

- (NSURL *)sourceURLForBridge:(__unused RCTBridge *)bridge {
  return [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index"]; // .jsbundle;
}

@end
