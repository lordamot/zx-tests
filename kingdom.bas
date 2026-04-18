10 REM KINGDOM OF GRAIN
20 PAPER 0: INK 7: BORDER 1: CLS
30 PRINT "    KINGDOM OF GRAIN": PRINT
40 PRINT "Rule your kingdom for 10 years."
50 PRINT "Manage grain, land and people."
60 PRINT : PRINT "Press any key to begin..."
70 PAUSE 0
80 LET pop=100: LET grain=2800: LET acres=1000
90 LET harv=3: LET rats=200: LET arr=5
100 LET starved=0: LET totst=0: LET plague=0
110 FOR year=1 TO 10
120 CLS
130 PRINT "YEAR ";year;" OF YOUR REIGN"
140 PRINT "--------------------"
150 PRINT "Population:     ";pop
160 IF starved>0 THEN PRINT "Starved:        ";starved
170 IF arr>0 THEN PRINT "New arrivals:   ";arr
180 IF plague=1 THEN PRINT "Plague has struck!"
190 PRINT "Acres of land:  ";acres
200 PRINT "Last harvest:   ";harv;" bu/acre"
210 PRINT "Rats devoured:  ";rats
220 PRINT "Grain in store: ";grain
230 LET price=INT (RND*10)+17
240 PRINT "Land price:     ";price;" bu/acre"
250 PRINT
260 INPUT "Acres to buy? ";bA
270 IF bA<0 OR bA*price>grain THEN PRINT "Impossible.": GO TO 260
280 LET acres=acres+bA: LET grain=grain-bA*price
290 IF bA>0 THEN GO TO 330
300 INPUT "Acres to sell? ";sA
310 IF sA<0 OR sA>acres THEN PRINT "Impossible.": GO TO 300
320 LET acres=acres-sA: LET grain=grain+sA*price
330 INPUT "Bushels to feed people? ";fd
340 IF fd<0 OR fd>grain THEN PRINT "Impossible.": GO TO 330
350 LET grain=grain-fd
360 INPUT "Acres to plant? ";pl
370 IF pl<0 OR pl>acres THEN PRINT "Not that much land.": GO TO 360
380 IF pl>grain THEN PRINT "Not enough seed grain.": GO TO 360
390 IF pl>pop*10 THEN PRINT "Not enough people.": GO TO 360
400 LET grain=grain-pl
410 LET harv=INT (RND*7)+1
420 LET grain=grain+pl*harv
430 LET rats=0
440 IF RND<0.4 THEN LET rats=INT (grain*RND*0.3): LET grain=grain-rats
450 LET startpop=pop
460 LET eaten=INT (fd/20)
470 LET starved=pop-eaten
480 IF starved<0 THEN LET starved=0
490 LET pop=pop-starved
500 LET totst=totst+starved
510 LET arr=0
520 IF starved=0 AND pop>0 THEN LET arr=INT (RND*10)+1: LET pop=pop+arr
530 LET plague=0
540 IF RND<0.15 THEN LET plague=1: LET pop=INT (pop/2)
550 IF startpop>0 AND starved*100/startpop>45 THEN GO TO 700
560 IF pop=0 THEN GO TO 700
570 NEXT year
580 CLS
590 PRINT "Your 10 years are over!": PRINT
600 PRINT "Total starved:    ";totst
610 PRINT "Final population: ";pop
620 IF pop=0 THEN GO TO 700
630 LET ap=acres/pop
640 PRINT "Acres per person: ";INT (ap)
650 LET rate=totst/10
660 PRINT
670 IF rate>33 OR ap<7 THEN PRINT "A cruel tyrant. Exile awaits.": GO TO 800
680 IF rate>10 OR ap<9 THEN PRINT "A poor ruler. Many grumble.": GO TO 800
690 IF rate>3 OR ap<10 THEN PRINT "A fair and steady ruler.": GO TO 800
695 PRINT "A great ruler! Long may you reign!": GO TO 800
700 CLS
710 PRINT "Too many have perished!"
720 PRINT "The people rise up and cast you out."
800 PRINT : PRINT "-- Game over --"
