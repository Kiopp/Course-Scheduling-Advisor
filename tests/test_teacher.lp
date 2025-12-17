% Test for the "Teacher_Double_Booked" conflict.
% The conflict occurs when a teacher is scheduled for multiple course instances at the same time.

room(r1). capacity(r1, 1000).
room(r2). capacity(r2, 1000).
timeslot(t1).

course(c1,1). course(c2,1).

group_size(g1, 10).
group_size(g2, 10).

instance(i1). instance(i2).
has_course(i1, c1).
has_course(i2, c2).

% Teacher teacher_a is assigned to both instances i1 and i2.
taughtBy(i1, teacher_a).
taughtBy(i2, teacher_a).

taughtTo(i1, g1).
taughtTo(i2, g2).

% Instances i1 and i2 (both taught by teacher teacher_a) are scheduled at the same time.
schedule(i1, r1, t1).
schedule(i2, r2, t1).