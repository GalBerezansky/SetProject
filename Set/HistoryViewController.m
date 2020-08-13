//
//  HistoryViewController.m
//  Set
//
//  Created by Gal Berezansky on 13/08/2020.
//  Copyright © 2020 Gal Bereznaksy. All rights reserved.
//

#import "HistoryViewController.h"

@implementation HistoryViewController

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    [self updateUI];
    
}

-(void) updateUI{
    self.historyTextView.attributedText = self.historyAttributedString;
}
@end
