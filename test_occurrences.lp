room(r1). capacity(r1, 1000).
timeslot(t1). timeslot(t2).

% Says the course should occur once...
course(c1, 1).

group_size(g1, 10).

instance(i1). instance(i2).
% ...but we have two instances of it
has_course(i1, c1).
has_course(i2, c1).

taughtBy(i1, teacher_a).
taughtBy(i2, teacher_b).

taughtTo(i1, g1).
taughtTo(i2, g1).

% Schedule them so both get counted
schedule(i1, r1, t1).
schedule(i2, r1, t2).