# This is a sample Python script.

# Press Shift+F10 to execute it or replace it with your code.
# Press Double Shift to search everywhere for classes, files, tool windows, actions, and settings.
import random

from craiyon import Craiyon
import os

def print_hi(name):
    # Use a breakpoint in the code line below to debug your script.
    print(f'Hi, {name}')  # Press Ctrl+F8 to toggle the breakpoint.



def SCPDepictor(Prompt,SubLocation):
    SCPD = Craiyon()
    Depiction = SCPD.generate(Prompt)
    Depiction.save_images(os.getcwd()+SubLocation)
    print("SCP 1d6 j has been depicted.")

def SCP1D6JSpawner(NumberOfTheBeast):
    ObjectClassPos = ["Safe","Euclid","Keter","Safe, later promoted to Euclid once it exploded a guy's eyeballs","Safe, later promoted to Keter once it exploded ten guys' eyeballs",
"Double Keter"]

    SpecialContainmentProceduresPos = ["a cardboard box","standard 3m x 3m x 3m room", "standard 3m x 3m x 3m room with a lock on the door", "olympic pool full of vinegar", "underground bunker guarded by a priest, a rabbi, and a cowboy", "its own pocket universe"]

    Description = ["stone cube", "common household item", "big dog","swarm of insects", "just some hobo", "conglomeration of body parts from at least three different taxa"]

    Variation = ["extremely old and decaying", "brand spanking new", "alarmingly out of fashion", "warm to the touch", "radioactive", "noneuclidian"]

    Origin = ["Dr. Bright's bathroom", "suburban house, family now insane", "holy temple, monks didn't like it", "alternate future", "real future", "another universe, bad move in retrospect"]

    ReasonsItCantBeKilled = ["didn't feel like it", "it's indestructible", "it regenerates", "it is too cute to destroy", "it destroys the scientists first","[DATA EXPUNGED] all over people's faces"]

    ProximityResults = ["hairy palms", "intense feeling of paranoia", "skin replaced with non-skin substance", "hive mind formation", "Disappearing Leg Syndrome (DLS)", "heat death"]

    ResearchAttempted = ["threw rubber ball at SCP", "exposed it to open flame", "told a D-Class to tell his problems to SCP", "uttered list of power words between 'G' and 'M'", "drew a mustache on it with marker", "fed it to SCP-682"]

    Results = ["strong smell of camphor", "voices from beyond the membrane dictate shopping list", "blood, blood everywhere", "nothing much, but O5s told us to stop anyway", "Site-22 destroyed", "time now runs backwards, my bad"]

    Notes = ["Don't feed it after midnight", "Stop using this as a doorstop, you guys", "All references to pop culture are strictly forbidden", "Pretty sure it winked at me", "Requests for better accommodation and some light reading rescinded", "It speaks truth and we shall all join it on the black ship"]

    TheBeast = "Object Class: " + ObjectClassPos[NumberOfTheBeast[0]] +". "+ "SCP-1D6-J is to be contained within: "+ SpecialContainmentProceduresPos[NumberOfTheBeast[1]] + ". "+ "SCP-1D6-J is a " + Description[NumberOfTheBeast[2]] + " except that it is " + Variation[NumberOfTheBeast[3]] +". " + "SCP-1D6-J was acquired from " + Origin[NumberOfTheBeast[4]] + ". " + "Attempts to destroy it have failed because " + ReasonsItCantBeKilled[NumberOfTheBeast[5]] +". " + "Handling the SCP or being close to it leads to " + ProximityResults[NumberOfTheBeast[6]] + ". " + "Research attempted: " + ResearchAttempted[NumberOfTheBeast[7]] + ". " + "Results: " + Results[NumberOfTheBeast[8]] + ". " + "Notes: " + Notes[NumberOfTheBeast[9]] + ". "

    return TheBeast
def ClassifySCP ():
    NumberOfTheBeast = []
    for i in range(10):
        NumberOfTheBeast.append(random.randrange(0,5))
    return NumberOfTheBeast
# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    NumberOfTheBeast = ClassifySCP()
    print(NumberOfTheBeast)
    TheBeast = SCP1D6JSpawner(NumberOfTheBeast)
    print(TheBeast)
    SCPDepictor(TheBeast, "\SCP1d6j\SCP1d6JVersion"+str(NumberOfTheBeast[0])+str(NumberOfTheBeast[1])+str(NumberOfTheBeast[2])+str(NumberOfTheBeast[3])+str(NumberOfTheBeast[4])+str(NumberOfTheBeast[5])+str(NumberOfTheBeast[6])+str(NumberOfTheBeast[7])+str(NumberOfTheBeast[8])+str(NumberOfTheBeast[9]))

# See PyCharm help at https://www.jetbrains.com/help/pycharm/
