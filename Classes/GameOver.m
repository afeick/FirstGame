//
//  GameOver.m
//  FirstGame
//
//  Created by Anthony Feick on 2/18/11.
//  Copyright 2011 W3i. All rights reserved.
//

#import "GameOver.h"
#import "HelloWorldScene.h"


@implementation GameOver

+(id) scene {
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	GameOver *layer = [GameOver node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

-(void) ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	
	[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1 scene:[HelloWorld node]]];

}

-(id) init {
	
	if( (self=[super init] )) {
		
		self.isTouchEnabled = YES;
		
		CCLabelTTF* label = [CCLabelTTF labelWithString:@"Game Over" fontName:@"Marker Felt" fontSize:60];
		label.position = ccp(240, 240);
		
		CCLabelTTF* label2 = [CCLabelTTF labelWithString:@"Touch to go to main menu" fontName:@"Marker Felt" fontSize:35];
		label2.position = ccp(240, 131.67f);
		
		[self addChild: label];
		[self addChild: label2];
		
	}
	return self;
}

@end
