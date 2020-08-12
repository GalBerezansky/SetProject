//
//  PlayingCardGameViewController.m
//  Set
//
//  Created by Gal Berezansky on 12/08/2020.
//  Copyright © 2020 Gal Bereznaksy. All rights reserved.
//

#import "PlayingCardGameViewController.h"
#import "PlayingCardDeck.h"
#define PlayCardMatchMode 2

@interface PlayingCardGameViewController ()

@end

@implementation PlayingCardGameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.game.matchMode = PlayCardMatchMode;
}

/**-------------Abstract methods implemantaition--------------------*/
-(Deck *) createDeck{
    return [[PlayingCardDeck alloc] init];
}

-(void) updateResultsLabel{
    self.reultsLabel.text =  [self.game description];

}


-(void) updateCardButton: (UIButton * ) cardButton{
    NSUInteger cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
    Card * card = [self.game cardAtIndex:cardButtonIndex];
    [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
    [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
    cardButton.enabled = !card.isMatched;
}

/*-----------------------------------------------*/

-(NSString *)titleForCard:(Card *) card{
    return card.isChosen ? card.description : @"";
}

-(UIImage *)backgroundImageForCard:(Card *) card
{
    return [UIImage imageNamed:card.isChosen ? @"playcardfront" : @"playcardback"];
}



@end
