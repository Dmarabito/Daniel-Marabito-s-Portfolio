>>source format free
identification division.
program-id. IskaiAdventures.
author. Daniel Marabito.
environment division.
data division.
working-storage section.
01 PlayerInfo.
       02 PlayerName pic x(100) value "".
       02 PlayerMaxHealth pic 99 value 10.
       02 PlayerScore pic S999 value 0.
       02 PlayerRaces.
           03 Human pic 9 value 0.
               88 IsntHuman value 0.
               88 IsHuman value 1.
           03 Giant pic 9 value 0.
               88 IsntGiant value 0.
               88 IsGiant value 1.
           03 Dragon pic 9 value 0.
               88 IsntDragon value 0.
               88 IsDragon value 1.
           03 Dwarf pic 9 value 0.
               88 IsntDwarf value 0.
               88 IsDwarf value 1.
           03 Elf pic 9 value 0.
               88 IsntElf value 0.
               88 IsElf value 1.
           03 Vampire pic 9 value 0.
               88 IsntVampire value 0.
               88 IsVampire value 1.
           03 Werewolf pic 9 value 0.
               88 IsntWerewolf value 0.
               88 IsWerewolf value 1.
           03 Ghost pic 9 value 0.
               88 IsntGhost value 0.
               88 IsGhost value 1.
           03 Skeleton pic 9 value 0.
               88 IsntSkeleton value 0.
               88 IsSkeleton value 1.
           03 Slime pic 9 value 0.
               88 IsntSlime value 0.
               88 IsSlime value 1.
           03 Crab pic 9 value 0.
               88 IsntCrab value 0.
               88 IsCrab value 1.
           03 Cow pic 9 value 0.
               88 IsntCow value 0.
               88 IsCow value 1.
               
01 ProblemResponseFlag pic 9 value 0.
       88 ValidInput value 1 thru 4.
       88 Inquiry value 1.
       88 AllowContinue value 2.
       88 ComplainAboutDeath value 3.
       88 ComplainAboutTime value 4.
01 GeneralResponse pic x(100) value "".

01 initialRaceChoice pic 99 value 0.
       88 ValidRaceChoice value 1 thru 12.
       88 ChooseToBeHuman value 1.
       88 ChooseToBeGiant value 2.
       88 ChooseToBeDragon value 3.
       88 ChooseToBeDwarf value 4.
       88 ChooseToBeElf value 5.
       88 ChooseToBeVampire value 6.
       88 ChooseToBeWerewolf value 7.
       88 ChooseToBeGhost value 8.
       88 ChooseToBeSkeleton value 9.
       88 ChooseToBeSlime value 10.
       88 ChooseToBeCrab value 11.
       88 ChooseToBeCow value 12.
01 Location.
       02 LocationName pic x(50) value "Afterlife".
       02 LocationDescription pic x(1000) value "A white void expands in all directions.".
       02 LocationInstructions pic x(1000) value "".
       02 TargetDestination pic x(1000) value "".
procedure division.
display "A truck has recently ran over you. You survied the initial hit, but the driver noticed he hit something.".
display "He put the vehicle in reverse to see what he hit. Shortly after you found yourself in a white void.".
display "Before you stands a man. He speaks 'Hmm... I was not expecting you. Who are you?'"
accept PlayerName

perform HeSaysThereIsAProblemYouSay until ValidInput

if Inquiry then
display "ahh yes, I was getting to that. The problem is I wasn't ready for you to die, so I don't really have accommodations ready for you. I know I will reincarnate you, then when you die again I can be ready."
end-if
if AllowContinue then
display "The problem is I wasn't ready for you to die, so I don't really have accommodations ready for you. I know I will reincarnate you, then when you die again I can be ready."
compute PlayerScore = PlayerScore + 10
end-if
if ComplainAboutDeath then
display "Yes and no. The problem isn't that you died, it is I wasn't ready for you to die. I know I will reincarnate you, then when you die again I can be ready."
end-if
if ComplainAboutTime then
display "I'm Sorry!!! I'm wasting your time trying to accomodate your after life. Fine let's get this over with."
compute PlayerScore = PlayerScore - 100
end-if
display ""

*> race selection section
if PlayerScore = 0 or PlayerScore > 0 then
display "Alright it is decided, I will send you to a new world. New for you, not for me. Let's take a moment to discuss how you want to be reborn."
display "Do you want to be human or something else?"
display "You could be a giant, or a dragon."
display "A dwarf or an elf."
display "A vampire or a werewolf."
display "A ghost or a skeleton."
display "Even a slime or a crab if you so please."
perform SoWhatWillItBe until ValidRaceChoice and initialRaceChoice not equal to 12
perform SetRace
end-if
if PlayerScore < 0 then
display "You really ticked me off, normally I'd let you choose what race you want to be."
display "But no you are being a cow and you are going to like it."
compute initialRaceChoice = 12
perform SetRace
end-if
*> ---------Consider adding god comentary here about your pick of race.
*> End race selection

*> section for Gaining a boon (On hold)

*> Gaining a boon section end

*> section for stat selection (on hold)

*> end of section for stat selection
move "display" to LocationInstructions
call 'LocationSetter' using Location.
*> --------Main Game Loop---------------------
*>---------End Main Loop----------------------
stop run.

HeSaysThereIsAProblemYouSay.
       display "While " function trim(PlayerName) " we have a bit of a problem..."
       display "1) Inquire about the problem."
       display "2) Let him continue."
       display "3) Say 'The problem is that I died?'"
       display "4) Say 'The problem is you wasting my time. Fork over my power already!'"
       accept ProblemResponseFlag.

SoWhatWillItBe.
       display "1) Human"
       display "2) Giant"
       display "3) Dragon"
       display "4) Dwarf"
       display "5) Elf"
       display "6) Vampire"
       display "7) Werewolf"
       display "8) Ghost"
       display "9) skeleton"
       display "10) Slime"
       display "11) Crab"
       accept initialRaceChoice.
       
SetRace.
       if ChooseToBeHuman then 
           set IsHuman to true
       end-if
       if ChooseToBeGiant then 
           set IsGiant to true
       end-if
       if ChooseToBeDragon then 
           set IsDragon to true
       end-if
       if ChooseToBeDwarf then 
           set IsDwarf to true
       end-if
       if ChooseToBeElf then 
           set IsElf to true
       end-if
       if ChooseToBeVampire then 
           set IsVampire to true
       end-if
       if ChooseToBeWerewolf then 
           set IsWerewolf to true
       end-if
       if ChooseToBeGhost then 
           set IsGhost to true
       end-if
       if ChooseToBeSkeleton then 
           set IsSkeleton to true
       end-if
       if ChooseToBeSlime then 
           set IsSlime to true
       end-if
       if ChooseToBeCrab then 
           set IsCrab to true
       end-if
       if ChooseToBeCow then 
           set IsCow to true
       end-if.
