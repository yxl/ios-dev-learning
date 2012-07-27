//
//  IBXApplicationBar.m
//  ApplicationBar
//
//

#import "SlidingDrawerMenu.h"

#define DEFAULT_PADDING    10
#define HIDE_BUTTON_HEIGHT 480
#define DEFAULT_DURATION   0.2
#define WINDOW_HEIGHT      460

@interface SlidingDrawerMenu ()
{
  NSMutableArray * _menuItemButtons;
  
  // It is a transparent button which will fill the resest of the screen
  // when the list expands and let user make it contract.
  UIButton * _hideButton;
  
  UIView * _contentView;
}

- (void) expand;

- (void) contract;

@end

@implementation SlidingDrawerMenu

@synthesize menuDelegate = _menuDelegate;

- (void)dealloc
{
  _menuDelegate = nil;
  _hideButton = nil;
  _contentView = nil;
  _menuItemButtons = nil;  
}

- (id) initWithDirection:(SlidingDrawerMenuDirection) direction
{
  self = [super init];
  if (self) 
  {
    _direction = direction;
    _contentView = [[UIView alloc] init];
    _contentView.backgroundColor = [UIColor blackColor];
    [self addSubview:_contentView];
    
    _menuItemButtons = [[NSMutableArray alloc] init];
    
    _hideButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _hideButton.frame = CGRectZero;
    [_hideButton addTarget:self 
                    action:@selector(toggleView) 
          forControlEvents:UIControlEventTouchUpInside];
    [_hideButton setTitle:@"Hidden" forState:UIControlStateNormal];
    [self addSubview:_hideButton];
    [self sendSubviewToBack:_hideButton];
    
    UISwipeGestureRecognizer * gestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeDetected:)];
    gestureRecognizer.direction = UISwipeGestureRecognizerDirectionUp;
    [self addGestureRecognizer:gestureRecognizer];
    
    self.userInteractionEnabled = YES;
  }
  
  return self;
}

#pragma mark - direction property

- (void)setDirection:(SlidingDrawerMenuDirection)direction
{
  if (_direction == direction)
  {
    return;
  }
  
  _direction = direction;
  [self contract];
}

- (SlidingDrawerMenuDirection) direction
{
  return _direction;
}

#pragma mark - gestureRecognizer

- (void)swipeDetected:(UISwipeGestureRecognizer *)recoginzer
{
  [self toggleView];
}

#pragma mark - other

- (CGFloat)heightForMenuItems
{
  CGFloat height = 0;
  for (UIButton * button in _menuItemButtons) {
    height += button.frame.size.height;
  }
  
  return height;
}

- (BOOL)minState
{
  return (self.frame.size.height == SLIDING_DRAWER_MENU_DEFAULT_HEIGHT);
}

- (void)toggleView
{
  [UIView animateWithDuration:DEFAULT_DURATION animations:^(void) {
    if ([self minState]) 
    {
      [self expand];
    }
    else 
    {
      [self contract];
    }
  } completion:^(BOOL finished) {
    // do nothing.
  }];
}


- (void) expand
{
  CGFloat menuHeight = SLIDING_DRAWER_MENU_DEFAULT_HEIGHT + [self heightForMenuItems];
  if (_direction == SlidingDrawerMenuDirectionToTop)
  {
    CGRect frame = self.frame;
    frame.size.height = menuHeight + HIDE_BUTTON_HEIGHT;
    frame.origin.y = - menuHeight;
    self.frame = frame;
    
    frame = _contentView.frame;
    frame.size.height = menuHeight;
    frame.origin.y = WINDOW_HEIGHT;
    _contentView.frame = frame;
  }
  else 
  {
    CGRect frame = self.frame;
    frame.size.height = menuHeight + HIDE_BUTTON_HEIGHT;
    frame.origin.y = 0;
    self.frame = frame;
    
    frame = _contentView.frame;
    frame.size.height = menuHeight;
    frame.origin.y = 0;
    _contentView.frame = frame;    
  }
}

