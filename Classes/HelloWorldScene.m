//
//  HelloWorldLayer.m
//  FirstGame
//
//  Created by Anthony Feick on 2/18/11.
//  Copyright W3i 2011. All rights reserved.
//

// Import the interfaces
#import "HelloWorldScene.h"
#import	"GamePlay.h"

// HelloWorld implementation
@implementation HelloWorld

+(id) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorld *layer = [HelloWorld node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

-(void) goToGameplay:(id)sender {
	
	[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1 scene:[GamePlay node]]]; 
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init] )) {
		
//		// create and initialize a Label
//		CCLabelTTF *label = [CCLabelTTF labelWithString:@"Hello World" fontName:@"Marker Felt" fontSize:64];
//
//		// ask director the the window size
//		CGSize size = [[CCDirector sharedDirector] winSize];
//	
//		// position the label on the center of the screen
//		label.position =  ccp( size.width /2 , size.height/2 );
//		
//		// add the label as a child to this Layer
//		[self addChild: label];
		
		//set background image
		CCSprite *bg = [CCSprite spriteWithFile:@"background_01.png"];
		bg.anchorPoint = ccp(0, 0);
		bg.position = ccp(0, 0);
		[self addChild:bg z:0];
		
		//set up the menu
		[CCMenuItemFont setFontName:@"Marker Felt"];
		[CCMenuItemFont setFontSize:35];
		
		//create menu button and menu
		CCMenuItem * Play = [CCMenuItemFont itemFromString:@"PLAY" target:self selector:@selector(goToGameplay:)];
		CCMenu * menu = [CCMenu menuWithItems: Play, nil];
		menu.position = ccp(240,160);
		
		[self addChild:menu];
		
	}
	return self;
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}
@end
