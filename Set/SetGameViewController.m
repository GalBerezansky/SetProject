//
//  SetGameViewController.m
//  Set
//
//  Created by Gal Berezansky on 12/08/2020.
//  Copyright © 2020 Gal Bereznaksy. All rights reserved.
//

#import "SetGameViewController.h"
#import "SetCardDeck.h"

@interface SetGameViewController ()

@end

@implementation SetGameViewController

-(Deck *) createDeck{
    return [[SetCardDeck alloc] init];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.game.matchMode = 3;
}
-(NSString *)titleForCard:(Card *) card{
    return card.description;
}

-(UIImage *)backgroundImageForCard:(Card *) card
{
    return [UIImage imageNamed:card.isChosen ? @"setcardchoosen" : @"setcardfront"];
}

@end
