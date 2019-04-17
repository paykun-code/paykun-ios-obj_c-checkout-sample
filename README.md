# iOS Checkout SDK

The iOS SDK library lets you seamlessly integrate the entire payment ecosystem in your iOS application and start accepting payments with Paykun.

## Features | Doc

### Step 1: Get Access Token (For Device)

•    Device access token is bounded with the application package name; hence one Access Token per Application will be granted. 

•    You can generate/regenerate Access token and API KEY by logging into your PayKun Admin panel.

•    Go to: Settings => Security => Device API KEY Here you will find generate button, if you have not generated any Device Access Token before.

•    You must provide the package name of your application to generate the access token.

•    If you have ever generated any Access Token, you will see Package Name with Creation date of it. You won’t be able to retrieve any old Access Token (Due to security concerns), that’s why we have provided regenerate option.

```
Note: Once you regenerate API KEY, your old API KEY will immediately stop working. So be double sure and cautious before regenerating API KEY.
```

### Step 2: Importing the Library

Follow the instruction given below to import the SDK library to your Swift or Objective-C project :

1.    Download the SDK from above and unzip it.
2.    Open your project in XCode and go to file under Menu. Select Add files to "yourproject".
3.    Select PayKun.framework in the directory you just unzipped.
4.    Select the Copy items if needed check-box.
5.    Click Add.
6.    Navigate to Target settings > General and add the Paykun.framework in both Embeded Binaries and Linked Frameworks and Libraries.

### Step 3: Initialize the Paykun SDK

To initialize the Paykun SDK, you will need the following:

•    Device API key 

•    Merchant Id

•    isLive (true for live environment and false for test environment)

```
#import <Paykun/Paykun.h>

@interface ViewController () <PaykunCheckoutDelegate> {
  PaykunCheckout *objPaykun;
}

@implementation ViewController
- (void)viewDidLoad {
  [super viewDidLoad];
  
  objPaykun = [[PaykunCheckout alloc] initWithKey:@"YourApiKey" merchantId:@"YourMerchantId" isLive:true andDelegate:self];
}
```

### Step 4: Pass Payment Parameter and Display Checkout Form

Add the following code to your ViewController or where ever you want to initialize payments:

```
- (void)showPaymentCheckout { 
  [objPaykun checkoutWithCustomerName:@“name” customerEmail:@“email” customerMobile:@“mobile” productName:@“product” orderNo:@“order” amount:@“amount” viewController:self];
}
```

### Step 5: Handle Success and Fail Event

Success
```
- (void)onPaymentSucceed:(NSDictionary *)responce {
  NSString *msg = [NSString stringWithFormat:@"payment success with req_id:%@",[responce valueForKey:@"req_id"]]
  UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@“Success” message:msg delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil]
  [alert show];
}
```

Fail
```
- (void)onPaymentFailed:(NSDictionary *)responce {
  NSString *msg = [NSString stringWithFormat:@"payment fail with req_id:%@",[responce valueForKey:@"req_id"]]
  UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error" message:msg delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil]
  [alert show];
}
```

### Get Transaction Details

```
[objPaykun getTransactionByPaymentId:@"PaymentId" block:^(NSDictionary * _Nonnull responce) {
    NSLog(@"responce: %@",responce);
}];
```


### For further help, see our [Documentation](https://paykun.com/docs) or [Contact Us](https://paykun.com/contact)

