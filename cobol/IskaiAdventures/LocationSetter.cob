>> Source Format Free
identification division.
program-id. LocationSetter.
data division.
working-storage section.
       01 LocationDescriptions.
           02 AfterLifeDescription pic x(1000) value "A white void expands in all directions.".

linkage section.
       01 SubRLocation.
           02 SubRLocationName pic x(50) value "Afterlife".
           02 SubRLocationDescription pic x(1000) value "A white void expands in all directions.".
           02 SubRLocationInstructions pic x(1000) value "".
           02 SubRTargetDestination pic x(1000) value "".

procedure division using SubRLocation.
       if (SubRLocationInstructions equals "display") then
           display function trim (SubRLocationName)
           display function trim (SubRLocationDescription)
       end-if
       if (SubRLocation equals "set") then
       move SubRTargetDestination to SubRLocationName
       perform SetDescription
       end-if
exit program.

SetDescription.
       if SubRLocationName equals "Afterlife" then
           move AfterLifeDescription to SubRLocationDescription
       end-if
       .