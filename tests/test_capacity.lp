% Test for the "Capacity_Exceeded" conflict.
% The conflict occurs when the total size of groups taught in a room exceeds the room's capacity.

% Room r1 is defined with a capaxity of 30.
room(r1). capacity(r1, 30).
timeslot(t1).

course(c1,1).

% The sum of the sizes of groups g1 and g2 is 35.
group_size(g1, 20).
group_size(g2, 15).  % total = 35 > 30

instance(i1).
has_course(i1, c1).

taughtBy(i1, teacher_a).
taughtTo(i1, g1).
taughtTo(i1, g2).

% Instance i1 (with groups g1 and g2) is scheduled in room r1.
schedule(i1, r1, t1).