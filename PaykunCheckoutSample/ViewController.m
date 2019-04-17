
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
    [objPaykun checkoutWithCustomerName:@"Paul" customerEmail:@"example@mail.com" customerMobile:@"" productName:@"Stationery" orderNo:orderId amount:@"10" viewController:self];
}

#pragma mark - PaykunCheckoutDelegate
- (void)onPaymentFailed:(NSDictionary *)responce {
    
    NSString *msg = [NSString stringWithFormat:@"fail with req_id:%@",[responce valueForKey:@"req_id"]];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Oops" message:msg preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okButton = [UIAlertAction actionWithTitle:@"OKay" style:UIAlertActionStyleDefault handler:nil];
    
    [alert addAction:okButton];
    [self presentViewController:alert animated:YES completion:nil];
    
    // get transaction detail
    [objPaykun getTransactionByPaymentId:[responce valueForKey:@"req_id"] block:^(NSDictionary * _Nonnull responce) {
        NSLog(@"responce %@",responce);
    }];
}

- (void)onPaymentSucceed:(NSDictionary *)responce {
    
    NSString *msg = [NSString stringWithFormat:@"success with req_id:%@",[responce valueForKey:@"req_id"]];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Oops" message:msg preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okButton = [UIAlertAction actionWithTitle:@"OKay" style:UIAlertActionStyleDefault handler:nil];
    
    [alert addAction:okButton];
    [self presentViewController:alert animated:YES completion:nil];
    
    // get transaction detail
    [objPaykun getTransactionByPaymentId:[responce valueForKey:@"req_id"] block:^(NSDictionary * _Nonnull responce) {
        NSLog(@"responce %@",responce);
    }];
}



@end
