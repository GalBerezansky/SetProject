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

@property (strong , nonatomic) CardMatchingGame * game; //abstract

- (Deck *) createDeck; //abstract

-(NSString *)titleForCard:(Card *) card; //abstract

-(UIImage *)backgroundImageForCard:(Card *) card; //abstract

-(void) updateUI; //implemented

@end

