package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.animation.FlxBaseAnimation;
import flixel.graphics.frames.FlxAtlasFrames;

using StringTools;

class Character extends FlxSprite
{
	public var animOffsets:Map<String, Array<Dynamic>>;
	public var debugMode:Bool = false;

	public var isPlayer:Bool = false;
	public var curCharacter:String = 'bf';
	public var holdTimer:Float = 0;
	public var iconColor:String = "FF82d4f5";

	public function new(x:Float, y:Float, ?character:String = "bf", ?isPlayer:Bool = false)
	{
		super(x, y);

		animOffsets = new Map<String, Array<Dynamic>>();
		curCharacter = character;
		this.isPlayer = isPlayer;

		var tex:FlxAtlasFrames;
		antialiasing = false;

		switch (curCharacter)
		{
                        case 'gf-minecraft':
				iconColor = 'FFB03060';
				tex = Paths.getSparrowAtlas('characters/gf-minecraft');
				frames = tex;
				animation.addByIndices('danceLeft', 'gf-minecraft GF dance', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 30, false);
				animation.addByIndices('danceRight', 'gf-minecraft GF dance', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30], "", 30, false);

				addOffset('danceLeft', 0);
				addOffset('danceRight', 0);

				setGraphicSize(Std.int(width * 0.92));
				updateHitbox();
				antialiasing = false;

				playAnim('danceRight');

			case 'gf-christmas':
				iconColor = 'FFB03060';
				tex = Paths.getSparrowAtlas('characters/gfChristmas');
				frames = tex;
				animation.addByPrefix('cheer', 'GF Cheer', 24, false);
				animation.addByPrefix('singLEFT', 'GF left note', 24, false);
				animation.addByPrefix('singRIGHT', 'GF Right Note', 24, false);
				animation.addByPrefix('singUP', 'GF Up Note', 24, false);
				animation.addByPrefix('singDOWN', 'GF Down Note', 24, false);
				animation.addByIndices('sad', 'gf sad', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
				animation.addByIndices('hairBlow', "GF Dancing Beat Hair blowing", [0, 1, 2, 3], "", 24);
				animation.addByIndices('hairFall', "GF Dancing Beat Hair Landing", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], "", 24, false);
				animation.addByPrefix('scared', 'GF FEAR', 24);

				addOffset('cheer');
				addOffset('sad', -2, -2);
				addOffset('danceLeft', 0, -9);
				addOffset('danceRight', 0, -9);

				addOffset("singUP", 0, 4);
				addOffset("singRIGHT", 0, -20);
				addOffset("singLEFT", 0, -19);
				addOffset("singDOWN", 0, -20);
				addOffset('hairBlow', 45, -8);
				addOffset('hairFall', 0, -9);

				addOffset('scared', -2, -17);

				playAnim('danceRight');

			case 'bf':
				var tex = Paths.getSparrowAtlas('characters/BOYFRIEND');
				frames = tex;
				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
				animation.addByPrefix('hey', 'BF HEY', 24, false);

				animation.addByPrefix('pre-attack', 'bf pre attack', 24, false);
				animation.addByPrefix('attack', 'boyfriend attack', 24, false);

				animation.addByPrefix('firstDeath', "BF dies", 24, false);
				animation.addByPrefix('deathLoop', "BF Dead Loop", 24, true);
				animation.addByPrefix('deathConfirm', "BF Dead confirm", 24, false);

				animation.addByPrefix('scared', 'BF idle shaking', 24);

				addOffset('idle', -5);
				addOffset("singUP", -29, 27);
				addOffset("singRIGHT", -38, -7);
				addOffset("singLEFT", 12, -6);
				addOffset("singDOWN", -10, -50);
				addOffset("singUPmiss", -29, 27);
				addOffset("singRIGHTmiss", -30, 21);
				addOffset("singLEFTmiss", 12, 24);
				addOffset("singDOWNmiss", -11, -19);
				addOffset("hey", 7, 4);
				addOffset("pre-attack", 0, -32);
				addOffset("attack", 177, 275);
				addOffset('firstDeath', 37, 11);
				addOffset('deathLoop', 37, 5);
				addOffset('deathConfirm', 37, 69);
				addOffset('scared', -4);

				playAnim('idle');

				flipX = true;

			case 'bf-minecraft':
				frames = Paths.getSparrowAtlas('characters/bf-minecraft');
				animation.addByPrefix('idle', 'bf-minecraft idle', 24, false);
				animation.addByPrefix('singUP', 'bf-minecraft up note', 24, false);
				animation.addByPrefix('singRIGHT', 'bf-minecraft left note', 24, false);
				animation.addByPrefix('singLEFT', 'bf-minecraft right note', 24, false);
				animation.addByPrefix('singDOWN', 'bf-minecraft down note', 24, false);
				animation.addByPrefix('singUPmiss', 'bf-minecraft up miss', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'bf-minecraft left miss', 24, false);
				animation.addByPrefix('singLEFTmiss', 'bf-minecraft right miss', 24, false);
				animation.addByPrefix('singDOWNmiss', 'bf-minecraft down miss', 24, false);

				addOffset('idle');
				addOffset("singUP");
				addOffset("singRIGHT");
				addOffset("singLEFT");
				addOffset("singDOWN");
				addOffset("singUPmiss");
				addOffset("singRIGHTmiss");
				addOffset("singLEFTmiss");
				addOffset("singDOWNmiss");

				setGraphicSize(Std.int(width * 0.9));
				updateHitbox();

				playAnim('idle');

				width -= 100;
				height -= 100;

				antialiasing = false;

				flipX = true;

			case 'jellymid':
				iconColor = 'FF582B68';
				frames = Paths.getSparrowAtlas('characters/jellymid');
				animation.addByPrefix('idle', 'jellymid idle', 24, false);
				animation.addByPrefix('singUP', 'jellymid up', 24, false);
				animation.addByPrefix('singLEFT', 'jellymid left', 24, false);
				animation.addByPrefix('singRIGHT', 'jellymid right', 24, false);
				animation.addByPrefix('singDOWN', 'jellymid down', 24, false);

				addOffset('idle', -250, -260);
				addOffset("singUP", -232, -258);
				addOffset("singRIGHT", -243, -257);
				addOffset("singLEFT", -243, -258);
				addOffset("singDOWN", -246, -256);

				playAnim('idle');

				setGraphicSize(Std.int(width * 0.85));
				updateHitbox();

				antialiasing = false;

			case 'jellybean':
				iconColor = 'FF582B68';
				frames = Paths.getSparrowAtlas('characters/jellybean');
				animation.addByPrefix('idle', 'jellybean idle', 24, false);
				animation.addByPrefix('singUP', 'jellybean up note', 24, false);
				animation.addByPrefix('singRIGHT', 'jellybean left note', 24, false);
				animation.addByPrefix('singLEFT', 'jellybean right note', 24, false);
				animation.addByPrefix('singDOWN', 'jellybean down note', 24, false);
				animation.addByPrefix('singUPmiss', 'jellybean up miss', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'jellybean left miss', 24, false);
				animation.addByPrefix('singLEFTmiss', 'jellybean right miss', 24, false);
				animation.addByPrefix('singDOWNmiss', 'jellybean down miss', 24, false);

				addOffset('idle');
				addOffset("singUP");
				addOffset("singRIGHT");
				addOffset("singLEFT");
				addOffset("singDOWN");
				addOffset("singUPmiss");
				addOffset("singRIGHTmiss");
				addOffset("singLEFTmiss");
				addOffset("singDOWNmiss");

				playAnim('idle');

				setGraphicSize(Std.int(width * 0.8));
				updateHitbox();

				antialiasing = false;

				flipX = true;

			case 'jelly-death':
				frames = Paths.getSparrowAtlas('jellyleandeath/jelly-death');

				animation.addByPrefix('firstDeath', "jelly-death ouch", 24, false);
				animation.addByPrefix('deathLoop', "jelly-death waaa", 24, true);
				animation.addByPrefix('deathConfirm', "jelly-death waaa", 24, false);

				addOffset('firstDeath', 47, 11);
				addOffset('deathLoop', 47, 11);
				addOffset('deathConfirm', 47, 11);
				playAnim('firstDeath');

				setGraphicSize(Std.int(width * 0.8));
				updateHitbox();

				antialiasing = false;

			case 'skeleton':
				iconColor = 'FFA26060';
				frames = Paths.getSparrowAtlas('characters/skeleton');
				animation.addByPrefix('idle', 'skeleton idle', 24, false);
				animation.addByPrefix('singUP', 'skeleton up', 24, false);
				animation.addByPrefix('singLEFT', 'skeleton left', 24, false);
				animation.addByPrefix('singRIGHT', 'skeleton right', 24, false);
				animation.addByPrefix('singDOWN', 'skeleton down', 24, false);
				animation.addByPrefix('watchThis', 'skeleton watch this', 24, false);

				addOffset('idle', -250, -260);
				addOffset("singUP", -254, -268);
				addOffset("singRIGHT", -252, -257);
				addOffset("singLEFT", -243, -258);
				addOffset("singDOWN", -244, -270);
				addOffset("watchThis", -250, -260);

				playAnim('idle');

				setGraphicSize(Std.int(width * 0.9));
				updateHitbox();

				antialiasing = false;

			case 'skeletonguitar':
				iconColor = 'FFA26060';
				frames = Paths.getSparrowAtlas('characters/guitar skeleton');
				animation.addByPrefix('idle', 'guitar skeleton idle', 24, false);
				animation.addByPrefix('singUP', 'guitar skeleton up', 24, false);
				animation.addByPrefix('singLEFT', 'guitar skeleton left', 24, false);
				animation.addByPrefix('singRIGHT', 'guitar skeleton right', 24, false);
				animation.addByPrefix('singDOWN', 'guitar skeleton down', 24, false);
				animation.addByPrefix('whatIsIt', 'guitar skeleton what is it', 24, false);

				addOffset('idle', -250, -260);
				addOffset("singUP", -254, -268);
				addOffset("singRIGHT", -252, -257);
				addOffset("singLEFT", -243, -258);
				addOffset("singDOWN", -244, -270);
				addOffset("whatIsIt", -250, -260);

				playAnim('idle');

				setGraphicSize(Std.int(width * 0.9));
				updateHitbox();

				antialiasing = false;

			case 'minecraftDEATH': // tragically and sadly:((
				frames = Paths.getSparrowAtlas('death/minecraftDEATH');
				animation.addByPrefix('firstDeath', "minecraftDEATH death", 24, false);
				animation.addByPrefix('deathLoop', "minecraftDEATH despawn", 24, true);
				animation.addByPrefix('deathConfirm', "minecraftDEATH despawn", 24, false);

				addOffset('firstDeath', 47, 11);
				addOffset('deathLoop', -500, -129);
				addOffset('deathConfirm', -500, -129);
				playAnim('firstDeath');
				setGraphicSize(Std.int(width * 5));
				updateHitbox();

				antialiasing = false;

				flipX = true;
		}

