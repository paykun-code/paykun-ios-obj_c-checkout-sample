
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#pragma mark - PaykunCheckout Delegate
@protocol PaykunCheckoutDelegate <NSObject>
@required
-(void)onPaymentFailed:(NSDictionary * _Nonnull)responce;
-(void)onPaymentSucceed:(NSDictionary * _Nonnull)responce;
@end

@interface PaykunCheckout : NSObject

#pragma mark - UI Method
-(_Nonnull instancetype)initWithKey:(NSString * _Nonnull)key merchantId:(NSString * _Nonnull)merchantid isLive:(BOOL)status andDelegate:(id <PaykunCheckoutDelegate> _Nonnull)delegate;
-(void)CheckoutWithCustomerName:(NSString * _Nonnull)customername customerEmail:(NSString * _Nonnull)customeremail customerMobile:(NSString * _Nonnull)customermobile productName:(NSString * _Nonnull)productname orderNo:(NSString * _Nonnull)orderno amount:(NSString * _Nonnull)amount viewController:(UIViewController * _Nonnull)sampleview;

@end
