//
//  SetGameViewController.m
//  Set
//
//  Created by Gal Berezansky on 12/08/2020.
//  Copyright © 2020 Gal Bereznaksy. All rights reserved.
//

#import "SetGameViewController.h"
#import "SetCardDeck.h"
#import "SetCard.h"

#define SetMatchMode 3

@interface SetGameViewController ()

@end

@implementation SetGameViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.game.matchMode = SetMatchMode;
}


/**-------------Abstract methods implemantaition--------------------*/
-(Deck *) createDeck{
    return [[SetCardDeck alloc] init];
    
}

-(void) updateCardButton:(UIButton *)cardButton{
    NSUInteger cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
    SetCard * card = (SetCard *)[self.game cardAtIndex:cardButtonIndex];
    [SetGameViewController updateTitleInCardButton:cardButton forCard:card];
    [SetGameViewController updateColorInCardButton:cardButton forCard:card];
    [SetGameViewController updateShadingInCardButton:cardButton forCard:card];
    [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
    cardButton.enabled = !card.isMatched;
}

/*-----------------------------------------------*/

/*-----------Private Helper Methods--------------**/
+(NSDictionary *) stringToColors {
    return @{@"red" : [UIColor redColor] , @"green" : [UIColor greenColor] , @"purple" : [UIColor purpleColor]};
}

+(NSDictionary *) stringToShadingFloat{
    return @{@"hollow" : @0.1 , @"shaded" : @0.5, @"filled" : @1.0};
}

+(void) updateTitleInCardButton:(UIButton *) cardButton forCard:(SetCard *) card{
    [cardButton setTitle:card.description forState:UIControlStateNormal];
}

+(void) updateColorInCardButton:(UIButton *) cardButton forCard:(SetCard *) card{
    UIColor  * cardColor =  [SetGameViewController stringToColors][card.color];
    [cardButton setTitleColor:cardColor forState:UIControlStateNormal];
}

+(void) updateShadingInCardButton:(UIButton *) cardButton forCard:(SetCard *) card{
    float shadingFloatRep  =[[SetGameViewController stringToShadingFloat][card.shading] floatValue];
            [cardButton setTitleColor:[cardButton.currentTitleColor colorWithAlphaComponent:shadingFloatRep] forState:UIControlStateNormal];
}


-(UIImage *)backgroundImageForCard:(Card *) card
{
    return [UIImage imageNamed:card.isChosen ? @"setcardchoosen" : @"setcardfront"];
}

/*-----------------------------------------------*/

@end
