10 REM FIVE-POINTED STAR
20 PAPER 0: INK 6: BORDER 1: CLS
30 LET cx=128: LET cy=88: LET r=70
40 DIM x(5): DIM y(5)
50 FOR i=1 TO 5
60 LET a=PI/2+(i-1)*2*PI/5
70 LET x(i)=cx+r*COS a
80 LET y(i)=cy+r*SIN a
90 NEXT i
100 PLOT x(1),y(1)
110 DRAW x(3)-x(1),y(3)-y(1)
120 DRAW x(5)-x(3),y(5)-y(3)
130 DRAW x(2)-x(5),y(2)-y(5)
140 DRAW x(4)-x(2),y(4)-y(2)
150 DRAW x(1)-x(4),y(1)-y(4)
