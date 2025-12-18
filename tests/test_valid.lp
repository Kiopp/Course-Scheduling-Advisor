% Tests valid schedule.
% Facts with possible valid schedule solution
% Expected output: Valid schedule with no conflicts

room(r1).
room(r2).

capacity(r1, 50).
capacity(r2, 50).

timeslot(t1).
timeslot(t2).
timeslot(t3).

group_size(g1, 20).
group_size(g2, 25).
group_size(g3, 15).

course(c1, 1).
course(c2, 1).
course(c3, 1).

instance(i1).
instance(i2).
instance(i3).

has_course(i1, c1).
has_course(i2, c2).
has_course(i3, c3).

taughtBy(i1, teacher_a).
taughtBy(i2, teacher_b).
taughtBy(i3, teacher_c).

taughtTo(i1, g1).
taughtTo(i2, g2).
taughtTo(i3, g3).
