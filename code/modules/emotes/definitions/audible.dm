/decl/emote/audible
	key = "burp"
	emote_message_3p = "USER burps."
	message_type = AUDIBLE_MESSAGE
	// three-dimensional array
	// first is the species, associated to a list of genders, associated to a list of the sound effects to use
	var/list/emote_sound = null

/decl/emote/audible/do_extra(var/atom/user)
	var/mob/living/carbon/human/H = user
	if(istype(H) && islist(emote_sound) && islist(emote_sound[H.species.name]) && islist(emote_sound[H.species.name][H.gender]))
		playsound(user.loc, pick(emote_sound[H.species.name][H.gender]), 50, 0)

/decl/emote/audible/deathgasp_alien
	key = "deathgasp"
	emote_message_3p = "USER lets out a waning guttural screech, green blood bubbling from its maw."

/decl/emote/audible/whimper
	key ="whimper"
	emote_message_3p = "USER whimpers."
	emote_sound = list(
		SPECIES_MONKEY = list(
			MALE = list('sound/voice/monkey/whimper1.ogg', 'sound/voice/monkey/whimper2.ogg', 'sound/voice/monkey/whimper3.ogg'),
			FEMALE = list('sound/voice/monkey/whimper1.ogg', 'sound/voice/monkey/whimper2.ogg', 'sound/voice/monkey/whimper3.ogg')
		)
	)

/decl/emote/audible/gasp
	key ="gasp"
	emote_message_3p = "USER gasps."
	conscious = 0
	emote_sound = list(
		SPECIES_HUMAN = list(
			MALE = list('sound/voice/human/gasp_m1.ogg', 'sound/voice/human/gasp_m2.ogg'),
			FEMALE = list('sound/voice/human/gasp_f1.ogg', 'sound/voice/human/gasp_f2.ogg')
		)
	)

/decl/emote/audible/scretch
	key ="scretch"
	emote_message_3p = "USER scretches."

/decl/emote/audible/choke
	key ="choke"
	emote_message_3p = "USER chokes."
	conscious = 0

/decl/emote/audible/gnarl
	key ="gnarl"
	emote_message_3p = "USER gnarls and shows its teeth.."

/decl/emote/audible/chirp
	key ="chirp"
	emote_message_3p = "USER chirps!"
	emote_sound = list(
		SPECIES_DIONA = list(
			MALE = list('sound/misc/nymphchirp.ogg'),
			FEMALE = list('sound/misc/nymphchirp.ogg')
		)
	)

/decl/emote/audible/alarm
	key = "alarm"
	emote_message_1p = "You sound an alarm."
	emote_message_3p = "USER sounds an alarm."

/decl/emote/audible/alert
	key = "alert"
	emote_message_1p = "You let out a distressed noise."
	emote_message_3p = "USER lets out a distressed noise."

/decl/emote/audible/notice
	key = "notice"
	emote_message_1p = "You play a loud tone."
	emote_message_3p = "USER plays a loud tone."

/decl/emote/audible/whistle
	key = "whistle"
	emote_message_1p = "You whistle."
	emote_message_3p = "USER whistles."

/decl/emote/audible/boop
	key = "boop"
	emote_message_1p = "You boop."
	emote_message_3p = "USER boops."

/decl/emote/audible/sneeze
	key = "sneeze"
	emote_message_3p = "USER sneezes."

/decl/emote/audible/sniff
	key = "sniff"
	emote_message_3p = "USER sniffs."

/decl/emote/audible/snore
	key = "snore"
	emote_message_3p = "USER snores."
	conscious = 0

/decl/emote/audible/whimper
	key = "whimper"
	emote_message_3p = "USER whimpers."

/decl/emote/audible/yawn
	key = "yawn"
	emote_message_3p = "USER yawns."

/decl/emote/audible/clap
	key = "clap"
	emote_message_3p = "USER claps."

/decl/emote/audible/chuckle
	key = "chuckle"
	emote_message_3p = "USER chuckles."

