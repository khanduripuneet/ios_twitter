//
//  ComposeViewController.h
//  twitter
//
//  Created by Puneet Khanduri on 10/23/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ComposeViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *tweetMessage;
@property (strong, nonatomic) Tweet* tweet;
- (IBAction)sendTweet:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *sendButton;


@end
