% Test for the "Mismatched_Occurrences" conflict.
% The conflict occurs when the course's defined number of occurrences and it's number of scheduled instances do not match.
% Includes a rigged schedule
% Expected output: conflict("Mismatched_Occurrences",c1,4,3), conflict("Mismatched_Occurrences",c2,1,3)

room(r1).
room(r2).

capacity(r1, 1000).
capacity(r2, 1000).

timeslot(t1).
timeslot(t2).
timeslot(t3).

% Course c1 is defined to have 4 occurrence
course(c1, 4).
% Course c1 is defined to have 1 occurrence
course(c2, 1).

group_size(g1, 10).
group_size(g2, 10).

% Only three instances exists for c1
instance(i1).
instance(i2).
instance(i3).
% Three instances exists for c2
instance(i4).
instance(i5).
instance(i6).

has_course(i1, c1).
has_course(i2, c1).
has_course(i3, c1).
has_course(i4, c2).
has_course(i5, c2).
has_course(i6, c2).

taughtBy(i1, teacher_a).
taughtBy(i2, teacher_a).
taughtBy(i3, teacher_a).
taughtBy(i4, teacher_b).
taughtBy(i5, teacher_b).
taughtBy(i6, teacher_b).

taughtTo(i1, g1).
taughtTo(i2, g1).
taughtTo(i3, g1).
taughtTo(i4, g2).
taughtTo(i5, g2).
taughtTo(i6, g2).

schedule(i1, r1, t1).
schedule(i2, r1, t2).
schedule(i3, r1, t3).
schedule(i4, r2, t1).
schedule(i5, r2, t2).
schedule(i6, r2, t3).
