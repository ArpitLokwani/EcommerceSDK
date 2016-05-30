//
//  ViewController.h
//  EcommerceSDK
//
//  Created by Arpit Lokwani on 5/29/16.
//  Copyright © 2016 Arpit Lokwani. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UIButton *Menubutton;
@property  BOOL viewisHidden;

- (IBAction)MenuButtonClicked:(id)sender;
@end

