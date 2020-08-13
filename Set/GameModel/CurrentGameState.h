//
//  CurrentGameState.h
//  Set
//
//  Created by Gal Berezansky on 13/08/2020.
//  Copyright © 2020 Gal Bereznaksy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

NS_ASSUME_NONNULL_BEGIN


@interface CurrentGameState : NSObject

@property (nonatomic , strong) NSMutableArray<Card *> * cardsChoosen;
@property (nonatomic) BOOL didTheCardsMatched;
@property (nonatomic) NSInteger currentRoundScore;

-(instancetype) initWithCards:(NSMutableArray *) cards;

-(void) updateCurrentRoundGameCardsChoosen;

-(void) updateCurrentRoundGameScore : (NSUInteger) currentScore;

@end

NS_ASSUME_NONNULL_END
