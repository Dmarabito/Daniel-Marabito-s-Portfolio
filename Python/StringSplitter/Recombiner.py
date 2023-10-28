class Recombiner:

    def __init__(self,LongString):
        self.LongString = LongString
        self.splitArray = self.SplitAndCondenseString()

    def BreakIntoSentences(self,longString):
        CurrentString = longString
        FrontString = ""
        OutputArray = []
        while ("." in CurrentString or "!" in CurrentString or "?" in CurrentString):
            FrontString, CurrentString = self.StringSplitter(CurrentString, self.NearestString(CurrentString, ['.', '!', '?']))
            OutputArray.append(FrontString)
        return OutputArray

    def StringSplitter(self,InString, SplitString):
        FrontString = ""
        BackString = ""
        FrontString = InString[0: InString.find(SplitString) + 1]
        BackString = InString[InString.find(SplitString) + 1:len(InString)]
        return FrontString, BackString

    def NearestString(self,InString, InArrayOfStrings):
        NearestString = None
        for EachString in InArrayOfStrings:
            if (InString.find(EachString) > 0):
                if (NearestString == None):
                    NearestString = EachString
                elif (InString.find(EachString) < InString.find(NearestString)):
                    NearestString = EachString
        return NearestString

    def CondenseArrayStep(self,InArrayOfStrings, FocusPoint, Threshold=2000):
        OutArray = []
        if (FocusPoint < len(InArrayOfStrings) - 1):
            if (len(InArrayOfStrings[FocusPoint]) + len(InArrayOfStrings[FocusPoint + 1]) < Threshold):
                for x in range(len(InArrayOfStrings)):
                    if x < FocusPoint or x > FocusPoint + 1:
                        OutArray.append(InArrayOfStrings[x])
                    elif x == FocusPoint:
                        OutArray.append(InArrayOfStrings[x] + InArrayOfStrings[x + 1])
                return OutArray, True
            else:
                return InArrayOfStrings, False
        else:
            return InArrayOfStrings, False

    def CondenseArray(self,InArrayOfStrings, Threshold=2000):
        UpdatedStatus = True
        print(len(InArrayOfStrings))
        for x in range(len(InArrayOfStrings)):
            while (UpdatedStatus == True):
                InArrayOfStrings, UpdatedStatus = self.CondenseArrayStep(InArrayOfStrings, x, Threshold)
                # print("x is "+str(x)+" the array step is " + InArrayOfStrings[x])
            UpdatedStatus = True

        return InArrayOfStrings


    def SplitAndCondenseString(self):
        return self.CondenseArray(self.BreakIntoSentences(self.LongString))

    def UpdateText(self,InString):
        self.__init__(InString)
