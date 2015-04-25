---
layout: post
status: publish
published: true
title: Unity Tutorial - Alien Attack (Part One)
author:
  display_name: nathan
  login: nathan
  email: ndemick@gmail.com
  url: ''
author_login: nathan
author_email: ndemick@gmail.com
wordpress_id: 454
wordpress_url: http://ganbarugames.com/?p=454
date: '2012-02-27 06:36:29 -0500'
date_gmt: '2012-02-27 11:36:29 -0500'
categories:
- Tutorial
tags:
- tutorial
- unity3d
- unity
comments:
- id: 95
  author: Elundrus
  author_email: servantofchrist425@yahoo.com
  author_url: ''
  date: '2012-04-11 00:25:00 -0400'
  date_gmt: '2012-04-11 04:25:00 -0400'
  content: Thanks for the tutorial.My name is Elundrus and I have a question and wonder
    if you can help.I'm trying to build a project in unity also using the gui texture
    just like you imported it from photoshop to create the title of your game.I'm
    also using imported gui textures from photoshop to build a project.The type of
    game that i'm trying to build is a questions and answers text type game using
    the gui texture that i imported from photoshop.My question is can you help me
    to get the textures to function together in javascript as questions and answers?One
    gui texture as a question and three other gui texture as the answers but only
    one of the answers to be correct.I'm new to scripting. 
