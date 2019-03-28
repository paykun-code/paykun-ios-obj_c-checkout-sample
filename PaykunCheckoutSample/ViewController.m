
#import "ViewController.h"

@interface ViewController () <PaykunCheckoutDelegate>
{
    PaykunCheckout *objPaykun;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    objPaykun = [[PaykunCheckout alloc] initWithKey: @"297E1CBBD172DA76325163469CB8D1EA" merchantId: @"357851063624213" isLive: false andDelegate: self];
}

#pragma mark - IBAction Method
-(IBAction)showPaymentCheckout{
    
    NSString *orderId = [[NSNumber numberWithInt:1 + arc4random_uniform(9)] stringValue];
    for (int i = 0; i < 9; i++) {
        orderId = [orderId stringByAppendingString:[[NSNumber numberWithInt:arc4random_uniform(10)] stringValue]];
    }
    
    [objPaykun CheckoutWithCustomerName:@"Paul" customerEmail:@"example@mail.com" customerMobile:@"" productName:@"Stationery" orderNo:orderId amount:@"10" viewController:self];
}

#pragma mark - PaykunCheckoutDelegate
- (void)onPaymentFailed:(NSDictionary *)responce {
    
    NSString *msg = [NSString stringWithFormat:@"fail with req_id:%@",[responce valueForKey:@"req_id"]];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Oops" message:msg preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okButton = [UIAlertAction actionWithTitle:@"OKay" style:UIAlertActionStyleDefault handler:nil];
    
    [alert addAction:okButton];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)onPaymentSucceed:(NSDictionary *)responce {
    
    NSString *msg = [NSString stringWithFormat:@"success with req_id:%@",[responce valueForKey:@"req_id"]];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Oops" message:msg preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okButton = [UIAlertAction actionWithTitle:@"OKay" style:UIAlertActionStyleDefault handler:nil];
    
    [alert addAction:okButton];
    [self presentViewController:alert animated:YES completion:nil];
}



@end
