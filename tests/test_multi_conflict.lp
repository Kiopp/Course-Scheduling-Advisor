% Test multiple conflicts at the same time.
% Includes a rigged schedule
% Expected output: 
% conflict("Classroom_Double_Booked",r2,t1,i2)
% conflict("Classroom_Double_Booked",r2,t1,i3)
% conflict("Teacher_Double_Booked",teacher_a,t1,i1)
% conflict("Teacher_Double_Booked",teacher_a,t1,i2)
% conflict("Student_Group_Double_Booked",g3,t1,i2)
% conflict("Student_Group_Double_Booked",g3,t1,i3)
% conflict("Mismatched_Occurrences",c1,1,2)
% conflict("Mismatched_Occurrences",c4,1,0)
% conflict("Capacity_Exceeded",r1,t1,i1,35)

room(r1).
room(r2).

capacity(r1, 30).      % Small room (used for capacity conflict)
capacity(r2, 1000).    % Large room

timeslot(t1).
timeslot(t2).

group_size(g1, 20).
group_size(g2, 15).
group_size(g3, 10).

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
taughtBy(i4, teacher_c).

% Capacity exceeded: g1 + g2 = 35 > 30
taughtTo(i1, g1).
taughtTo(i1, g2).
% Student group double booked: g3 attends two instances at same time
taughtTo(i2, g3).
taughtTo(i3, g3).
taughtTo(i4, g1).

% Capacity_Exceeded + Teacher_Double_Booked
schedule(i1, r1, t1).
% Classroom_Double_Booked (same room & time)
schedule(i2, r2, t1).
schedule(i3, r2, t1).
schedule(i4, r2, t2).
