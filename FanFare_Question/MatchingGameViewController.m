//
//  MatchingGameViewController.m
//  FanFare_Question
//
//  Created by Ekta Agrawal on 9/17/14.
//  Copyright (c) 2014 ekta. All rights reserved.
//

#import "MatchingGameViewController.h"
#import "ProfileModel.h"
#import "MatchingGameTableViewCell.h"
#import "Leader.h"
#import "Profile.h"
#import "ProfileView.h"

@interface MatchingGameViewController ()

@property(strong,nonatomic) Profile *profile;
@property (weak,nonatomic) IBOutlet UITableView *recordsTable;
@property (weak,nonatomic) IBOutlet ProfileView *profileView;
@end

@implementation MatchingGameViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self getProfile];
    
}
-(void)getProfile{
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(self.view.bounds.size.width/2-50, self.view.bounds.size.height/2-50, 100, 100)];
    indicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    [self.recordsTable addSubview:indicator];
    [indicator startAnimating];
    [ProfileModel getProfileWithCallBack:^(BOOL success, id response) {
        
        
        if(success && response)
        {
                dispatch_async(dispatch_get_main_queue(), ^{
                [indicator stopAnimating];
                self.profile =(Profile*)response;
                [self.profileView updateViewForProfile:self.profile];
                [self.recordsTable reloadData];
                });

        }
        else
        {
            NSLog(@"Records not found");
            dispatch_async(dispatch_get_main_queue(), ^{
            [indicator stopAnimating];
            });
        }
    }];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return [[self.profile leaders] count];
}


 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
 {
     NSString *cellIdentifier = @"ProfileCell";
     MatchingGameTableViewCell *cell =(MatchingGameTableViewCell*) [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
     if(cell == nil)
     {
         cell = (MatchingGameTableViewCell*) [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
         
     }
     [cell updateCellWithLeader:[[self.profile leaders] objectAtIndex:indexPath.row]];
 // Configure the cell...
 
 return cell;
 }

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
