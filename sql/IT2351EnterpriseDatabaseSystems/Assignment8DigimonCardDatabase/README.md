# So we were assigned to make our own database with connect tables.
# the first part is just creating the database. Simple single line in CreateDigimonCardGameDatabase.sql
# The second part I made a color table, that is located in ColorTableCreateAndInsert.sql, I also inserted colors into the table.
# the third part is an artist table. I found out while filling some of the data that some cards don't have the artist written on them. As such I have to let another table be null at a point.
# the fourth part was trait table, again I tackled the null problem this time came up with a diffrent solution that being having a trait just be null rather then a foreign key being null.
# After that the 5th part was making the effects table, the real issue I battled was the length of effects/number per card to ensure all are visible in the screenshot for my teacher.
# 6th was cost table create and fill.
# 7th part is type table, it houses the types of cards.
# the 8th part is the card table, it has a foreign key refrencing type.
