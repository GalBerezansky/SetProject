//
//  ViewController.m
//  Matchismo
//
//  Created by Gal Berezansky on 05/08/2020.
//  Copyright © 2020 Gal Bereznaksy. All rights reserved.
//

#import "ViewController.h"
#import "HistoryViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *redealButton;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@end

@implementation ViewController//Abstract class
#pragma mark Instance Methods
- (void)viewDidLoad {
  self.gameHistoryAttributedString = [[NSMutableAttributedString alloc] initWithString:@""];
  [super viewDidLoad];
  self.game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                                usingDeck:[self createDeck]];
  [self updateUI];
}

-(void) updateResultsLabel{
  self.reultsLabel.attributedText =  [self currentGameStateToAttributedString];
  [self updateHistory];
}

- (IBAction)touchCardButton:(UIButton *)sender {
  NSUInteger chooseButtonIndex = [self.cardButtons indexOfObject:sender];
  [self.game chooseCardAtIndex:chooseButtonIndex];
  [self updateUI];
  
}

- (IBAction)touchRedealButton:(UIButton * )sender{
  [self viewDidLoad];
}

-(void) updateUI
{
  for(UIButton * cardButton in self.cardButtons){
    [self updateCardButton:cardButton];
  }
  self.scoreLabel.text = [NSString stringWithFormat:@"Score: %ld" , self.game.score];
  [self updateResultsLabel];
}

-(void) updateHistory{
  NSAttributedString * N = [[NSAttributedString alloc ] initWithString: @"\n"];
  [self.gameHistoryAttributedString appendAttributedString:N];
  [self.gameHistoryAttributedString appendAttributedString:
    [self currentGameStateToAttributedString]];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
  if([segue.identifier isEqualToString:@"MoveToHistory"]){
    if([segue.destinationViewController isKindOfClass:[HistoryViewController class]]){
      HistoryViewController * hvc = (HistoryViewController * )segue.destinationViewController;
      hvc.historyAttributedString = self.gameHistoryAttributedString;
    }
  }
}

#pragma mark Abstract methods
-(Deck *) createDeck //Abstract Method
{
  return nil;
}

- (void)updateCardButton:(UIButton *)cardButton {//Abstract Method
  
}

-(NSAttributedString *)currentGameStateToAttributedString{//Abstract Method
  return nil;
}







@end
