% Test for the "Capacity_Exceeded" conflict.
% The conflict occurs twice testing the conflict with multiple groups and singular groups.
% Includes a rigged schedule
% Expected output: conflict("Capacity_Exceeded",r1,t1,i1,35), conflict("Capacity_Exceeded",r1,t2,i2,45)

room(r1).

capacity(r1, 30).

timeslot(t1).
timeslot(t2).

course(c1, 2).

instance(i1).
instance(i2).

has_course(i1, c1).
has_course(i2, c1).

taughtBy(i1, teacher_a).
taughtBy(i2, teacher_a).

group_size(g1, 35). % Too big on its own
group_size(g2, 25). % Group 2 and 3 are too big together
group_size(g3, 20).

taughtTo(i1, g1).
taughtTo(i2, g2).
taughtTo(i2, g3).

schedule(i1, r1, t1).
schedule(i2, r1, t2).
