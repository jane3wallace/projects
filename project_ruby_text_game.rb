# Text-based game as SI Ramp Up final project
# Game objective is to escape to your ship


class Engine

  def initialize(scene_map)
    @scene_map = scene_map
  end

  def play()
    current_scene = @scene_map.opening_scene()
    last_scene = @scene_map.next_scene('triumph')

    while current_scene != last_scene
      next_scene_name = current_scene.enter()
      current_scene = @scene_map.next_scene(next_scene_name)
    end

    current_scene.enter()
  end
end


class Scene
  def enter()
    exit(1)
  end
end


class Death < Scene

  @@quips = [
  	"\nYou fell victim to one of the classic blunders. The most famous is\n"\
    "\"Never get involved in a land war in Asia.\"",

    "\nThe good news is that you are only \'mostly\' dead. The bad news\n"\
    "is that Miracle Max is on vacation in Guilder.",

    "\nSo you've been training your whole life only to fail now? I think that\'s\n"\
    "the worst thing I ever heard. How marvelous.",

    "\nGood heavens. Are you still trying to win?"
    ]

  def enter()
    puts @@quips[rand(0..(@@quips.length - 1))]
    exit(1)
  end
end


class PitOfDespair < Scene

  def enter()
    puts "\nYou are the Dread Pirate Roberts. Presently, you\'re trapped in the\n"\
    "terrifying Pit of Despair. Dank and chill, underground and windowless,\n"\
    "lit only by flickering torches. After waiting for the Albino caretaker to\n"\
    "leave, you were able to pick the lock on the chains that were binding you.\n"\
    "Now you must escape from this torture chamber and find your way back to safety\n"\
    "aboard your frigate, the \"Revenge\" which is anchored at the bay."
    puts "\n"
    puts "You meander through the maze-like corridors, taking care to stay in the\n"\
    "shadows. Suddenly, you come upon a door with words carved above it. To the right\n"\
    "of the door are movable tiles, with a single letter on each tile. The carving\n"\
    "above the door reads: Give me food, and I will live; Give me water, and I will die.\n"\
    "A riddle. The solution to the riddle must be a password to open the door! Now all\n"\
    "you have to do is spell the answer with the tiles. But what\'s the answer?\n"\
    "Do you hear footsteps? Better hurry. Sounds like there is only time for three tries."
    print "\npassword> "
    code = "fire"
    guess = $stdin.gets.to_s.downcase.chomp

    guesses = 0

    while guess != code && guesses < 2
      puts "Nothing happened!"
      guesses += 1
      print "\npassword> "
      guess = $stdin.gets.to_s.downcase.chomp
    end

    if guess.include? code
        puts "\nThe door swings open revealing bright sunlight. You hurry through\n"\
        "and quickly close the door behind you."
        return 'rodents_of_unusual_size'
    else
        puts "\nYou\'ve run out of time. The six-fingered man is now behind you.\n"\
        "You whirl around quickly and attempt to punch him, but his sword is\n"\
        "already drawn and cuts your hand off. He smiles as he thrusts his sword\n"\
        "into your belly and twists it. You slump to the floor in agony."
        return 'death'
    end
  end
end

