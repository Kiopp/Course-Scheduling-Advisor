% Each instance is scheduled and assigned exactly one room and one time slot.
1 { schedule(I, R, T) : room(R), timeslot(T) } 1 :-
    has_course(I, _).

% A room is over booked if at least two instances are scheduled in the same room at the same time.
room_overbooked(R, T) :-
    schedule(I1, R, T),
    schedule(I2, R, T),
    I1 < I2.

conflict("Classroom_Double_Booked", R, T, I) :-
    room_overbooked(R, T),
    schedule(I, R, T).

% A teacher is overbooked if they teach at least two different instances at the same time.
teacher_overbooked(Teacher, T) :-
    schedule(I1, _, T),
    schedule(I2, _, T),
    I1 < I2,
    taughtBy(I1, Teacher),
    taughtBy(I2, Teacher).

conflict("Teacher_Double_Booked", Teacher, T, I) :-
    teacher_overbooked(Teacher, T),
    schedule(I, _, T),
    taughtBy(I, Teacher).

% A student group is overbooked if they are assigned to at least two different instances at the same time.
group_overbooked(Group, T) :-
    schedule(I1, _, T),
    schedule(I2, _, T),
    I1 < I2,
    taughtTo(I1, Group),
    taughtTo(I2, Group).

conflict("Student_Group_Double_Booked", Group, T, I) :-
    group_overbooked(Group, T),
    schedule(I, _, T),
    taughtTo(I, Group).

% Calculates the total amount of students assigned to an instance.
instance_size(I, TotalSize) :-
    has_course(I, _),
    TotalSize = #sum { Size, Group : taughtTo(I, Group), group_size(Group, Size) }.

% Checks if the number of students are bigger than the classroom capacity.
conflict("Capacity_Exceeded", Room, T, I, TotalSize) :-
    schedule(I, Room, T),
    instance_size(I, TotalSize),
    capacity(Room, Cap),
    TotalSize > Cap.

% Checks if the number of scheduled instances matches the declared occurrences per week for each course.
scheduled_count(C, Count) :-
    Count = #count { I : schedule(I, _, _), has_course(I, C) },
    course(C, _).

conflict("Mismatched_Occurrences", C, Occ, Count) :-
    course(C, Occ),
    scheduled_count(C, Count),
    Count != Occ.

% Calculates absolute difference between expected and actual occurrences.
diff(C, D) :-
    course(C, Occ),
    scheduled_count(C, Count),
    D = |Occ - Count|,
    D > 0.

% Weak constraints with different priority.
:~ conflict("Student_Group_Double_Booked", Group, T, I). [100@3, Group, T, I]
:~ conflict("Teacher_Double_Booked", Teacher, T, I). [100@3, Teacher, T, I]
:~ conflict("Classroom_Double_Booked", R, T, I). [100@3, R, T, I]
:~ conflict("Capacity_Exceeded", Room, T, I, Group). [100@2, Room, T, I, Group]
:~ diff(C, D). [100*D@1, C]

% Easier to read timetable.
timetable(I, Course, Group, Teacher, Room, Time) :-
    schedule(I, Room, Time),
    has_course(I, Course),
    taughtTo(I, Group),
    taughtBy(I, Teacher).

% Output
#show timetable/6.
%#show schedule/3.
#show conflict/4.
#show conflict/5.
