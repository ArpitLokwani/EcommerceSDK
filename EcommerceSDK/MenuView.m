//
//  MenuView.m
//  EcommerceSDK
//
//  Created by Arpit Lokwani on 5/29/16.
//  Copyright © 2016 Arpit Lokwani. All rights reserved.
//

#import "MenuView.h"

@implementation MenuView


- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.frame = frame;
        
         UILabel *firstnameTextField = [[UILabel alloc]initWithFrame:CGRectMake(10, 20, frame.size.width-40, 30)];
        firstnameTextField.textColor = [UIColor colorWithRed:51.0/255.0f green:51.0/255.0f blue:51.0/255.0f alpha:1.0f];
        [self addSubview:firstnameTextField];
        self.backgroundColor = [UIColor redColor];
        
        
    }
    
    
    return self;
    
    
}

@end