class ROUS < Scene

  def enter()
    puts "\nYou find yourself at the edge of the woods. You must now make your\n"\
    "way through the Fire Swamp. You walk gingerly, careful to avoid the sandy\n"\
    "white patches of Lightning Sand that could swallow you whole in seconds.\n"\
    "You hear an odd panting sound above you. Just as you look up, an R.O.U.S.\n"\
    "launches at you from a tree branch, eighty pounds of bone and power. Your mind\n"\
    "races to react, thinking three things at once: 1. Rodents of Unusual Size are REAL!\n"\
    "2. How will I fight this beast without my sword? 3. Wait! I still have my pouches\n"\
    "of powder on me! You have 2 pouches in a hidden pocket in your trousers. One is\n"\
    "a fast-acting lethal poison. The other is a delicious seasoning. In your haste, you\n"\
    "you can\'t remember which is which. Do you try to use the red powder or the white?"
    print "\ncolor> "
    powder = $stdin.gets.to_s.downcase.chomp

    if powder.include? "white"
    	puts "\nYou wrestle the R.O.U.S. up against a tree and pry its jaws open.\n"\
    	"As quickly as you can, you sprinkle the white powder into its mouth. The vile\n"\
    	"creature begins frothing at the lips and keels over. The iocane powder has\n"\
    	"done its job."
    	return 'fire_swamp'
    elsif powder.include? "red"
    	puts "\nAfter flying out of the tree, the vermin pins you to the ground. You manage\n"\
    	"to fend the beast off long enough to retrieve the red powder and blow it into\n"\
    	"its mouth and nose. The rodent stops cold and you feel triumphant. Suddenly, the\n"\
    	"creature sneezes a web of disgusting mucus all over you then lunges, sinking its\n"\
    	"razor sharp teeth into your shoulder. You howl in pain and realize your mistake:\n"\
    	"paprika. Before you can counter, another R.O.U.S. has arrived on the scene, smelling\n"\
    	"blood. The 2 giant rodents knaw away, making short work of you."
    	return 'death'
    else
    	puts "\n%s? Ain\'t nobody got time for that!\n" % powder
    	return 'rodents_of_unusual_size'
    end
  end
end


class FireSwamp < Scene

  def enter()
    puts "\nShaken but determined, you continue through the swamp. You\'ve been\n"\
    "able to master 2 of the 3 terrors of the Fire Swamp, but where\'s the third?\n"\
    "As if in answer, you hear a strange popping sound coming from directly beneath\n"\
    "your feet. You have a sinking feeling that you are about to encounter the final\n"\
    "terror for which this swamp was named. There are thick black-green trees on\n"\
    "either side of you, and it\'s obvious you must react fast. Do you leap forward,\n"\
    "backward or stay where you are?"
    print "\ndirection> "

    action = $stdin.gets.to_s.downcase.chomp

    if action.include? "forward" or action.include? "front"
      puts "\nIn a panic you hop forward, praying you made the right choice. A massive\n"\
      "jet of blue fire shoots out of the very spot where you were standing. You\n"\
      "breath a sigh of relief that you avoided becoming pirate toast. Unfortunately,\n"\
      "the feeling doesn\'t last long. In your haste, you didn\'t look at what you\n"\
      "just jumped onto: a patch of Lightning Sand. Before you can even scream, you\n"\
      "are completely submerged. You suffocate as your nose, mouth, throat and lungs\n"\
      "are coated with powdery white sand."
      return 'death'

    elsif action.include? "back" or action.include? "backward"
      puts "\nWhirling around, you vault to a position that you previously tread,\n"\
      "knowing it to be safe from the Lightning Sand at least. As your heels thud\n"\
      "on the ground, a twenty-foot spurt of blue flames erupts from where you\n"\
      "were just standing. Whew. That was close. You wait for the blaze to subside\n"\
      "then continue forward. You notice a patch of Lightning Sand ahead with\n"\
      "something shiny sticking out of it. As you carefully inch closer, you can see\n"\
      "that it is a hand holding a sword. You feel the wrist for a pulse: none.\n"\
      "No use trying to save the poor soul. You pry the sword out of his hand,\n"\
      "thanking your benefactor for the useful gift."
      return 'the_beach'

    elsif action.include? "stay" or action.include? "don\'t"
      puts "\nYou decide to stay put and see what happens. Within seconds after\n"\
      "the popping noise, you are engulfed in searing blue flames. The pain is\n"\
      "unbearable as you are burned to a crisp."
      return 'death'
    else
      puts "\nHuh? Don\'t think that's a good idea, mate. Try something else."
      return 'fire_swamp'
    end
  end
end


