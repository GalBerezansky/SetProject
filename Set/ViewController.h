//
//  ViewController.h
//  Set
//
//  Created by Gal Berezansky on 12/08/2020.
//  Copyright © 2020 Gal Bereznaksy. All rights reserved.
//
//Abstract class

#import <UIKit/UIKit.h>
#import "Deck.h"
#import "CardMatchingGame.h"

@interface ViewController : UIViewController

//protected for subclasses

@property (strong , nonatomic) CardMatchingGame * game;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;

@property (weak, nonatomic) IBOutlet UILabel *reultsLabel;

@property (strong , nonatomic) NSMutableAttributedString * gameHistoryAttributedString;

- (Deck *) createDeck; //abstract

- (void)updateCardButton:(UIButton *)cardButton; //abstract

-(void) updateResultsLabel; //abstract

-(NSAttributedString *)currentGameStateToAttributedString; //abstract

-(void) updateUI; //implemented

-(void) updateHistory; //implemented



@end

