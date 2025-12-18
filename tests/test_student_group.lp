% Test for the "Student_Group_Double_Booked" conflict.
% The conflict occurs when a student group is scheduled for multiple course instances at the same time.
% Riggs the facts but lets the ASP create the schedule
% Expected output: conflict("Student_Group_Double_Booked",g1,t1,i1), conflict("Student_Group_Double_Booked",g1,t1,i2)

room(r1).
room(r2).

capacity(r1, 1000).
capacity(r2, 1000).

timeslot(t1).

course(c1,1).
course(c2,1).

group_size(g1, 10).

instance(i1).
instance(i2).

has_course(i1, c1).
has_course(i2, c2).

taughtBy(i1, teacher_a).
taughtBy(i2, teacher_b).

% Both instances i1 and i2 are taught to the student group g1.
taughtTo(i1, g1).
taughtTo(i2, g1).