- (void) contract
{
  CGFloat menuHeight = SLIDING_DRAWER_MENU_DEFAULT_HEIGHT + [self heightForMenuItems];
  if (_direction == SlidingDrawerMenuDirectionToTop)
  {
    CGRect frame = self.frame;
    frame.size.height = SLIDING_DRAWER_MENU_DEFAULT_HEIGHT;
    frame.origin.y = WINDOW_HEIGHT;
    self.frame = frame;
    
    frame = _contentView.frame;
    frame.size.height = menuHeight;
    frame.origin.y = WINDOW_HEIGHT;
    _contentView.frame = frame;
  }
  else 
  {
    CGRect frame = self.frame;
    frame.size.height = SLIDING_DRAWER_MENU_DEFAULT_HEIGHT;
    frame.origin.y = -HIDE_BUTTON_HEIGHT;
    self.frame = frame;
    
    frame = _contentView.frame;
    frame.size.height = menuHeight;
    frame.origin.y = 0;
    _contentView.frame = frame;
  }
}

- (void)responseButtonTag:(id)sender
{
  if (![sender isKindOfClass:[UIButton class]]) return;
  
  if (_menuDelegate 
      && [_menuDelegate respondsToSelector:@selector(barButtonClicked:withBar:)]) 
  {
    UIButton * button = sender;
    [_menuDelegate menuItemClicked:button.tag withDrawerMenu:self];
  }
}

- (void)displayButtonClicked:(id)sender
{
  [self responseButtonTag:sender];
}

- (void)displayButtonLongPressed:(UILongPressGestureRecognizer *)recoginzer
{
  if (recoginzer.state == UIGestureRecognizerStateBegan) 
  {
    if ([recoginzer.view isKindOfClass:[UIButton class]]
        && [_menuDelegate respondsToSelector:@selector(barButtonLongPressed:withBar:)]) 
    {
      UIButton * sender = (UIButton *)recoginzer.view;
      [_menuDelegate menuItemLongPressed:sender.tag withDrawerMenu:self];
    }
  }
}

- (void)menuItemClicked:(id)sender
{
  [self responseButtonTag:sender];
  
  [self toggleView];
}

#pragma mark - public

#pragma mark - option button

- (void)addMenuItem:(NSString *)title 
            withTag:(NSInteger)tag
{
  [self addMenuItem:title withIcon:nil withTag:tag];
}

- (void)addMenuItem:(NSString *)title withIcon:(UIImage *)image withTag:(NSInteger)tag
{
  CGFloat height = [self heightForMenuItems] + SLIDING_DRAWER_MENU_DEFAULT_HEIGHT;
  
  UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
  button.tag = tag;
  button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
  [button setTitle:title forState:UIControlStateNormal];
  [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
  [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
  if (image != nil) 
  { 
    [button setImage:image forState:UIControlStateNormal];
    [button setTitleEdgeInsets:UIEdgeInsetsMake(0, DEFAULT_PADDING, 0, 0)];
  }
  
  [button sizeToFit];
  button.frame = CGRectMake(DEFAULT_PADDING, height,
                            self.frame.size.width - 5 * DEFAULT_PADDING, 
                            SLIDING_DRAWER_MENU_ITEM_HEIGHT);
  [button addTarget:self 
             action:@selector(menuItemClicked:) 
   forControlEvents:UIControlEventTouchUpInside];
  
  [_menuItemButtons addObject:button];
  [_contentView addSubview:button];
}

#pragma - UIView

- (void)layoutSubviews
{
  [super layoutSubviews];
  
  _hideButton.frame = CGRectMake(0, 0, self.frame.size.width, HIDE_BUTTON_HEIGHT);
}

- (void)sizeToFit
{
  [super sizeToFit];
  
  CGRect frame = _contentView.frame;
  frame.size.width = SLIDING_DRAWER_MENU_DEFAULT_WIDTH;
  frame.size.height = SLIDING_DRAWER_MENU_DEFAULT_HEIGHT;
  _contentView.frame = frame;
  self.frame = _contentView.frame;
}

@end
