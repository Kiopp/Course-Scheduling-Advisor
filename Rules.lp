0 { schedule(I, R, T) : room(R), timeslot(T) } 1 :- instance(I).

conflict("Classroom_Double_Booked", R, T) :-
    schedule(I1, R, T),
    schedule(I2, R, T),
    I1 != I2.

conflict("Teacher_Double_Booked", Teacher, T) :-
    schedule(I1, _, T),
    schedule(I2, _, T),
    I1 != I2,
    taughtBy(I1, Teacher),
    taughtBy(I2, Teacher).

conflict("Class_Double_Booked", Class, T) :-
    schedule(I1, _, T),
    schedule(I2, _, T),
    I1 != I2,
    taughtTo(I1, Class),
    taughtTo(I2, Class).

conflict("Capacity_Exceeded", Room, I) :-
    schedule(I, Room, _),
    taughtTo(I, Class),
    class_size(Class, Size),
    capacity(Room, Cap),
    Size > Cap.

scheduled_count(C, Count) :- 
    Count = #count { I : schedule(I, _, _), has_course(I, C) }, 
    course(C, _).

conflict("Mismatched_Occurrences", Course, Required) :-
    course(Course, Required),
    scheduled_count(Course, Count),
    Required != Count.

:~ conflict(Type, Entity, Time). [100@1, Type]

#show schedule/3.
#show conflict/3.