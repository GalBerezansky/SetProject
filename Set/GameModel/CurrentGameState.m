//
//  CurrentGameState.m
//  Set
//
//  Created by Gal Berezansky on 13/08/2020.
//  Copyright © 2020 Gal Bereznaksy. All rights reserved.
//

#import "CurrentGameState.h"


@interface CurrentGameState()

@property (nonatomic,strong) NSMutableArray *cards;

@end

@implementation CurrentGameState

-(instancetype) initWithCards:(NSMutableArray *) cards{
    self = [super init];
    if(self)
        self.cards = cards;
    return self;
}

-(void) updateCurrentGameState : (NSUInteger) currentScore{
    self.cardsChoosen = [NSMutableArray array];
    for(Card * card in self.cards){
        if(card.chosen && !card.matched){
            [self.cardsChoosen addObject:card];
        }
    }
    self.currentScore = currentScore;
}


@end
