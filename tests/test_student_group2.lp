% Test for the "Student_Group_Double_Booked" conflict.
% The conflict occurs when a student group is scheduled for multiple course instances at the same time.
% Includes a rigged schedule
% Expected output:
% conflict("Student_Group_Double_Booked",g1,t1,i1)
% conflict("Student_Group_Double_Booked",g1,t1,i2)
% conflict("Student_Group_Double_Booked",g1,t2,i3)
% conflict("Student_Group_Double_Booked",g1,t2,i4)
% conflict("Student_Group_Double_Booked",g1,t2,i5)

room(r1).
room(r2).
room(r3).

capacity(r1, 1000).
capacity(r2, 1000).
capacity(r3, 1000).

timeslot(t1).
timeslot(t2).

course(c1,1).
course(c2,1).
course(c3,1).
course(c4,1).
course(c5,1).

group_size(g1, 10).

instance(i1).
instance(i2).
instance(i3).
instance(i4).
instance(i5).

has_course(i1, c1).
has_course(i2, c2).
has_course(i3, c3).
has_course(i4, c4).
has_course(i5, c5).

taughtBy(i1, teacher_a).
taughtBy(i2, teacher_b).
taughtBy(i3, teacher_a).
taughtBy(i4, teacher_b).
taughtBy(i5, teacher_c).

taughtTo(i1, g1).
taughtTo(i2, g1).
taughtTo(i3, g1).
taughtTo(i4, g1).
taughtTo(i5, g1).

schedule(i1, r1, t1).
schedule(i2, r2, t1).
schedule(i3, r1, t2).
schedule(i4, r2, t2).
schedule(i5, r3, t2).
