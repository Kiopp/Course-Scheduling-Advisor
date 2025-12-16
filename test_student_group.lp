room(r1). capacity(r1, 1000).
room(r2). capacity(r2, 1000).
timeslot(t1).

course(c1,1). course(c2,1).

group_size(g1, 10).

instance(i1). instance(i2).
has_course(i1, c1).
has_course(i2, c2).

% Different teachers to avoid teacher conflict
taughtBy(i1, teacher_a).
taughtBy(i2, teacher_b).

% Same student group
taughtTo(i1, g1).
taughtTo(i2, g1).

% Same timeslot, different rooms
schedule(i1, r1, t1).
schedule(i2, r2, t1).