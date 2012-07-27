//
//  IBXApplicationBar.h
//  ApplicationBar
//
//

#import <UIKit/UIKit.h>


#define SLIDING_DRAWER_MENU_DEFAULT_HEIGHT 0
#define SLIDING_DRAWER_MENU_DEFAULT_WIDTH  320

#define SLIDING_DRAWER_MENU_ITEM_HEIGHT    44

#define SLIDING_DRAWER_EMPTY_TAG -1

@class SlidingDrawerMenu;

@protocol SlidingDrawerMenuDelegate <NSObject>

@required
- (void)menuItemClicked:(NSInteger)buttonTag 
                 withDrawerMenu:(SlidingDrawerMenu *)drawerMenu;

@optional
- (void)menuItemLongPressed:(NSInteger)buttonTag 
                 withDrawerMenu:(SlidingDrawerMenu *)drawerMenu;

@end

typedef enum
{
  SlidingDrawerMenuDirectionToBottom,
  SlidingDrawerMenuDirectionToTop
} SlidingDrawerMenuDirection;

@interface SlidingDrawerMenu : UIView
{
  SlidingDrawerMenuDirection _direction;
}

@property (nonatomic, assign) id<SlidingDrawerMenuDelegate> menuDelegate;
@property SlidingDrawerMenuDirection direction;

- (id) initWithDirection:(SlidingDrawerMenuDirection)direction;
- (void)addMenuItem:(NSString *)title withTag:(NSInteger)tag;
- (void)addMenuItem:(NSString *)title withIcon:(UIImage *)image withTag:(NSInteger)tag;
- (void)toggleView;

@end
