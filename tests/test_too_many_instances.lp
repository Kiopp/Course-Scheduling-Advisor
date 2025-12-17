% Test what happens when there are more instances than combinations of rooms and timeslots.
%
% Expected outcome:
% The scheduler will schedule all instances and point out the resulting conflicts.

room(r1). capacity(r1, 1000).
room(r2). capacity(r2, 1000).
timeslot(t1).

course(c1,1). course(c2,1). course(c3,1).

group_size(g1, 10).
group_size(g2, 10).
group_size(g3, 10).

instance(i1). instance(i2). instance(i3).
has_course(i1, c1).
has_course(i2, c2).
has_course(i3, c3).

taughtBy(i1, teacher_a).
taughtBy(i2, teacher_b).
taughtBy(i3, teacher_c).

taughtTo(i1, g1).
taughtTo(i2, g2).
taughtTo(i3, g3).