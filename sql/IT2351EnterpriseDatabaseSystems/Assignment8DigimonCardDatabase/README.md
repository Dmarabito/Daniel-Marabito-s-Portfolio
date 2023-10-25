# So we were assigned to make our own database with connect tables.
# the first part is just creating the database. Simple single line in CreateDigimonCardGameDatabase.sql
# The second part I made a color table, that is located in ColorTableCreateAndInsert.sql, I also inserted colors into the table.
# the third part is an artist table. I found out while filling some of the data that some cards don't have the artist written on them. As such I have to let another table be null at a point.
# the fourth part was trait table, again I tackled the null problem this time came up with a diffrent solution that being having a trait just be null rather then a foreign key being null.
# After that the 5th part was making the effects table, the real issue I battled was the length of effects/number per card to ensure all are visible in the screenshot for my teacher.
# 6th was cost table create and fill.
# 7th part is type table, it houses the types of cards.
# the 8th part is the card table, it has a foreign key refrencing type.
# the 9th part was making card traits table is an associated entitiy table between card and traits.
# The 10th table credits tale this is the one I thought I would have to make null, ended up inserting an unknown value in artist instead.
# the 11th table is colorOfCards an associated table between colors and cards.
# 12th step made an associated table between effects and cards.
# 13th step requirements table is made and filled.
# 14th step made the associated table between requirements and costs
