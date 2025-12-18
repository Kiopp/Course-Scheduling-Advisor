% Test for the "Mismatched_Occurrences" conflict.
% The conflict occurs when the course's defined number of occurrences and it's number of scheduled instances do not match.
% Riggs the facts but lets the ASP create the schedule
% Expected output: conflict("Mismatched_Occurrences",c1,5,2)

room(r1).

capacity(r1, 1000).

timeslot(t1).
timeslot(t2).

% Course c1 is defined to have 5 occurrence
course(c1, 5).

group_size(g1, 10).

% Only two instances exists
instance(i1).
instance(i2).

has_course(i1, c1).
has_course(i2, c1).

taughtBy(i1, teacher_a).
taughtBy(i2, teacher_b).

taughtTo(i1, g1).
taughtTo(i2, g1).
