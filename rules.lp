1 { schedule(I, R, T) : room(R), timeslot(T) } 1 :-
    has_course(I, _).

room_overbooked(R, T) :-
    schedule(I1, R, T),
    schedule(I2, R, T),
    I1 < I2.

conflict("Classroom_Double_Booked", R, T, I) :-
    room_overbooked(R, T),
    schedule(I, R, T).

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

instance_size(I, TotalSize) :-
    has_course(I, _),
    TotalSize = #sum { Size, Group : taughtTo(I, Group), group_size(Group, Size) }.

conflict("Capacity_Exceeded", Room, T, I, TotalSize) :-
    schedule(I, Room, T),
    instance_size(I, TotalSize),
    capacity(Room, Cap),
    TotalSize > Cap.

scheduled_count(C, Count) :-
    Count = #count { I : schedule(I, _, _), has_course(I, C) },
    course(C, _).

conflict("Mismatched_Occurrences", C, Occ, Count) :-
    course(C, Occ),
    scheduled_count(C, Count),
    Count != Occ.

diff(C, D) :-
    course(C, Occ),
    scheduled_count(C, Count),
    D = |Occ - Count|,
    D > 0.

:~ conflict("Student_Group_Double_Booked", Group, T, I). [100@3, Group, T, I]
:~ conflict("Teacher_Double_Booked", Teacher, T, I). [100@3, Teacher, T, I]
:~ conflict("Classroom_Double_Booked", R, T, I). [100@3, R, T, I]
:~ conflict("Capacity_Exceeded", Room, T, I, Group). [100@2, Room, T, I, Group]
:~ diff(C, D). [100*D@1, C]

timetable(I, Course, Group, Teacher, Room, Time) :-
    schedule(I, Room, Time),
    has_course(I, Course),
    taughtTo(I, Group),
    taughtBy(I, Teacher).

#show timetable/6.
%#show schedule/3.
#show conflict/4.
#show conflict/5.