class TheBeach < Scene

  def enter()
    puts "\nYou emerge from the gloom of the Fire Swamp onto a sunny shore thinking,\n"\
    "\"Well, that wasn\'t any worse than any other moist, sulpherous, infernal\n"\
    "horror you might run across.\" Anon, you see the welcome sight of the flapping\n"\
    "black sails of the \"Revenge,\" moored across the shore at the bay. As you\n"\
    "make your way toward the ship, the six-fingered man leaps in front of you,\n"\
    "seemingly out of nowhere. He brandishes his blade and says \"Not so fast!\"\n"\
    "Luckily, you are armed with the sword you found in the Fire Swamp. You draw\n"\
    "your sword. But now you must make a choice: Do you fight the six-fingered man\n"\
    "with the sword in your left hand or your right?"
    print "\nhand> "
    hand = $stdin.gets.to_s.downcase.chomp

    if hand == "right"
    	puts "\nKnowing that you are right-handed, you decide to make this match\n"\
    	"short and sweet. You draw your sword with your right hand and make a\n"\
    	"flourish with your left. The six-fingered man advances, your swords clash\n"\
    	"and the battle has begun. You start thrusting and feinting with a burst\n"\
    	"of energy, in a frenzy to best him quickly. He dodges and blocks all of your\n"\
    	"advances, pacing himself. On the battle goes, back and forth until you\n"\
    	"become weary. Clearly, the six-fingered man knew a shortcut around the Fire\n"\
    	"Swamp. He hasn't even broken a sweat! Sensing your moment of weakness, he\n"\
    	"pushes close. While you are exerting all your might against his sword at your\n"\
    	"neck, he pulls a dagger from his belt and jabs it multiple times into your\n"\
    	"stomach. The immense pain makes you loosen your grip on your sword.\n"\
    	"The six-fingered man seizes his moment and in one deft move, knocks your\n"\
    	"sword from your hand and slashes your carotid artery. You begin to lose\n"\
    	"consciousness, with the last moment of your life the vision of that\n"\
    	"vomitous mass smiling broadly."
    	return 'death'
    elsif hand == "left"
    	puts "\nYou swirl your blade about using your left hand and shout \"En garde!\"\n"\
    	"The two of you start flying across the pebbly terrain, the battle raging with\n"\
    	"incredible finesse. First, you begin gaining advantage, but now the tide has\n"\
    	"turned and the six-fingered man is slashing with such fury that you start to\n"\
    	"falter. As he pushes his blade uncomfortably close to your neck,"\
    	"\n\"You\'re very skilled,\" you say jauntily, struggling to hold him at bay.\n"\
    	"\"Why, thank you. It takes humility to see when you are beaten.\""\
    	"\n\"I admit it -- you are better than I am.\""\
    	"\n\"Then why are you smiling?\" he asked."\
    	"\n\"Because I am not left-handed!\""\
    	"\nWith that, you push him off with effort and then toss your blade into your right\n"\
    	"hand. Immediately, the tide of battle turns and the six-fingered man tries\n"\
    	"every move he can think of to gain an edge, but to no avail. Your bluff has\n"\
    	"worked and drawn the contest out long enough to tire him. You are now in\n"\
    	"control and before he knows it, his sword is knocked clear of his freakish\n"\
    	"hand. He stands helpless a moment, then drops to his knees closing his eyes\n"\
    	"in exhaustion."\
    	"\n\"Will you let me live?\" he pleads."\
    	"\n\"It\'s possible, pig,\" you answer as you thunk him on the head with the\n"\
    	"handle of your blade, knocking him out cold.\n"\
    	"Before his body even hits the ground, you are dashing toward your ship."
    	return 'triumph'
    else
    	puts "\nYou only have two hands, smartypants."
    	return 'the_beach'
    end
  end
end

class Triumph < Scene
  def enter()
    puts "\nYou make it to your ship the \"Revenge\"! The great billowing\n"\
    "black sail catches the wind and you shove off through the eel-infested waters.\n"\
    "(That\'s a good thing!)"
    puts "\n"
    puts "Hooray!!"
  end
end

class Map
  @@scenes = {
    'pit_of_despair' => PitOfDespair.new(),
    'rodents_of_unusual_size' => ROUS.new(),
    'fire_swamp' => FireSwamp.new(),
    'the_beach' => TheBeach.new(),
    'death' => Death.new(),
    'triumph' => Triumph.new(),
  }


  def initialize(start_scene)
    @start_scene = start_scene
  end


  def next_scene(scene_name)
    val = @@scenes[scene_name]
    return val
  end

  def opening_scene()
    return next_scene(@start_scene)
  end
end

a_map = Map.new('pit_of_despair')
a_game = Engine.new(a_map)
a_game.play()