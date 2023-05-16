#import "ViewController.h"
#import "AppDelegate.h"

#import <React/RCTRootView.h>

@implementation ViewController

// 4
- (void)loadView {
  [self setView:[NSView new]];
  [[self view] setFrame:NSMakeRect(0, 0, 310, 310)];
}

- (void)viewDidLoad {
  [super viewDidLoad];

  RCTBridge *bridge = [((AppDelegate *)[NSApp delegate])bridge];
  RCTRootView *rootView = [[RCTRootView alloc] initWithBridge:bridge moduleName:@"test" initialProperties:nil];

  NSView *view = [self view];

  [view addSubview:rootView];
  [rootView setBackgroundColor:[NSColor windowBackgroundColor]];
  [rootView setFrame:[view bounds]];
  [rootView setAutoresizingMask:(NSViewMinXMargin | NSViewMaxXMargin | NSViewMinYMargin | NSViewMaxYMargin | NSViewWidthSizable | NSViewHeightSizable)];
}

@end
