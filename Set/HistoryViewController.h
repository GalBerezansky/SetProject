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

///The attributed string that represents the history of the game.
@property (strong , nonatomic) NSAttributedString * historyAttributedString;

///The UITextView that represents the history of the game.
@property (weak, nonatomic) IBOutlet UITextView *historyTextView;

@end

NS_ASSUME_NONNULL_END
