//
//  IBXApplicationBar.h
//  ApplicationBar
//
//

#import <UIKit/UIKit.h>


#define IBX_APPLICATION_BAR_DEFAULT_HEIGHT 0
#define IBX_APPLICATION_BAR_DEFAULT_WIDTH  320

#define IBX_APPLICATION_BAR_BUTTON_HEIGHT    44
#define IBX_APPLICATION_DISPLAY_BUTTON_WIDTH 40

#define IBX_EMPTY_TAG -1

@class IBXApplicationBar;

@protocol IBXApplicationBarDelegate <NSObject>

@required
- (void)barButtonClicked:(NSInteger)buttonTag 
                 withBar:(IBXApplicationBar *)applicationBar;

@optional
- (void)barButtonLongPressed:(NSInteger)buttonTag 
                 withBar:(IBXApplicationBar *)applicationBar;

@end

@interface IBXApplicationBar : UIView

@property (nonatomic, assign) id<IBXApplicationBarDelegate> barDelegate;

- (void)addOptionButton:(NSString *)title withTag:(NSInteger)tag;
- (void)addOptionButton:(NSString *)title withIcon:(UIImage *)image withTag:(NSInteger)tag;
- (void)toggleView;

@end
