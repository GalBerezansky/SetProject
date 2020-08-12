//
//  PlayingCardGameViewController.m
//  Set
//
//  Created by Gal Berezansky on 12/08/2020.
//  Copyright © 2020 Gal Bereznaksy. All rights reserved.
//

#import "PlayingCardGameViewController.h"
#import "PlayingCardDeck.h"

@interface PlayingCardGameViewController ()

@end

@implementation PlayingCardGameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.game.matchMode = 2;
}


-(Deck *) createDeck{
    return [[PlayingCardDeck alloc] init];
}


-(NSString *)titleForCard:(Card *) card{
    return card.isChosen ? card.description : @"";
}

-(UIImage *)backgroundImageForCard:(Card *) card
{
    return [UIImage imageNamed:card.isChosen ? @"playcardfront" : @"playcardback"];
}

@end
