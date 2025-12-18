% Test for the "Classroom_Double_Booked" conflict.
% The conflict occurs when multiple different course instances are scheduled at the same time and in the same room.
% Includes a rigged schedule
% Expected output:
% conflict("Classroom_Double_Booked",r1,t1,i1)
% conflict("Classroom_Double_Booked",r1,t1,i2)
% conflict("Classroom_Double_Booked",r1,t2,i3)
% conflict("Classroom_Double_Booked",r1,t2,i4)
% conflict("Classroom_Double_Booked",r1,t2,i5)
% conflict("Classroom_Double_Booked",r1,t2,i6)

room(r1). capacity(r1, 1000).
room(r2). capacity(r2, 1000).

timeslot(t1).
timeslot(t2).

course(c1,2).
course(c2,2).
course(c3,1).
course(c4,1).

group_size(g1, 10).
group_size(g2, 10).
group_size(g3, 10).
group_size(g4, 10).

instance(i1).
instance(i2).
instance(i3).
instance(i4).
instance(i5).
instance(i6).

has_course(i1, c1).
has_course(i2, c2).
has_course(i3, c1).
has_course(i4, c2).
has_course(i5, c3).
has_course(i6, c4).

taughtBy(i1, teacher_a).
taughtBy(i2, teacher_b).
taughtBy(i3, teacher_a).
taughtBy(i4, teacher_b).
taughtBy(i5, teacher_c).
taughtBy(i6, teacher_d).

taughtTo(i1, g1).
taughtTo(i2, g2).
taughtTo(i1, g1).
taughtTo(i2, g2).
taughtTo(i1, g3).
taughtTo(i2, g4).

schedule(i1, r1, t1). % Classroom double booked
schedule(i2, r1, t1).

schedule(i3, r1, t2). % Classroom quadruple booked
schedule(i4, r1, t2).
schedule(i5, r1, t2).
schedule(i6, r1, t2).