/decl/emote/audible/cough
	key = "cough"
	emote_message_3p = "USER coughs!"
	conscious = 0
	emote_sound = list(
		SPECIES_HUMAN = list(
			MALE = list('sound/voice/human/cough_m1.ogg', 'sound/voice/human/cough_m2.ogg', 'sound/voice/human/cough_m3.ogg', 'sound/voice/human/cough_m4.ogg'),
			FEMALE = list('sound/voice/human/cough_f1.ogg', 'sound/voice/human/cough_f2.ogg', 'sound/voice/human/cough_f3.ogg', 'sound/voice/human/cough_f4.ogg')
		)
	)

/decl/emote/audible/cry
	key = "cry"
	emote_message_3p = "USER cries."

/decl/emote/audible/sigh
	key = "sigh"
	emote_message_3p = "USER sighs."

/decl/emote/audible/laugh
	key = "laugh"
	emote_message_3p_target = "USER laughs at TARGET."
	emote_message_3p = "USER laughs."

/decl/emote/audible/mumble
	key = "mumble"
	emote_message_3p = "USER mumbles!"

/decl/emote/audible/grumble
	key = "grumble"
	emote_message_3p = "USER grumbles!"

/decl/emote/audible/groan
	key = "groan"
	emote_message_3p = "USER groans!"
	conscious = 0

/decl/emote/audible/moan
	key = "moan"
	emote_message_3p = "USER moans!"
	conscious = 0

/decl/emote/audible/giggle
	key = "giggle"
	emote_message_3p = "USER giggles."

/decl/emote/audible/scream
	key = "scream"
	emote_message_3p = "USER screams!"
	emote_sound = list(
		SPECIES_HUMAN = list(
			MALE = list('sound/voice/human/scream_m1.ogg','sound/voice/human/scream_m2.ogg','sound/voice/human/scream_m3.ogg'),
			FEMALE = list('sound/voice/human/scream_f1.ogg')
		),
		SPECIES_MONKEY = list(
			MALE = list('sound/voice/monkey/scream1.ogg'),
			FEMALE = list('sound/voice/monkey/scream1.ogg')
		),
		SPECIES_IPC = list(
			NEUTER = list('sound/voice/robot/scream1.ogg'),
			MALE = list('sound/voice/robot/scream1.ogg'),
			FEMALE = list('sound/voice/robot/scream1.ogg'),
			PLURAL = list('sound/voice/robot/scream1.ogg')
		)
	)

/decl/emote/audible/grunt
	key = "grunt"
	emote_message_3p = "USER grunts."

/decl/emote/audible/slap
	key = "slap"
	emote_message_1p_target = "<span class='warning'>You slap TARGET across the face!</span>"
	emote_message_1p = "You slap yourself across the face!"
	emote_message_3p_target = "<span class='warning'>USER slaps TARGET across the face!</span>"
	emote_message_3p = "USER slaps USER_SELF across the face!"
	emote_sound = 'sound/effects/snap.ogg'

/decl/emote/audible/bug_hiss
	key ="hiss"
	emote_message_3p_target = "USER hisses at TARGET."
	emote_message_3p = "USER hisses."
	emote_sound = list(
		SPECIES_DIONA = list(
			MALE = list('sound/voice/BugHiss.ogg'),
			FEMALE = list('sound/voice/BugHiss.ogg')
		)
	)

/decl/emote/audible/bug_buzz
	key ="buzz"
	emote_message_3p = "USER buzzes its wings."
	emote_sound = list(
		SPECIES_NABBER = list(
			MALE = list('sound/voice/BugBuzz.ogg'),
			FEMALE = list('sound/voice/BugBuzz.ogg')
		)
	)

/decl/emote/audible/bug_chitter
	key ="chitter"
	emote_message_3p = "USER chitters."
	emote_sound = list(
		SPECIES_DIONA = list(
			MALE = list('sound/voice/Bug.ogg'),
			FEMALE = list('sound/voice/Bug.ogg')
		)
	)