- id: 96
  author: Nathan
  author_email: ndemick@gmail.com
  author_url: http://ganbarugames.com
  date: '2012-04-12 13:26:00 -0400'
  date_gmt: '2012-04-12 17:26:00 -0400'
  content: |-
    Hey Elundrus, I'm by no means an expert, so I can't offer you any concrete advice. You might try adding a script that uses raycasts to determine collisions. This reference might be helpful: http://bit.ly/IZrfig

    You could also try posting on Unity Answers (http://answers.unity3d.com/); it's a StackOverflow-esqe site dedicated to Unity.
---
<p>Finally, after a lot of procrastinating, here's the first part of the introduction to <a href="http://www.unity3d.com" title="Unity">Unity</a> that <a href="http://ganbarugames.com/2011/11/unity-challenge/" title="Unity Challenge">I promised so long ago</a>. Unity is both a game engine and level editor, and is primarily visual in nature. You'll create entities (known as "GameObjects") in your game, then tell them how to act by attaching "components" to them. For example, a "RigidBody" component makes a GameObject use Unity's physics engine, and an "AudioSource" component allows a GameObject to emit sounds. While Unity's built-in components are powerful, you'll have to create your own components (via scripting) to truly make your own game. However, the total amount of actual programming needed to get objects to interact the way you want is minimal compared with creating a game exclusively with code.</p>
<p>In Unity, the terms "scene" and "level" can probably be used interchangeably. A Unity project can contain multiple scenes, and these scenes can be swapped in and out as your game progresses. For example, when a game is launched, the player might be presented with a title scene containing UI, allowing them to select a gameplay scene. When the player chooses, that scene is loaded up and then the player can start interacting with the game. The game that we'll make for this tutorial will have two scenes, a title scene and a game scene. Pretty basic, but it'll introduce the concept of switching between scenes.</p>
<p>First, we'll create the title scene. Bust open Unity and create a new project. This project will be based off another game where aliens are trying to "invade" from "space." Let's call it "Alien Attack." So, when you create a new project, there'll be a <a href="http://ganbarugames.com/wp-content/uploads/2012/02/unity-tutorial-1-1.png">default scene</a> already there for you. Hit Control/Command + S to save it, and name it "Title." All this scene will do is show a title graphic with a button to start playing. Fire up Photoshop (or Pixelmator or Acorn) and create a <a href="http://ganbarugames.com/wp-content/uploads/2012/02/unity-tutorial-1-2.png">logo for the game</a>. Now, since I'm using Photoshop, I'll just save the image as a PSD right to my desktop, and name it "title-logo.psd". Now, create a new folder in the "Project" widget in your Unity window and name it "Images." Drag the PSD from the desktop to that folder, and BAM! You've successfully <a href="http://ganbarugames.com/wp-content/uploads/2012/02/unity-tutorial-1-3.png">imported it into your game</a>. If you navigate to the main project directory in your filesystem, you can browse through all the assets you've added to the project, and edit them directly there.</p>
<p><a href="http://ganbarugames.com/wp-content/uploads/2012/02/unity-tutorial-1-4.png"><img src="http://ganbarugames.com/wp-content/uploads/2012/02/unity-tutorial-1-4-300x200.png" alt="" title="Logo in Scene" width="300" height="200" class="alignright size-medium wp-image-507" /></a>Now we can start adding stuff to the title scene. Click the GameObject menu at the top of the Unity window, and select Create Other > GUI Texture. This will create a default Unity watermark. Looks kinda cool, so let's leave it in there to show that this game was made with Unity! Select the "UnityWatermark-small" object in the Hierarchy view and edit the Transform component using the Inspector until the logo is positioned appropriately in one of the corners of the screen. Now let's add the game logo we just created. Click the GameObject menu again, and make another GUI Texture. Rename this texture "Logo", and select it in the Hierarchy. You'll see in the Inspector, below the Transform component, there's a GUITexture component. Drag the logo PSD you created from the Project widget into the "Texture" property of the GUITexture. Presto, now your logo is displayed! Adjust the Transform component's Position and Scale properties until the logo looks good. If you want to, you can also change the background color of the title scene by editing the Main Camera object in the Hierarchy. Select the camera, then click the color box in the Camera component in the Inspector. I changed my background to black, but you can use whatever color you want.</p>
<p>Now, in order to make a clickable button that will take us to the game scene, we'll have to create our own "Script" component and attach it to an object in the title scene. The script will display a button and load the game scene when clicked. In the Project window, there's a little "Create" button at the top. Click Create > Javascript to create a new Javascript script. Supposedly C# is the most powerful choice for scripting in Unity, but all the official Unity scripting documentation is in Javascript, so that's what we're going to go with in this tutorial. Name your new script "title" to show that it's in charge of showing the user interface in the title scene. You should probably also create a new "Scripts" folder in the Project window, to help organize all the scripts that will eventually be created. Drag the "title" script into the new folder, then double click the script to open it up in MonoDevelop, the script editor that ships with Unity. You can use any editor you want, actually, but we'll use MonoDevelop for now. You should see that the script comes pre-populated with some functions named <code>Awake</code> and <code>Update</code>; those will come into use later for other scripts we'll create. For now, just add this code to the script:</p>
<pre class="brush:js">
function OnGUI() {
	var width = Screen.width;
	var height = Screen.height;

	if (GUI.Button(Rect(width / 2 - 50, height - height / 5, 100, 50), "Start!")) {
		Application.LoadLevel("Game");
	}
}
</pre>
<p>This will create a 100x50 button with the text "Start!" on the screen. However, if you try playing the game right now, the button doesn't show up! That's because a script has to be attached to a GameObject in the Hierarchy before it can run. It doesn't matter what object this GUI code is attached to, so we'll attach it to the main camera. Drag the script onto the Main Camera object in the Hierarchy, then try running the game again. <a href="http://ganbarugames.com/wp-content/uploads/2012/02/unity-tutorial-1-5.png">Success!</a> However, if you click the button, you'll get an error, because we haven't created the "Game" scene yet, which we'll do next.</p>
<p>Under the File menu, select "New Scene" to create another scene. Save it and name this one "Game." This'll be the scene that we create our actual game in. One thing to remember is that for every scene you create that you want to be in the final game, you have to add it to the "Scenes in Build" property in the project's "Build Settings." Go to File > Build Settings and drag both the Game and Title scenes into the <a href="http://ganbarugames.com/wp-content/uploads/2012/02/unity-tutorial-1-6.png">Scenes in Build window</a>.</p>
<p>Next, let's set up the camera in the newly-created Game scene. Although the game that we'll create uses 3D objects, we'll constrain movement to be along only two axes. This means that we can position the camera to create a cool effect where enemies at the top of the screen are able to be seen from a lower angle. Move the main camera to (0, 70, -6) and set the rotation to be (60, 0, 0). This will make the player (positioned at the origin) appear to be at the bottom center of the screen. Alternately you could make the camera point straight down and make the projection "orthographic" to remove all perspective from the game objects, which would better simulate a 2D game.</p>
<p>One thing we might want to change is the fact that there's no light source in this new scene, so any objects we create will be pretty dark. In the Hierarchy, click Create > Directional Light. Select the new light, and set its' position to be (0, 20, 0) and rotation to be (90, 0, 0). This will create a light pointing straight down that will illuminate the tops of all the game objects we create.</p>
<p>Next, let's create the player and enemy game entities. I thought it would be cool to do 3D pixel art, in an attempt to go beyond the standard cubes and spheres most tutorials provide. Also, since the player and enemies will be made up of a bunch of GameObjects, I'm going to attempt to create a cool effect where the entity breaks apart when it dies, by assigning physics components to each "pixel."</p>
<p>In the Scene view, click the y-axis in order to get a top-down view. We'll follow Unity conventions where a "top view" means the x-axis is left/right and the z-axis is up/down. Or, alternately you can set up your camera to view the X/Y axes. It really doesn't matter as far as I know.</p>
<p><a href="http://ganbarugames.com/wp-content/uploads/2012/02/unity-tutorial-1-7.png"><img src="http://ganbarugames.com/wp-content/uploads/2012/02/unity-tutorial-1-7-300x200.png" alt="" title="Enemy Material" width="300" height="200" class="alignleft size-medium wp-image-510" /></a>First, create a cube in the Hierarchy window. We'll use this cube as a "pixel" to create an enemy object. Set its' position to (0, 0, 0) by using the Inspector. This cube will be the center of the object, so we'll build around it. Next step is to give the cube a better color than the default grey. To do that, create a new material in the Project window, and name it "Alien." Click the Main Color color box in the Inspector, and choose a bright color. Drag this material onto the Cube object you created in the Hierarchy, and BAM!, the cube turns green! The great thing about this is that you can make a change to the Alien material, and all the objects that use the material will be updated automatically.</p>
<p>Now select the cube in the Scene window using the Translation tool, and hit Command-D (or Control-D) on your keyboard. This will duplicate the object. However, it's still occupying the same space as the original, so drag it to one side using the translation arrows. Hold down Command (or Control) as you drag so that the object snaps to the unit grid. This means that you can easily place the duplicate cube 1 "meter" away from the original, without having to manually change the coordinates. Continue to <a href="http://ganbarugames.com/wp-content/uploads/2012/02/unity-tutorial-1-9.png">duplicate and move cubes</a> away from the center cube until you're happy with what the alien looks like.</p>
<p>Next, we'll "parent" all those cubes into a generic GameObject. That means we can move the GameObject and all the "children" will move with it. Click the "GameObject" menu, then select "Create Empty." This will put a new GameObject in the scene Hierarchy. Place the empty object at the origin (0, 0, 0) using the Inspector. Using the Hierarchy window, select all the cubes you created and drag them into the GameObject. You'll see that a small arrow gets created to the left of the GameObject entity, and all the cubes are now indented, to show that they are "children" of the GameObject. You can show/hide them by clicking the arrow next to the parent. Now you can rename the GameObject to something more descriptive, like "Alien." </p>
<p>To deal with collisions, we don't want to have to check for a collision against every cube that makes up the alien. Instead, we'll create a Box Collider component and attach it to the parent GameObject. That way collisions can be checked against one big collider, instead of lots of little ones. Select the Alien object in the Hierarchy pane and click the "Component" window menu. Select Physics > Box Collider to add a Box Collider component to the Alien. You'll see that by default, the collider is a 1x1x1 cube. You can adjust the center and size of the collider until it fits around the whole object (I made mine 11x1x7). Also, make sure that the "Is Trigger" option is checked, which means the collider will only be used to detect collisions, not for physics.</p>
<p>We'll add some basic sound effects to our Alien. Make sure the Alien object is selected in the Hierarchy, then click the "Component" window menu. Select Audio > Audio Source to add an audio player component. This gives a GameObject the ability to emit sound effects via a script. Now, the player won't hear anything unless there's an Audio Listener in the scene, but fortunately the main camera has an Audio Listener component by default, so you don't need to worry about it. Bust open <a href="http://www.drpetter.se/project_sfxr.html" title="sfxr">sfxr</a> or <a href="http://thirdcog.eu/apps/cfxr" title="cfxr">cfxr</a> and create an "explosion" sound effect that you like, save it to your desktop, then drag it into the Project window to add it to the project (you can create an "audio" folder for organizational purposes if you like). Now highlight the Alien object again, and drag the sound file into the "Audio Clip" area of the Audio Source component in the Inspector. We'll play this sound effect via a script that will be attached to the Alien object later.</p>
<p>The last thing we'll do is assign a tag to the Alien. This lets us easily determine the type of object it is when it interacts with other GameObjects. For example, if your player object hits another object, you can test and see whether or not that other object is tagged as an enemy. If so, then your script can take the appropriate action. Again, make sure the Alien is selected in the Hierarchy, then look at the very top of the Inspector. There you'll see a "Tag" property, which you can select from a drop-down menu. Click the menu, then choose "Add Tag" to create your own custom tag. Modify the "Size" property of the <a href="http://ganbarugames.com/wp-content/uploads/2012/02/unity-tutorial-1-10.png">list that shows up</a>, and create a new "Enemy" tag. Now you can go back and assign that tag to the Alien object.</p>
<p><a href="http://ganbarugames.com/wp-content/uploads/2012/02/unity-tutorial-1-11.png"><img src="http://ganbarugames.com/wp-content/uploads/2012/02/unity-tutorial-1-11-300x200.png" alt="" title="unity-tutorial-1-11" width="300" height="200" class="alignleft size-medium wp-image-513" /></a>Finally, we're ready to actually create a "prefab" based on the complex GameObject we just put together. Prefabs are saved GameObjects that you can easily add to your game, either dynamically while the game is running or just by dragging the prefab object into the Scene. The advantage of using prefabs is that you don't have to manually set up each new enemy object, you can just create one archetype and duplicate it a bunch of times. In the Project window, click the "Create" button and create a new prefab and name it "Alien." Drag the Alien object you created from the Hierarchy over on to that prefab icon, and you'll see the object name in the Hierarchy turn blue. You can make sure everything worked correctly by now dragging the prefab back into the Scene view; you should see another copy of the alien appear.</p>
<p>Now, repeat the steps we used to make the alien, except this time <a href="http://ganbarugames.com/wp-content/uploads/2012/02/unity-tutorial-1-13.png">create the player's ship</a>. Remember to parent all the cubes into a new GameObject, add a Box Collider, an Audio Source (with a "shooting" sound effect), and tag the ship as "Player" before making it into a prefab.</p>
<p>You now have the two objects that will be used in the game. How about getting them to do something? Here's where we'll create more Script components to use with our game objects. Create a new Javascript script component and name it "player." Double-click it to open it using the default Unity code editor, MonoDevelop. Here's the Javascript code that will go inside:</p>
<pre class="brush:js">
// player.js
// #pragma strict enforces static typing in Unity Javascript
#pragma strict

// This public variable can be easily changed later in the Inspector
var moveSpeed:float = 5.0;

function Update () {
	// Get input from WASD or arrow keys (values from 0.0 - 1.0) and modify it by the "moveSpeed" variable
	// Also make framerate independent by multiplying by Time.deltaTime
	var x = Input.GetAxis("Horizontal") * moveSpeed * Time.deltaTime;
	var z = Input.GetAxis("Vertical") * moveSpeed * Time.deltaTime;
	
	// Modify the "transform" component of the GameObject this script is attached to
	// Translate (move) it along the X and Z axes. 
	// Y will always be zero because we only want to move in two dimensions
	transform.Translate(x, 0, z);
}
</pre>
<p>Save the script, then drag it on to the "Ship" prefab that you created. You should see the script component added in the Inspector when you select the Ship. Create a new instance of the prefab by dragging it into the Hierarchy, then set the position of that instance to (0, 0, 0). Now if you click the Play button at the top of the Unity screen, you should be able to move the Ship object around by using the WASD or arrow keys. The default movement speed in the script is pretty slow, so feel free to change the <code>moveSpeed</code> value either in the script or by using the Inspector.</p>
<p>Aaaand, break! Right now we've got a solid base for our game, having created complete player and enemy objects. The next installment will cover scripting a bit more in depth, so that we can actually shoot enemies. Let me know if anything was unclear, and I'll do my best to help out. Also, feel free to <a href='http://ganbarugames.com/wp-content/uploads/2012/02/AlienAttack-1.zip'>download the project file</a> to get started.</p>
