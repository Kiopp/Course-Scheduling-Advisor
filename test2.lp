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

class_size(a1, 10).
class_size(a2, 20).
class_size(a3, 5).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% INSTANCES (teaching sessions)
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
%%% Clean version (no forced overlaps)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

taughtBy(i1, teacher_john).
taughtBy(i2, teacher_mary).
taughtBy(i3, teacher_susan).

% English taught by different teachers to avoid conflicts
taughtBy(i4, teacher_sam).
taughtBy(i5, teacher_lisa).
taughtBy(i6, teacher_dan).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% INSTANCE → CLASS
%%% Clean version (no class overlaps)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

taughtTo(i1, a1).
taughtTo(i2, a1).

taughtTo(i3, a2).

taughtTo(i4, a3).
taughtTo(i5, a3).
taughtTo(i6, a3).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% NO manual schedules
%%% Allow Clingo to generate an optimal conflict-free schedule
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
