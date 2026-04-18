10 REM KINGDOM OF GRAIN
20 PAPER 0: INK 7: BORDER 1: CLS
30 PRINT "    KINGDOM OF GRAIN": PRINT
40 PRINT "Rule for 10 years. Manage grain,"
50 PRINT "land, peasants and warriors."
60 PRINT "Beware of enemies, spies and fire."
70 PRINT : PRINT "Press any key to begin..."
80 PAUSE 0
90 LET pop=100: LET warr=10
100 LET grain=2800: LET acres=1000
110 LET harv=3: LET rats=0: LET arr=0
120 LET starved=0: LET totst=0: LET plague=0
130 LET news$="": LET evt$=""
140 FOR year=1 TO 10
150 CLS
160 PRINT "YEAR ";year;" OF YOUR REIGN"
170 PRINT "--------------------"
180 PRINT "Peasants:       ";pop
190 PRINT "Warriors:       ";warr
200 IF year>1 AND starved>0 THEN PRINT "Starved:        ";starved
210 IF year>1 AND arr>0 THEN PRINT "Newcomers:      ";arr
220 IF plague=1 THEN PRINT "Plague struck!"
230 IF news$<>"" THEN PRINT news$
240 IF evt$<>"" THEN PRINT evt$
250 PRINT "Acres of land:  ";acres
260 IF year>1 THEN PRINT "Last harvest:   ";harv;" bu/acre"
270 IF year>1 THEN PRINT "Rats devoured:  ";rats
280 PRINT "Grain in store: ";grain
290 LET price=INT (RND*10)+17
300 PRINT "Land price:     ";price;" bu/acre"
310 PRINT
320 INPUT "Acres to buy? ";bA
330 IF bA<0 OR bA*price>grain THEN PRINT "Impossible.": GO TO 320
340 LET acres=acres+bA: LET grain=grain-bA*price
350 IF bA>0 THEN GO TO 390
360 INPUT "Acres to sell? ";sA
370 IF sA<0 OR sA>acres THEN PRINT "Not that much land.": GO TO 360
380 LET acres=acres-sA: LET grain=grain+sA*price
390 INPUT "Recruit warriors (- to dismiss)? ";dW
400 IF warr+dW<0 THEN PRINT "You have only ";warr;".": GO TO 390
410 IF dW>pop THEN PRINT "Not enough peasants.": GO TO 390
420 LET warr=warr+dW: LET pop=pop-dW
430 INPUT "Bushels to feed peasants? ";fd
440 IF fd<0 OR fd>grain THEN PRINT "Not enough grain.": GO TO 430
450 LET grain=grain-fd
460 LET wpay=warr*30
470 PRINT "Warriors need ";wpay;" bushels."
480 INPUT "Bushels to pay warriors? ";pw
490 IF pw<0 OR pw>grain THEN PRINT "Not enough grain.": GO TO 480
500 LET grain=grain-pw
510 INPUT "Acres to plant? ";pl
520 IF pl<0 OR pl>acres THEN PRINT "Not that much land.": GO TO 510
530 IF pl>grain THEN PRINT "Not enough seed.": GO TO 510
540 IF pl>pop*10 THEN PRINT "Not enough peasants.": GO TO 510
550 LET grain=grain-pl
560 LET harv=INT (RND*7)+1
570 LET grain=grain+pl*harv
580 LET rats=0
590 IF RND<0.4 THEN LET rats=INT (grain*RND*0.3): LET grain=grain-rats
600 LET news$=""
610 IF RND<0.25 THEN GO SUB 2000
620 LET startpop=pop
630 LET eaten=INT (fd/20)
640 LET starved=pop-eaten
650 IF starved<0 THEN LET starved=0
660 LET pop=pop-starved
670 LET totst=totst+starved
680 LET dsrt=warr-INT (pw/30)
690 IF dsrt<0 THEN LET dsrt=0
700 IF dsrt>warr THEN LET dsrt=warr
710 LET warr=warr-dsrt: LET pop=pop+dsrt
720 IF dsrt>0 THEN LET news$=news$+" "+STR$ dsrt+" warriors deserted."
730 LET arr=0
740 IF starved=0 AND pop>0 THEN LET arr=INT (RND*10)+1: LET pop=pop+arr
750 LET plague=0
760 IF RND<0.12 THEN LET plague=1: LET pop=INT (pop/2): LET warr=INT (warr/2)
770 LET evt$=""
780 LET ev=INT (RND*8)
790 IF ev=0 THEN LET st=INT (grain*(0.05+RND*0.15)): LET grain=grain-st: LET evt$="Spies stole "+STR$ st+" grain."
800 IF ev=1 THEN LET fi=INT (grain*(0.1+RND*0.2)): LET grain=grain-fi: LET evt$="Fire took "+STR$ fi+" grain."
810 IF ev=2 THEN LET gi=INT (RND*400)+100: LET grain=grain+gi: LET evt$="Traders gave "+STR$ gi+" grain."
820 IF ev=3 THEN LET evt$="A mild spring favours all."
830 IF ev=4 THEN LET evt$="Ill omens darken the sky."
840 IF startpop>0 AND starved*100/startpop>45 THEN GO TO 1700
850 IF pop=0 THEN GO TO 1700
860 NEXT year
870 CLS
880 PRINT "Your 10 years are over!": PRINT
890 PRINT "Total starved:    ";totst
900 PRINT "Final peasants:   ";pop
910 PRINT "Final warriors:   ";warr
920 IF pop=0 THEN GO TO 1700
930 LET ap=acres/pop
940 PRINT "Acres per person: ";INT (ap)
950 LET rate=totst/10
960 PRINT
970 IF rate>33 OR ap<7 THEN PRINT "A cruel tyrant. Exile awaits.": GO TO 1800
980 IF rate>10 OR ap<9 THEN PRINT "A poor ruler. Many grumble.": GO TO 1800
990 IF rate>3 OR ap<10 THEN PRINT "A fair and steady ruler.": GO TO 1800
1000 PRINT "A great ruler! Long may you reign!": GO TO 1800
1700 CLS
1710 PRINT "Too many have perished!"
1720 PRINT "The people rise up and cast you out."
1800 PRINT : PRINT "-- Game over --"
1810 STOP
2000 REM -- INVASION --
2010 LET foe=INT (RND*80)+20
2020 PRINT "Enemies! ";foe;" raiders attack."
2030 PRINT "Your warriors: ";warr
2040 IF warr>=foe THEN LET loot=foe*5: LET grain=grain+loot: LET cas=INT (foe/4): LET warr=warr-cas: LET news$="Victory! Plunder: "+STR$ loot+" grain.": GO TO 2100
2050 LET dead=warr: LET warr=0
2060 LET taken=(foe-dead)*(INT (RND*15)+5)
2070 IF taken>grain THEN LET taken=grain
2080 LET grain=grain-taken
2090 LET news$="Defeat! Enemies took "+STR$ taken+" grain."
2100 RETURN
