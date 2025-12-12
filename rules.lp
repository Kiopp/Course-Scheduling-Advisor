Occurrences { chosen_instance(I, C) : has_course(I, C) } Occurrences :- 
    course(C, Occurrences).

1 { schedule(I, R, T) : room(R), timeslot(T) } 1 :- 
    chosen_instance(I, _).


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

conflict("Mismatched_Occurrences", Course, Occurrences) :-
    course(Course, Occurrences),
    scheduled_count(Course, Count),
    Occurrences != Count.

:~ conflict("Mismatched_Occurrences", Course, Occurrences). [100@1, Course]

:~ conflict(Type, Entity, Time). [100@1, Type]

#show schedule/3.
#show conflict/3.