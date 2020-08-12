//
//  Card.m
//  SetProject 12/08/2020
//
//  Created by Gal Berezansky on 05/08/2020.
//  Copyright © 2020 Gal Bereznaksy. All rights reserved.
//

#import "Card.h"

@implementation Card

-(int)match: (NSArray *) otherCards{ //abstract method
    return 0;
//    int score = 0;
//    for(Card * card in otherCards){
//        if([card.contents isEqualToString: self.contents]){
//            score = 1;
//        }
//    }
//    return score;
}

@end