		dance();

		if (isPlayer)
		{
			flipX = !flipX;

			// Doesn't flip for BF, since his are already in the right place???
			if (!curCharacter.startsWith('bf'))
			{
				// var animArray
				var oldRight = animation.getByName('singRIGHT').frames;
				animation.getByName('singRIGHT').frames = animation.getByName('singLEFT').frames;
				animation.getByName('singLEFT').frames = oldRight;

				// IF THEY HAVE MISS ANIMATIONS??
				if (animation.getByName('singRIGHTmiss') != null)
				{
					var oldMiss = animation.getByName('singRIGHTmiss').frames;
					animation.getByName('singRIGHTmiss').frames = animation.getByName('singLEFTmiss').frames;
					animation.getByName('singLEFTmiss').frames = oldMiss;
				}
			}
		}
	}

	override function update(elapsed:Float)
	{
		if (!curCharacter.startsWith('bf'))
		{
			if (animation.curAnim.name.startsWith('sing'))
			{
				holdTimer += elapsed;
			}

			var dadVar:Float = 4;

			if (curCharacter == 'dad')
				dadVar = 6.1;
			if (holdTimer >= Conductor.stepCrochet * dadVar * 0.001)
			{
				dance();
				holdTimer = 0;
			}
		}

		switch (curCharacter)
		{
			case 'gf':
				if (animation.curAnim.name == 'hairFall' && animation.curAnim.finished)
					playAnim('danceRight');
		}

		super.update(elapsed);
	}

	private var danced:Bool = false;

	/**
	 * FOR GF DANCING SHIT
	 */
	public function dance()
	{
		if (!debugMode)
		{
			switch (curCharacter)
			{
				case 'gf':
					if (!animation.curAnim.name.startsWith('hair'))
					{
						danced = !danced;

						if (danced)
							playAnim('danceRight');
						else
							playAnim('danceLeft');
					}

				case 'gf-christmas':
					if (!animation.curAnim.name.startsWith('hair'))
					{
						danced = !danced;

						if (danced)
							playAnim('danceRight');
						else
							playAnim('danceLeft');
					}

				case 'gf-car':
					if (!animation.curAnim.name.startsWith('hair'))
					{
						danced = !danced;

						if (danced)
							playAnim('danceRight');
						else
							playAnim('danceLeft');
					}
				case 'gf-minecraft':
					if (!animation.curAnim.name.startsWith('hair'))
					{
						danced = !danced;

						if (danced)
							playAnim('danceRight');
						else
							playAnim('danceLeft');
					}
				case 'gf-pixel':
					if (!animation.curAnim.name.startsWith('hair'))
					{
						danced = !danced;

						if (danced)
							playAnim('danceRight');
						else
							playAnim('danceLeft');
					}

				case 'sheeb':
					danced = !danced;

					if (danced)
						playAnim('danceRight');
					else
						playAnim('danceLeft');
				default:
					playAnim('idle');
			}
		}
	}

	public function playAnim(AnimName:String, Force:Bool = false, Reversed:Bool = false, Frame:Int = 0):Void
	{
		animation.play(AnimName, Force, Reversed, Frame);

		var daOffset = animOffsets.get(AnimName);
		if (animOffsets.exists(AnimName))
		{
			offset.set(daOffset[0], daOffset[1]);
		}
		else
			offset.set(0, 0);

		if (curCharacter == 'gf')
		{
			if (AnimName == 'singLEFT')
			{
				danced = true;
			}
			else if (AnimName == 'singRIGHT')
			{
				danced = false;
			}

			if (AnimName == 'singUP' || AnimName == 'singDOWN')
			{
				danced = !danced;
			}
		}
	}

	public function addOffset(name:String, x:Float = 0, y:Float = 0)
	{
		animOffsets[name] = [x, y];
	}
}
