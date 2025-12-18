% Test for the "Classroom_Double_Booked" conflict.
% The conflict occurs when multiple different course instances are scheduled at the same time and in the same room.
% Riggs the facts but lets the ASP create the schedule
% Expected output: conflict("Classroom_Double_Booked",r1,t1,i1), conflict("Classroom_Double_Booked",r1,t1,i2)

room(r1).

capacity(r1, 1000).

timeslot(t1).

course(c1,1). course(c2,1).

group_size(g1, 10).
group_size(g2, 10).

% Instances i1 and i2 are defined (two different instances)
instance(i1).
instance(i2).

has_course(i1, c1).
has_course(i2, c2).

taughtBy(i1, teacher_a).
taughtBy(i2, teacher_b).

taughtTo(i1, g1).
taughtTo(i2, g2).
