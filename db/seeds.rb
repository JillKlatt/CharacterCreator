# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)





    Race.create({
        "name" => "Human",
        "trait" => "You know what you can do now? Basically just that. Darkvision? Nope. Fun natural languages or speed? Nope. But every party needs one.",
        "jills_opinion" => "So boring. So basic. You can be anything in the world and you chose to be a human? Okay bro."
    })

    Race.create({
        "name" => "Dwarf",
        "trait" => "Dwarves, sometimes called the Stout Folk and Deep Folk, were a natural humanoid race common throughout parts of Toril as well as Abeir. Dwarves were a tough, tradition-abiding folk known for their strong martial traditions and beautiful craftsmanship",
        "jills_opinion" => "Grungy Gnome"
    })

    Race.create({
        "name" => "Elf",
        "trait" => "Elves are a magical people of otherworldly grace, living in places of ethereal beauty, in the midst of ancient forests or in silvery spires glittering with faerie light, where soft music drifts through the air and gentle fragrances waft on the breeze. Elves love nature and magic, art and artistry, music and poetry.
        ",
        "jills_opinion" => "A full ass elf? Live your best life. You'll be living it for a while"
    })   
    
    Race.create({
        "name" => "Gnome",
        "trait" => "In D&D v. 3.5, gnomes are inventors and alchemists who love pranks and excel at engineering. The tinker gnomes of Dragonlance are mechanically skilled, though their devices are quite prone to backfiring.",
        "jills_opinion" => "You are seen, you are ready to have a great ass time. Small, crafty, and amazing. 12/10 (Be warned, your party members will try to pick you up)"
    })    
    
    Race.create({
        "name" => "Half-Elf",
        "trait" => "Half-elves, as their name implies, are the offspring of humans and elves. Half-Elves have curiosity and ambitions like humans but they have sense for magic and love for nature like their elven parents. Their skin is paler than human skin and they are taller and bigger than elves. Half-Elves have long ears like elves.",
        "jills_opinion" => "You might be a people pleaser, but there’s nothing wrong with that. Did you also select Ranger? hm"
    })    
    
    Race.create({
        "name" => "Half-Orc",
        "trait" => "Half-orcs are humanoids born of both human and orc ancestry by a multitude of means. Combining the physical power of their orcish ancestors with the agility of their human ones, half-orcs can be formidable individuals.",
        "jills_opinion" => "The Hannah Montana of curated races. The best of both worlds"
    })    
    
    Race.create({
        "name" => "Halfing",
        "trait" => "Most halflings are lawful good. As a rule, they are good-hearted and kind, hate to see others in pain, and have no tolerance for oppression. They are also very orderly and traditional, leaning heavily on the support of their community and the comfort of their old ways.",
        "jills_opinion" => "Also known as hobbit. Come for me Tolkien"
    })

    Race.create({
        "name" => "Dragonborn",
        "trait" => "Dragonborn have exceptional strength and superior charisma. They have the ability to breathe destructive energy at opponents, an ability known as a breath weapon. Its type depends on the its draconic bloodline, and is commonly a cone or line or acid, cold, fire, poison, or lightning.",
        "jills_opinion" => "Technically not a furry"
    })

    Category.create({
        "name" => "Barbarian",
        "trait" => "Barbarians come alive in the chaos of combat. They can enter a berserk state where rage takes over, giving them superhuman strength and resilience. A barbarian can draw on this reservoir of fury only a few times without resting, but those few rages are usually sufficient to defeat whatever threats arise.",
        "jills_opinion" => "Sometimes we all need to rage"
    })

    Category.create({
        "name" => "Bard",
        "trait" => "The bard class is versatile, capable of combat and of magic (divine magic in earlier editions, arcane magic in later editions). Bards use their artistic talents to induce magical effects.",
        "jills_opinion" => "The 'Look at Me' girl in all of us"
    })

    Category.create({
        "name" => "Cleric",
        "trait" => "Clerics are intermediaries between the mortal world and the distant planes of the gods. As varied as the gods they serve, clerics strive to embody the handiwork of their deities. No ordinary priest, a cleric is imbued with divine magic.",
        "jills_opinion" => "Haven't we all spend enough time pretending to be religious?"
    })

    Category.create({
        "name" => "Druid",
        "trait" => "Druid spells are oriented toward nature and animals—the power of tooth and claw, of sun and moon, of fire and storm. Druids also gain the ability to take on animal forms, and some druids make a particular study of this practice, even to the point where they prefer animal form to their natural form.",
        "jills_opinion" => "Disney Princess, but make it secretly OP. 15/10"
    })

    Category.create({
        "name" => "Fighter",
        "trait" => "Fighters share an unparalleled mastery with weapons and armor, and a thorough knowledge of the skills of combat. They are well acquainted with death, both meting it out and staring it defiantly in the face. You must have a Dexterity or Strength score of 13 or higher in order to multiclass in or out of this class.",
        "jills_opinion" => "Less fun barbarian"
    })

    Category.create({
        "name" => "Monk",
        "trait" => "Monks make careful study of a magical energy that most monastic traditions call ki. ... Using this energy, monks channel uncanny speed and strength into their unarmed strikes. As they gain experience, their martial training and their mastery of ki gives them more power over their bodies and the bodies of their foes.",
        "jills_opinion" => "Lots of punchy punch melee damage"
    })

    Category.create({
        "name" => "Paladin",
        "trait" => "The paladin is one of the standard playable character classes in most editions of the Dungeons & Dragons fantasy role-playing game. The paladin is a holy knight, crusading in the name of good and order, and is a divine spellcaster.",
        "jills_opinion" => "Charismatic and Religious..like a Youth Group Leader?"
    })

    Category.create({
        "name" => "Ranger",
        "trait" => "Though a ranger might make a living as a hunter, a guide, or a tracker, a ranger's true calling is to defend the outskirts of civilization from the ravages of monsters and humanoid hordes that press in from the wild. Their spells, like their combat abilities, focus on speed, stealth, and the hunt.",
        "jills_opinion" => "We all had a Legolas thing, it's valid"
    })

    Category.create({
        "name" => "Rogue",
        "trait" => "Being as slippery as an eel, rogues have the ability to manoeuvre out of harm's way, mostly. You'll experience this first bout of slipperiness with at second level, with the Cunning Action ability",
        "jills_opinion" => "It's all fun and games until you forget to check for traps"
    })

    Category.create({
        "name" => "Sorcerer",
        "trait" => "The Sorcerer falls into a middle ground between the wizard and the warlock. The Sorcerer gets more spell slots than the Warlock, but knows far fewer spells than the Wizard. The Sorcerer's versatility comes from their ability to boost their spells using Metamagic, shaping them to suit the needs of the moment.",
        "jills_opinion" => "Unstoppable desire to incorporate Wild Magic Surges vs Immovable Inability to remember to make rolls for it"
    })

    Category.create({
        "name" => "Wizard",
        "trait" => "The Wizard is the iconic arcane spellcaster, capable of doing all manner of fantastic tricks, and generally limited only by their spellbook and their spell slots.",
        "jills_opinion" => "Super hot until you remember you're carrying books around all the time. NERD"
    })

    