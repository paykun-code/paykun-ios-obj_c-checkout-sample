
#import "ViewController.h"

@interface ViewController () <PaykunCheckoutDelegate>
{
    PaykunCheckout *objPaykun;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // initialization method
    objPaykun = [[PaykunCheckout alloc] initWithKey:@"YourApiKey" merchantId:@"YourMerchantId" isLive:false andDelegate: self];
}

#pragma mark - IBAction Method
-(IBAction)showPaymentCheckout{
    
    NSString *orderId = [[NSNumber numberWithInt:1 + arc4random_uniform(9)] stringValue];
    for (int i = 0; i < 9; i++) {
        orderId = [orderId stringByAppendingString:[[NSNumber numberWithInt:arc4random_uniform(10)] stringValue]];
    }
    
    // open checkout method
    [objPaykun checkoutWithCustomerName:@"Paul" customerEmail:@"example@mail.com" customerMobile:@"1234567890" productName:@"Stationery" orderNo:orderId amount:@"10" currency:@"INR" viewController:self];
}

#pragma mark - PaykunCheckoutDelegate
- (void)onPaymentFailed:(NSDictionary *)responce {
    
    NSString *paymentId = [responce valueForKey:@"transactionId"];
    
    // get transaction detail
    [objPaykun getTransactionByPaymentId:paymentId block:^(NSDictionary * _Nonnull responce) {
        NSLog(@"responce %@",responce);
    }];
}

- (void)onPaymentSucceed:(NSDictionary *)responce {
    
    NSString *paymentId = [responce valueForKey:@"transactionId"];
    
    // get transaction detail
    [objPaykun getTransactionByPaymentId:paymentId block:^(NSDictionary * _Nonnull responce) {
        NSLog(@"responce %@",responce);
    }];
}



@end
