---
layout: post
status: publish
published: true
title: Intro to Sprite Kit using Swift
author:
  display_name: nathan
  login: nathan
  email: ndemick@gmail.com
  url: ''
author_login: nathan
author_email: ndemick@gmail.com
wordpress_id: 604
wordpress_url: http://ganbarugames.com/?p=604
date: '2014-09-09 07:06:56 -0400'
date_gmt: '2014-09-09 11:06:56 -0400'
categories:
- Programming
- Tutorial
tags:
- tutorial
- apple
- swift
- spritekit
comments:
- id: 131
  author: Michael Liendo
  author_email: model3volution@gmail.com
  author_url: ''
  date: '2014-09-17 05:05:00 -0400'
  date_gmt: '2014-09-17 09:05:00 -0400'
  content: this is EXACTLY what I was looking for! Until now, the closest thing I
    could find was using spriteKit with Swift with a game template, when I was simply
    wanting to add some particle Emitters to my single view app! Thank you!
---
<p>Have you started looking at Apple's Objective-C replacement, Swift, yet? If not, now's the time. You'll use the same APIs with Swift, but the language syntax is similar to that of JavaScript or Ruby, which makes it a bit easier to write. While Apple provides some Swift tutorials, I'm mostly interested in using it with Sprite Kit, Apple's home-grown casual game framework. The documentation provided on Apple's developer gives <a href="https://developer.apple.com/library/ios/documentation/GraphicsAnimation/Conceptual/SpriteKit_PG/GettingStarted/GettingStarted.html#//apple_ref/doc/uid/TP40013043-CH2-SW1">an intro to using Sprite Kit with Objective-C</a>, but I thought I'd translate that into Swift for your enlightenment and education.</p>
<h3>Setup</h3>
<p>To start off, open Xcode 6, and choose "Create a new Xcode project." Select "Single View Application" for your application template, and then name your project. I'll name mine "SwiftDemo." Once you choose a location for the project files to be saved, you'll be plopped into the "General" settings panel for the app. The next step is to add <code>SpriteKit.framework</code> to the project. Scroll to the bottom of the panel and find the section titled "Linked Frameworks and Libraries," and click the plus icon. Type "SpriteKit" in the search input, select <code>SpriteKit.framework</code>, then click "Add."</p>
<p>The next task is to set up the app's view controller to use Sprite Kit. Select `Main.storyboard` from the project pane to open it. It has a single view controller and view. Click the large white box, which represents the view. In the Utilities pane on the right side of the window, change the class of the view to <code>SKView</code>. Next, select the <code>ViewController.swift</code> file from the project pane to open it. Change the <code>import UIKit</code> statement to <code>import SpriteKit</code> right below the copyright comment. Next, add some code to the controller's <code>viewDidLoad()</code> method to show some Sprite Kit diagnostic info:</p>
<pre class="brush:js">
override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    var spriteView:SKView = self.view as SKView
    spriteView.showsDrawCount = true
    spriteView.showsNodeCount = true
    spriteView.showsFPS = true
}
</pre>
<p>We're now ready to add the first <code>SKScene</code> to the app. Scenes correspond to the various sections of functionality in your game, such as title, level select, options, and actual game play. Right-click on the project pane and select "New File." Select "Swift" for the file type, and name it <code>HelloScene.swift</code>. The newly created file will be empty, except for an <code>import Foundation</code> line. Change it to <code>import SpriteKit</code>, then create an empty subclass of <code>SKScene</code>:</p>
<pre class="brush:js">
class HelloScene:SKScene {
}
</pre>
<p>Now let's go back to the view controller and have it present the newly-created (and empty) scene.</p>
<pre class="brush:js">
override func viewWillAppear(animated: Bool) {
    var helloScene:HelloScene = HelloScene(size: CGSizeMake(768, 1024))
    var spriteView:SKView = self.view as SKView
    spriteView.presentScene(helloScene)
}
</pre>
<p>Try to build and run the project. You should see a blank screen on the simulator with diagnostic information at the bottom.</p>
<p>Now we'll work on actually adding content to the scene we just created. Add the following into the <code>HelloScene</code> class:</p>
<pre class="brush:js">
var contentCreated:Bool = false
    
