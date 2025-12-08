%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% ROOMS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

room(r101).
room(r102).

capacity(r101, 20).
capacity(r102, 10).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% TIMESLOTS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

timeslot(t1).
timeslot(t2).
timeslot(t3).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% COURSES AND REQUIRED OCCURRENCES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

course(math, 2).
course(physics, 1).
course(english, 3).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% CLASSES (student groups) AND SIZES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

class_size(a1, 15).
class_size(a2, 25).
class_size(a3, 5).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% INSTANCES (specific teaching sessions)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

instance(i1).
instance(i2).
instance(i3).
instance(i4).
instance(i5).
instance(i6).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% INSTANCE → COURSE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

has_course(i1, math).
has_course(i2, math).
has_course(i3, physics).
has_course(i4, english).
has_course(i5, english).
has_course(i6, english).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% INSTANCE → TEACHER
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

taughtBy(i1, teacher_john).
taughtBy(i2, teacher_john).
taughtBy(i3, teacher_mary).
taughtBy(i4, teacher_sam).
taughtBy(i5, teacher_sam).
taughtBy(i6, teacher_sam).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% INSTANCE → CLASS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

taughtTo(i1, a1).
taughtTo(i2, a1).
taughtTo(i3, a2).
taughtTo(i4, a3).
taughtTo(i5, a3).
taughtTo(i6, a3).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% OPTIONAL: MANUALLY FIX SCHEDULE TO
%%% FORCE SPECIFIC CONFLICTS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% To trigger room double booking:
schedule(i1, r101, t1).
schedule(i2, r101, t1).

%%% Teacher double booking (John) also happens at t1.

%%% Class double booking (a1) also at t1.

%%% Physics in small room (capacity exceeded)
schedule(i3, r102, t2).

%%% English occurrences: 3 occurrences required (i4,i5,i6)
%%% Assign them in different slots:
schedule(i4, r101, t2).
schedule(i5, r101, t3).
%%% Leave i6 unscheduled → mismatched occurrence
