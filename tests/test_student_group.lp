% Test for the "Student_Group_Double_Booked" conflict.
% The conflict occurs when a student group is scheduled for multiple course instances at the same time.

room(r1). capacity(r1, 1000).
room(r2). capacity(r2, 1000).
timeslot(t1).

course(c1,1). course(c2,1).

group_size(g1, 10).

instance(i1). instance(i2).
has_course(i1, c1).
has_course(i2, c2).

taughtBy(i1, teacher_a).
taughtBy(i2, teacher_b).

% Both instances i1 and i2 are taught to the student group g1.
taughtTo(i1, g1).
taughtTo(i2, g1).

% Instances i1 and i2 (both including student group g1) are scheduled at the same time.
schedule(i1, r1, t1).
schedule(i2, r2, t1).