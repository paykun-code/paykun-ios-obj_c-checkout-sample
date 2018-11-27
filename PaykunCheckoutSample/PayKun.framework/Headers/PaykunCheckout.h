
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#pragma mark - PaykunCheckout Delegate
@protocol PaykunCheckoutDelegate <NSObject>
@required
-(void)onPaymentFailed:(NSDictionary *)responce;
-(void)onPaymentSucceed:(NSDictionary *)responce;
@end

@interface PaykunCheckout : NSObject

#pragma mark - UI Method
-(instancetype)initWithKey:(NSString *)key merchantId:(NSString *)merchantid isLive:(BOOL)status andDelegate:(id <PaykunCheckoutDelegate> _Nonnull)delegate;
-(void)CheckoutWithCustomerName:(NSString *)customername customerEmail:(NSString *)customeremail customerMobile:(NSString *)customermobile productName:(NSString *)productname orderNo:(NSString *)orderno amount:(NSString *)amount viewController:(UIViewController *)sampleview;

@end
