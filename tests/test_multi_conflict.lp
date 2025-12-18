% Test multiple conflicts at the same time.
% Riggs the facts but lets the ASP create the schedule
% Expected output: Multiple conflicts of each type

room(r1).

capacity(r1, 30).      % Small room (used for capacity conflict)

timeslot(t1).
timeslot(t2).

group_size(g1, 20).
group_size(g2, 35).

% c1 deliberately mismatched: 1 expected, 2 instances exist
course(c1, 1).
course(c2, 1).
course(c3, 1).
% expects 1 instance but has 0
course(c4, 1).

instance(i1).
instance(i2).
instance(i3).
instance(i4).

% Only two instances for c1 
has_course(i1, c1).
has_course(i2, c1).
has_course(i3, c2).
has_course(i4, c3).

% teacher_a is double booked
taughtBy(i1, teacher_a).
taughtBy(i2, teacher_a).
taughtBy(i3, teacher_b).
taughtBy(i4, teacher_a).

% Capacity exceeded: g1 + g2 = 35 > 30
taughtTo(i1, g1).
taughtTo(i1, g2).
% Student group double booked: g3 attends two instances at same time
taughtTo(i2, g2).
taughtTo(i3, g2).
taughtTo(i4, g1).
