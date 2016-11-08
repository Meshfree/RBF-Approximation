pts = (0:50)/50;
[x,y] = ndgrid(pts,pts);

subplot(2,3,1);
f1 = F1(x,y);
surf(x,y,f1), view(145,-2)

subplot(2,3,2);
f2 = F2(x,y);
surf(x,y,f2)

subplot(2,3,3);
f4 = F4(x,y);
surf(x,y,f4)

subplot(2,3,4);
f6 = F6(x,y);
surf(x,y,f6)
axis tight;


pts8 = (-2:4/50:2);
[x8,y8] = ndgrid(pts8,pts8);

subplot(2,3,5);
f8 = F8(x8,y8);
surf(x8,y8,f8), view(120, 20)
axis tight;


pts10 = (-3:6/50:3);
[x10,y10] = ndgrid(pts10,pts10);

subplot(2,3,6);
f10 = F10(x10,y10);
surf(x10,y10,f10), view(-45, 20)
axis tight;

figure;
pts12 = (-100:200/50:100);
[x12,y12] = ndgrid(pts12,pts12);
f12 = F12(x12,y12);
surf(x12,y12,f12)