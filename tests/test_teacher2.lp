% Test for the "Teacher_Double_Booked" conflict.
% The conflict occurs when a teacher is scheduled for multiple course instances at the same time.
% Includes a rigged schedule
% Expected output: 
% conflict("Teacher_Double_Booked",teacher_a,t1,i1)
% conflict("Teacher_Double_Booked",teacher_a,t1,i2)
% conflict("Teacher_Double_Booked",teacher_a,t2,i3)
% conflict("Teacher_Double_Booked",teacher_a,t2,i4)
% conflict("Teacher_Double_Booked",teacher_b,t2,i5)
% conflict("Teacher_Double_Booked",teacher_b,t2,i6)

room(r1).
room(r2).
room(r3).
room(r4).

capacity(r1, 1000).
capacity(r2, 1000).
capacity(r3, 1000).
capacity(r4, 1000).

timeslot(t1).
timeslot(t2).

course(c1,1).
course(c2,1).
course(c3,1).
course(c4,1).
course(c5,1).
course(c6,1).

group_size(g1, 10).
group_size(g2, 10).
group_size(g3, 10).
group_size(g4, 10).

instance(i1).
instance(i2).
instance(i3).
instance(i4).
instance(i5).
instance(i6).

has_course(i1, c1).
has_course(i2, c2).
has_course(i3, c3).
has_course(i4, c4).
has_course(i5, c5).
has_course(i6, c6).

taughtBy(i1, teacher_a).
taughtBy(i2, teacher_a).
taughtBy(i3, teacher_a).
taughtBy(i4, teacher_a).
taughtBy(i5, teacher_b).
taughtBy(i6, teacher_b).

taughtTo(i1, g1).
taughtTo(i2, g2).
taughtTo(i3, g1).
taughtTo(i4, g2).
taughtTo(i5, g3).
taughtTo(i6, g4).

schedule(i1, r1, t1).
schedule(i2, r2, t1).
schedule(i3, r1, t2).
schedule(i4, r2, t2).
schedule(i5, r3, t2).
schedule(i6, r4, t2).
