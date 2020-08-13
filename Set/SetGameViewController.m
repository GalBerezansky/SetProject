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

static NSString * MATCHED_FORMAT = @"Matched %@ for %d points.";
static NSString * NOT_MATCHED_FORMAT = @"%@ Don't match! %d penalty points.";

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
    [cardButton setAttributedTitle:[SetGameViewController cardToAttributedStringRep:card] forState:UIControlStateNormal];
    [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
    cardButton.enabled = !card.isMatched;
}

-(NSAttributedString *)currentGameStateToAttributedString{
    NSMutableAttributedString * resultsLabelString = [[NSMutableAttributedString alloc] init];
    for(SetCard * card in self.game.currentGameState.cardsChoosen){
        [self updateResultAttributedStringByCard:card resultsLabelString:resultsLabelString];

    }
    if(self.game.currentGameState.currentRoundScore > 0){
        [self updateResultAttributedStringByGoodMatch:&resultsLabelString];

        
    }
    else if(self.game.currentGameState.currentRoundScore < 0){
        [self updateResultAttributedStringByBadMatch:resultsLabelString];
    
    }
    return resultsLabelString;
}

/*-----------------------------------------------*/

/*-----------Private Helper Methods--------------**/



- (void)updateResultAttributedStringByCard:(SetCard *)card resultsLabelString:(NSMutableAttributedString *)resultsLabelString {
    NSAttributedString * attributedCard = [SetGameViewController cardToAttributedStringRep:card];
    [resultsLabelString appendAttributedString:attributedCard];
    [resultsLabelString appendAttributedString: [[NSAttributedString alloc] initWithString:@"  "]];
}


- (void)updateResultAttributedStringByGoodMatch:(NSMutableAttributedString **)resultsLabelString {
    NSMutableAttributedString * matched1 = [[NSMutableAttributedString alloc] initWithString:@"Matched "];
    NSAttributedString * matched2 = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@" for %ld points." , self.game.currentGameState.currentRoundScore]];
    [matched1 appendAttributedString:*resultsLabelString];
    [matched1 appendAttributedString:matched2];
    *resultsLabelString = matched1;
}

- (void)updateResultAttributedStringByBadMatch:(NSMutableAttributedString *)resultsLabelString {
    NSAttributedString * matched2 = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@" Don't match! %ld points." , self.game.currentGameState.currentRoundScore]];
    [resultsLabelString appendAttributedString:matched2];
}

+(NSAttributedString *)cardToAttributedStringRep : (SetCard *) card{
    float shadingFloatRep  =[[SetGameViewController stringToShadingFloat][card.shading] floatValue];
    UIColor * cardColor = [SetGameViewController stringToColors][card.color];
    UIColor * cardColorShaded = [cardColor colorWithAlphaComponent:shadingFloatRep];
    NSDictionary * attDic = @{NSForegroundColorAttributeName : cardColorShaded ,NSStrokeColorAttributeName : cardColor, NSStrokeWidthAttributeName : @-5} ;
    NSAttributedString * cardAttributedString = [[NSAttributedString alloc] initWithString:card.description attributes:attDic];
    return cardAttributedString;
}

+(NSDictionary *) stringToColors {
    return @{@"red" : [UIColor redColor] , @"green" : [UIColor greenColor] , @"purple" : [UIColor purpleColor]};
}

+(NSDictionary *) stringToShadingFloat{
    return @{@"hollow" : @0 , @"shaded" : @0.3, @"filled" : @1.0};
}

-(UIImage *)backgroundImageForCard:(Card *) card
{
    return [UIImage imageNamed:card.isChosen ? @"setcardchoosen" : @"setcardfront"];
}

/*-----------------------------------------------*/

@end