override func didMoveToView(view: SKView!) {
    if !contentCreated {
        createSceneContents()
        contentCreated = true
    }
}
</pre>
<p>During the course of your game, scenes will be instantiated, and shuffled around, and deallocated when no longer needed. When the scene moves into view, you want to ensure that it contains your content, but only if it hasn't yet been created. If the scene stays in memory and is re-presented, your initialization code could run twice, which is why we keep track of it with a boolean. Let's implement the <code>createSceneContents()</code> method.</p>
<pre class="brush:js">
func createSceneContents() {
    backgroundColor = SKColor.blueColor()
    scaleMode = SKSceneScaleMode.AspectFit
    addChild(newHelloNode())
}
</pre>
<p>This function does a few things. It changes the background color (obvious), sets the scale mode, and then adds the return value of a <code>newHelloNode()</code> function to the scene. The <code>scaleMode</code> attribute can have two values, <code>SKSceneScaleMode.AspectFit</code> or <code>SKSceneScaleMode.AspectFill</code>. Both modes will ensure your game's aspect ratio stays intact, but "AspectFit" will shrink the view to fit the scene (common side effect: letterboxing), while "AspectFill" fills the scene (but some content might be cut off). It's up to you to decide what technique best fits your game.</p>
<p>Next let's implement the <code>newHelloNode</code> function that adds actual content to the scene. It's pretty straightforward, just creating a label, giving it some properties, then returning it.</p>
<pre class="brush:js">
func newHelloNode() -> SKLabelNode {
    var helloNode:SKLabelNode = SKLabelNode(fontNamed: "Chalkduster")
    helloNode.text = "Hello, World!"
    helloNode.fontSize = 42
    helloNode.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
    return helloNode
}
</pre>
<p>Now when you build and run the project, you should see a blue background with the text "Hello, World!" centered in the screen (notice the letterboxing due to our use of <code>SKSceneScaleMode.AspectFit</code>).</p>
<h3>Animation</h3>
<p>Fluid animation is absolutely necessary in any game. While it might not directly affect game play, its' presence makes the game that much more engaging and "<a href="https://www.youtube.com/watch?v=Fy0aCDmgnxg">juicy</a>." We'll add some animation to the label node in our scene. Add the following line to the <code>newHelloNode()</code> function:</p>
<pre class="brush:js">
helloNode.name = "helloNode"
</pre>
<p>All nodes have a "name" property, which you can use to identify or find them after they are initialized. Next, override the <code>touchesBegan(touches: NSSet!, withEvent event: UIEvent!)</code> method, and add the following:</p>
<pre class="brush:js">
override func touchesBegan(touches: NSSet!, withEvent event: UIEvent!) {
    var helloNode:SKNode = childNodeWithName("helloNode")
    if helloNode != nil {
        helloNode.name = nil
        
        var moveUp:SKAction = SKAction.moveByX(0, y: 100, duration: 0.5)
        var zoom:SKAction = SKAction.scaleTo(2, duration: 0.25)
        var pause:SKAction = SKAction.waitForDuration(0.5)
        var fadeAway = SKAction.fadeOutWithDuration(0.25)
        var remove = SKAction.removeFromParent()
        var moveSequence = SKAction.sequence([moveUp, zoom, pause, fadeAway, remove])
        helloNode.runAction(moveSequence)
    }
}
</pre>
<p>This method finds a node named "helloNode," then runs a bunch of actions on it. Build and run the project, then click anywhere on the screen to make the method execute. There's a good sampling of what's available in the <code>SKAction</code> class here, but it's always good to check out the <a href="https://developer.apple.com/library/ios/documentation/SpriteKit/Reference/SKAction_Ref/Reference/Reference.html">SKAction class reference</a> just to see what's possible.</p>
<h3>Scene Transitions</h3>
<p>As I mentioned earlier, you'll probably have multiple scenes in your game, and you'll obviously need to switch between them. Fortunately, Sprite Kit allows you to do that quite easily, and add some fancy transition effects at the same time. Create a new scene called <code>SpaceshipScene.swift</code> and give it the following implementation:</p>
<pre class="brush:js">
class SpaceshipScene:SKScene {
    var contentCreated:Bool = false
    
    override func didMoveToView(view: SKView!) {
        if !contentCreated {
            createSceneContents()
            contentCreated = true
        }
    }
    
