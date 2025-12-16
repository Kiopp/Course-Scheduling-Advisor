room(r1). capacity(r1, 30).
timeslot(t1).

course(c1,1).

group_size(g1, 20).
group_size(g2, 15).  % total = 35 > 30

instance(i1).
has_course(i1, c1).

taughtBy(i1, teacher_a).
taughtTo(i1, g1).
taughtTo(i1, g2).

schedule(i1, r1, t1).