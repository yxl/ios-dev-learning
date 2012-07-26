//
//  IBXApplicationBar.m
//  ApplicationBar
//
//

#import "IBXApplicationBar.h"

#define DEFAULT_PADDING    10
#define HIDE_BUTTON_HEIGHT 480
#define DEFAULT_DURATION   0.2

@interface IBXApplicationBar ()
{
  NSMutableArray * _optionButtons;
  
  // It is a transparent button which will fill the resest of the screen
  // when the list expands and let user make it contract.
  UIButton * _hideButton;
  
  UIView * _contentView;
}

@end

@implementation IBXApplicationBar

@synthesize barDelegate = _barDelegate;

- (void)dealloc
{
  _barDelegate = nil;
  _hideButton = nil;
  _contentView = nil;
  _optionButtons = nil;  
}

- (id)init
{
  self = [super init];
  if (self) 
  {
    _contentView = [[UIView alloc] init];
    _contentView.backgroundColor = [UIColor blackColor];
    [self addSubview:_contentView];
    
    _optionButtons = [[NSMutableArray alloc] init];

    _hideButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _hideButton.frame = CGRectZero;
    [_hideButton addTarget:self 
                    action:@selector(toggleView) 
          forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_hideButton];
    [self sendSubviewToBack:_hideButton];
    
    UISwipeGestureRecognizer * gestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeDetected:)];
    gestureRecognizer.direction = UISwipeGestureRecognizerDirectionUp;
    [self addGestureRecognizer:gestureRecognizer];
    
    self.userInteractionEnabled = YES;
  }
  
  return self;
}



#pragma mark - gestureRecognizer

- (void)swipeDetected:(UISwipeGestureRecognizer *)recoginzer
{
  [self toggleView];
}

#pragma mark - other

- (CGFloat)heightForOptionButtons
{
  CGFloat height = 0;
  for (UIButton * button in _optionButtons) {
    height += button.frame.size.height;
  }
  
  return height;
}

- (BOOL)minState
{
  return (self.frame.size.height == IBX_APPLICATION_BAR_DEFAULT_HEIGHT);
}

- (void)toggleView
{
  [UIView animateWithDuration:DEFAULT_DURATION animations:^(void) {
    if ([self minState]) 
    {
      CGRect frame = self.frame;
      frame.size.height = IBX_APPLICATION_BAR_DEFAULT_HEIGHT + [self heightForOptionButtons] + HIDE_BUTTON_HEIGHT;
      frame.origin.y -= [self heightForOptionButtons] + HIDE_BUTTON_HEIGHT;
      self.frame = frame;
      
      frame = _contentView.frame;
      frame.size.height = IBX_APPLICATION_BAR_DEFAULT_HEIGHT + [self heightForOptionButtons];
      frame.origin.y += HIDE_BUTTON_HEIGHT;
      _contentView.frame = frame;
    }
    else 
    {
      CGRect frame = self.frame;
      frame.size.height = IBX_APPLICATION_BAR_DEFAULT_HEIGHT;
      frame.origin.y += [self heightForOptionButtons] + HIDE_BUTTON_HEIGHT;
      self.frame = frame;
      
      frame = _contentView.frame;
      frame.size.height = IBX_APPLICATION_BAR_DEFAULT_HEIGHT + [self heightForOptionButtons];
      frame.origin.y -= HIDE_BUTTON_HEIGHT;
      _contentView.frame = frame;
    }
  } completion:^(BOOL finished) {
    // do nothing.
  }];
}

- (void)responseButtonTag:(id)sender
{
  if (![sender isKindOfClass:[UIButton class]]) return;
  
  if (_barDelegate 
      && [_barDelegate respondsToSelector:@selector(barButtonClicked:withBar:)]) 
  {
    UIButton * button = sender;
    [_barDelegate barButtonClicked:button.tag withBar:self];
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
        && [_barDelegate respondsToSelector:@selector(barButtonLongPressed:withBar:)]) {
      UIButton * sender = (UIButton *)recoginzer.view;
      [_barDelegate barButtonLongPressed:sender.tag withBar:self];
    }
  }
}

- (void)optionButtonClicked:(id)sender
{
  [self responseButtonTag:sender];
  
  [self toggleView];
}

#pragma mark - public

#pragma mark - option button

- (void)addOptionButton:(NSString *)title 
                withTag:(NSInteger)tag
{
  [self addOptionButton:title withIcon:nil withTag:tag];
}

- (void)addOptionButton:(NSString *)title withIcon:(UIImage *)image withTag:(NSInteger)tag
{
  CGFloat height = [self heightForOptionButtons] + IBX_APPLICATION_BAR_DEFAULT_HEIGHT;
  
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
                            IBX_APPLICATION_BAR_BUTTON_HEIGHT);
  [button addTarget:self 
             action:@selector(optionButtonClicked:) 
   forControlEvents:UIControlEventTouchUpInside];
  
  [_optionButtons addObject:button];
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
  frame.size.width = IBX_APPLICATION_BAR_DEFAULT_WIDTH;
  frame.size.height = IBX_APPLICATION_BAR_DEFAULT_HEIGHT;
  _contentView.frame = frame;
  self.frame = _contentView.frame;
}

@end
