1 { schedule(I, R, T) : room(R), timeslot(T) } 1 :-
    has_course(I, _).

conflict("Classroom_Double_Booked", R, T, I1, I2) :-
    schedule(I1, R, T),
    schedule(I2, R, T),
    I1 < I2.

conflict("Teacher_Double_Booked", Teacher, T, I1, I2) :-
    schedule(I1, _, T),
    schedule(I2, _, T),
    I1 < I2,
    taughtBy(I1, Teacher),
    taughtBy(I2, Teacher).

conflict("Class_Double_Booked", Class, T, I1, I2) :-
    schedule(I1, _, T),
    schedule(I2, _, T),
    I1 < I2,
    taughtTo(I1, Class),
    taughtTo(I2, Class).

conflict("Capacity_Exceeded", Room, T, I) :-
    schedule(I, Room, T),
    taughtTo(I, Class),
    class_size(Class, Size),
    capacity(Room, Cap),
    Size > Cap.

scheduled_count(C, Count) :-
    Count = #count { I : schedule(I, _, _), has_course(I, C) },
    course(C, _).

conflict("Mismatched_Occurrences", C, Occ, Count) :-
    course(C, Occ),
    scheduled_count(C, Count),
    Count != Occ.

:~ conflict("Mismatched_Occurrences", C, _, _). [100@1, C]
:~ conflict(Type, _, _, _, _). [100@1, Type]

timetable(Course, Class, Teacher, Room, Time) :-
    schedule(I, Room, Time),
    has_course(I, Course),
    taughtTo(I, Class),
    taughtBy(I, Teacher).

#show timetable/5.
#show schedule/3.
#show conflict/4.
#show conflict/5.