    func createSceneContents() {
        backgroundColor = SKColor.redColor()
        scaleMode = SKSceneScaleMode.AspectFit
    }
}
</pre>
<p>Now, go back to <code>HelloScene.swift</code>, comment out the code inside of <code>touchesBegan(touches: NSSet!, withEvent event: UIEvent!)</code>, and replace it with the following:</p>
<pre class="brush:js">
var spaceshipScene:SKScene = SpaceshipScene(size: self.size)
var transition:SKTransition = SKTransition.doorsOpenVerticalWithDuration(0.5)
view.presentScene(spaceshipScene, transition: transition)
</pre>
<p>Build and run the project. You should see text on a blue background again. Click anywhere, and <code>HelloScene</code> will transition to <code>SpaceshipScene</code> with a cool "doors" effect. Again, check out the <a href="https://developer.apple.com/library/ios/documentation/SpriteKit/Reference/SKTransition_Ref/Introduction/Introduction.html">SKTransition class reference</a> for a list of all the effects you can use.</p>
<h3>Adding more content</h3>
<p>Next we're going to add an object to <code>SpaceshipScene</code> that's comprised of multiple Sprite Kit "nodes." Add the following code to the <code>createSceneContents</code> method in <code>SpaceshipScene</code>:</p>
<pre class="brush:js">
var spaceship:SKSpriteNode = newSpaceship()
spaceship.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) - 150)
addChild(spaceship)
</pre>
<p>Next, implement the <code>newSpaceship()</code> method:</p>
<pre class="brush:js">
func newSpaceship() -> SKSpriteNode {
    var hull = SKSpriteNode(color: SKColor.grayColor(), size: CGSizeMake(64, 32))
    var hover:SKAction = SKAction.sequence([
            SKAction.waitForDuration(1),
            SKAction.moveByX(100, y: 50, duration: 1),
            SKAction.waitForDuration(1),
            SKAction.moveByX(-100, y: -50, duration: 1)
        ])
    hull.runAction(SKAction.repeatActionForever(hover))
    return hull
}
</pre>
<p>Build and run the project to see a gray box moving back and forth indefinitely. Next let's add "lights" to the spaceship. Insert the following right after declaring the <code>hull</code> variable in the <code>newSpaceship</code> method:</p>
<pre class="brush:js">
var light1:SKSpriteNode = newLight()
light1.position = CGPointMake(-28, 6)
hull.addChild(light1)

var light2:SKSpriteNode = newLight()
light2.position = CGPointMake(28, 6)
hull.addChild(light2)
</pre>
<p>Then implement the <code>newLight()</code> method:</p>
<pre class="brush:js">
func newLight() -> SKSpriteNode {
    var light:SKSpriteNode = SKSpriteNode(color: SKColor.yellowColor(), size: CGSizeMake(8, 8))
    var blink:SKAction = SKAction.sequence([
            SKAction.fadeOutWithDuration(0.25),
            SKAction.fadeInWithDuration(0.25)
        ])
    light.runAction(SKAction.repeatActionForever(blink))
    return light
}
</pre>
<p>Build and run the project. You should now see two blinking lights on the "spaceship."</p>
<h3>Physics</h3>
<p>To wrap up, we'll add some physics interactions to <code>SpaceshipScene</code>. I'll leave the reasons why you might want a realistic physics simulation in your game as an exercise to the reader (*cough*Angry Birds*cough*). First of all, change the <code>newSpaceship()</code> method slightly to add a physics body to the ship hull:</p>
<pre class="brush:js">
hull.physicsBody = SKPhysicsBody(rectangleOfSize: hull.size)
hull.physicsBody.dynamic = false
</pre>
<p>We set <code>dynamic = false</code> so the ship isn't affected by the physics system's gravity. Otherwise it would fall off the screen, since there's no floor in the game to stop it. Next add some code in <code>createSceneContents()</code> to generate rocks that will bounce off the ship.</p>
<pre class="brush:js">
var makeRocks:SKAction = SKAction.sequence([
        SKAction.runBlock(addRock),
        SKAction.waitForDuration(0.1, withRange: 0.15)
    ])
runAction(SKAction.repeatActionForever(makeRocks))
</pre>
<p>And implement <code>addRock()</code>:</p>
<pre class="brush:js">
func addRock() {
    var rock:SKSpriteNode = SKSpriteNode(color: SKColor.brownColor(), size: CGSizeMake(8, 8))
    rock.position = CGPointMake(self.size.width / 2, self.size.height - 50)
    rock.name = "rock"
    rock.physicsBody = SKPhysicsBody(rectangleOfSize: rock.size)
    rock.physicsBody.usesPreciseCollisionDetection = true
    addChild(rock)
}
</pre>
<p>Build and run the project and you'll see a bunch of rocks being generated and bouncing off the spaceship. While Apple's tutorial has you manually removing rocks that fall off the screen, apparently some changes to the Sprite Kit API now do that for you automatically (you'll notice the "node" count stays constant while the app is running).</p>
<p>And that's it! A very basic overview to both Sprite Kit and Swift. Try playing around with the project and see what else you can come up with. Happy hacking!</p>
