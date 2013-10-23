//
//  TweetViewController.h
//  twitter
//
//  Created by Puneet Khanduri on 10/23/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TweetViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *tweetText;
@property (strong, nonatomic) Tweet* tweet;
- (IBAction)retweetButton:(id)sender;
- (IBAction)favButton:(id)sender;
- (IBAction)replyButton:(id)sender;

@end
