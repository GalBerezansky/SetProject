//
//  Deck.m
//  SetProject 12/08/2020
//
//  Created by Gal Berezansky on 05/08/2020.
//  Copyright © 2020 Gal Bereznaksy. All rights reserved.
//

#import "Deck.h"

@interface Deck()
@property (strong , nonatomic) NSMutableArray *cards; //of Card

@end

@implementation Deck

-(NSMutableArray * )cards{
    if(!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

-(void)addCard:(Card *)card atTop:(BOOL)atTop{
    if(atTop){
        [self.cards insertObject:card atIndex:0];
    }
    else{
        [self.cards addObject:card];
    }
}

-(void)addCard:(Card *)card{
    return [self addCard: card atTop:NO];
}

- (Card *) drawRandomCard{
    Card * randomCard = nil;
    if([self.cards count]){
        unsigned index = arc4random() % [self.cards count];
        randomCard = self.cards[index];
        [self.cards removeObjectAtIndex:index];
    }
    return randomCard;
    
}

@end
