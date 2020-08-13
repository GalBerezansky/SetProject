//
//  HistoryViewController.h
//  Set
//
//  Created by Gal Berezansky on 13/08/2020.
//  Copyright © 2020 Gal Bereznaksy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HistoryViewController :  UIViewController

@property (strong , nonatomic) NSAttributedString * historyAttributedString;
@property (weak, nonatomic) IBOutlet UITextView *historyTextView;


-(void) updateUI;


@end

NS_ASSUME_NONNULL_END
