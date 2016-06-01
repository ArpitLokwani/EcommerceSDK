//
//  ViewController.m
//  EcommerceSDK
//
//  Created by Arpit Lokwani on 5/29/16.
//  Copyright © 2016 Arpit Lokwani. All rights reserved.
//

#import "ViewController.h"
#import "CategoryViewController.h"
#import "MenuView.h"
#import "ALCustomColoredAccessory.h"

@interface ViewController ()
{
    MenuView * menu ;
    UITableView *tableViews ;
    UIView *headerview;
    
}
@property NSMutableArray *objects;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (!expandedSections)
    {
        expandedSections = [[NSMutableIndexSet alloc] init];
    }

   
//     menu = [[MenuView alloc]initWithFrame:CGRectMake(0, 60, self.view.frame.size.width/2, self.view.frame.size.height-40)];
//    menu.layer.borderWidth = 1;
//    [self.view addSubview:menu];
    
     headerview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 60)];
    [self.view addSubview:headerview];
    headerview.backgroundColor = [UIColor colorWithRed:238.0/255.0 green:238.0/255.0 blue:238.0/255.0 alpha:1];
    
    UIButton *menuButton = [[UIButton alloc]initWithFrame:CGRectMake(10, 25, 30, 30)];
    menuButton.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"menuButton"]];
    [headerview addSubview:menuButton];
    [menuButton addTarget:self action:@selector(menuButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    

    
    tableViews = [[UITableView alloc] initWithFrame:CGRectMake(0, 60, 0, self.view.frame.size.height-60)];
    tableViews.delegate = self;
    tableViews.dataSource = self;
    [self.view addSubview:tableViews];
    tableViews.layer.borderWidth = 0.5;
    tableViews.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)tableView:(UITableView *)tableView canCollapseSection:(NSInteger)section
{
        return YES;
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([self tableView:tableView canCollapseSection:section])
    {
        if ([expandedSections containsIndex:section])
        {
            return 5; // return rows when expanded
        }
        
        return 1; // only top row showing
    }
    
    // Return the number of rows in the section.
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
   // cell.textLabel.text = @"Hello World";
    if ([self tableView:tableView canCollapseSection:indexPath.section])
    {
        if (!indexPath.row)
        {
            // first row
            cell.textLabel.text = [NSString stringWithFormat:@"Category %ld",(long)indexPath.section]; // only top row showing
            
            if ([expandedSections containsIndex:indexPath.section])
            {
                cell.accessoryView = [ALCustomColoredAccessory accessoryWithColor:[UIColor grayColor] type:ALCustomColoredAccessoryTypeUp];
            }
            else
            {
                cell.accessoryView = [ALCustomColoredAccessory accessoryWithColor:[UIColor grayColor] type:ALCustomColoredAccessoryTypeDown];
            }
        }
        else
        {
            // all other rows
            cell.textLabel.text = [NSString stringWithFormat:@"Sub Category %ld",(long)indexPath.row];
            cell.accessoryView = nil;
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
    }
    else
    {
        cell.accessoryView = nil;
        cell.textLabel.text = @"Normal Cell";
        
    }

    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self tableView:tableView canCollapseSection:indexPath.section])
    {
        if (!indexPath.row)
        {
            // only first row toggles exapand/collapse
            [tableView deselectRowAtIndexPath:indexPath animated:YES];
            
            NSInteger section = indexPath.section;
            BOOL currentlyExpanded = [expandedSections containsIndex:section];
            NSInteger rows;
            
            NSMutableArray *tmpArray = [NSMutableArray array];
            
            if (currentlyExpanded)
            {
                rows = [self tableView:tableView numberOfRowsInSection:section];
                [expandedSections removeIndex:section];
                
            }
            else
            {
                [expandedSections addIndex:section];
                rows = [self tableView:tableView numberOfRowsInSection:section];
            }
            
            for (int i=1; i<rows; i++)
            {
                NSIndexPath *tmpIndexPath = [NSIndexPath indexPathForRow:i
                                                               inSection:section];
                [tmpArray addObject:tmpIndexPath];
            }
            
            UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
            
            if (currentlyExpanded)
            {
                [tableView deleteRowsAtIndexPaths:tmpArray
                                 withRowAnimation:UITableViewRowAnimationTop];
                
                cell.accessoryView = [ALCustomColoredAccessory accessoryWithColor:[UIColor grayColor] type:ALCustomColoredAccessoryTypeDown];
                
            }
            else
            {
                [tableView insertRowsAtIndexPaths:tmpArray
                                 withRowAnimation:UITableViewRowAnimationTop];
                cell.accessoryView =  [ALCustomColoredAccessory accessoryWithColor:[UIColor grayColor] type:ALCustomColoredAccessoryTypeUp];
                
            }
        }
        else {
            NSLog(@"Selected Section is %ld and subrow is %ld ",(long)indexPath.section ,(long)indexPath.row);
            
        }
        
    }
    else{
       // DetailViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
        //[self.navigationController pushViewController:controller animated:YES];
        
    }
    
}

- (void)menuButtonPressed:(id)sender {
    
    
    

    CGRect inFrame = CGRectMake(0, 60, 0, self.view.frame.size.height-60);
    CGRect outFrame = CGRectMake(0, 60, self.view.frame.size.width-self.view.frame.size.width/4, self.view.frame.size.height-60);
    
    if (self.viewisHidden) {
        self.viewisHidden = NO;
        
        [UIView animateWithDuration:0.5
                              delay:0.0
                            options: UIViewAnimationOptionCurveEaseIn
                         animations:^{
                           //  menu.frame = outFrame;
                             tableViews.frame = inFrame;
                             

                         }
                         completion:^(BOOL finished){
                             NSLog(@"outFrame!");
                         }];
        

    } else {
        self.viewisHidden = YES;
        [UIView animateWithDuration:0.5
                              delay:0.0
                            options: UIViewAnimationOptionCurveEaseOut
                         animations:^{
                            // menu.frame = inFrame;
                             tableViews.frame = outFrame;

                         }
                         completion:^(BOOL finished){
                             NSLog(@"inFrame!");
                         }];

    }
//    [UIView beginAnimations:nil context:nil];
//    [UIView setAnimationDuration:0.5];
//    [UIView commitAnimations];
//    
    
//    [self addChildViewController:controller];
//    [controller didMoveToParentViewController:self];
}
@end
