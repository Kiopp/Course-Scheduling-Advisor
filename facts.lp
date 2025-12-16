room(room_a).
capacity(room_a, 30).
room(room_b).
capacity(room_b, 50).
room(room_c).
capacity(room_c, 20).
room(room_d).
capacity(room_d, 40).
room(room_e).
capacity(room_e, 80).

timeslot(ts_mon_08_10).
timeslot(ts_mon_10_12).
timeslot(ts_mon_13_15).
timeslot(ts_mon_15_17).
timeslot(ts_tue_08_10).
timeslot(ts_tue_10_12).
timeslot(ts_tue_13_15).
timeslot(ts_tue_15_17).
timeslot(ts_wed_08_10).
timeslot(ts_wed_10_12).
timeslot(ts_wed_13_15).
timeslot(ts_wed_15_17).
timeslot(ts_thu_08_10).
timeslot(ts_thu_10_12).
timeslot(ts_thu_13_15).
timeslot(ts_thu_15_17).
timeslot(ts_fri_08_10).
timeslot(ts_fri_10_12).
timeslot(ts_fri_13_15).
timeslot(ts_fri_15_17).

course(knowledge_representation_and_reasoning, 3).
course(data_structures, 4).
course(single_variable_calculus, 3).
course(statistics, 2).
course(international_marketing, 2).
course(microeconomic_principles, 2).
course(phonetics, 2).
course(semantics, 2).
course(languages_of_the_world, 4).
course(syntactic_theory, 1).

group_size(studentGroup_1, 25).
group_size(studentGroup_2, 30).
group_size(studentGroup_3, 33).
group_size(studentGroup_4, 28).
group_size(studentGroup_5, 35).
group_size(studentGroup_6, 22).

instance(i1).
instance(i2).
instance(i3).
instance(i4).
instance(i5).
instance(i6).
instance(i7).
instance(i8).
instance(i9).
instance(i10).
instance(i11).
instance(i12).
instance(i13).
instance(i14).
instance(i15).
instance(i16).
instance(i17).
instance(i18).
instance(i19).
instance(i20).
instance(i21).
instance(i22).
instance(i23).
instance(i24).
instance(i25).

has_course(i1, knowledge_representation_and_reasoning).
has_course(i2, knowledge_representation_and_reasoning).
has_course(i3, knowledge_representation_and_reasoning).
has_course(i4, data_structures).
has_course(i5, data_structures).
has_course(i6, data_structures).
has_course(i7, data_structures).
has_course(i8, single_variable_calculus).
has_course(i9, single_variable_calculus).
has_course(i10, single_variable_calculus).
has_course(i11, statistics).
has_course(i12, statistics).
has_course(i13, international_marketing).
has_course(i14, international_marketing).
has_course(i15, microeconomic_principles).
has_course(i16, microeconomic_principles).
has_course(i17, phonetics).
has_course(i18, phonetics).
has_course(i19, semantics).
has_course(i20, semantics).
has_course(i21, languages_of_the_world).
has_course(i22, languages_of_the_world).
has_course(i23, languages_of_the_world).
has_course(i24, languages_of_the_world).
has_course(i25, syntactic_theory).

taughtBy(i1, marcus_gunnarsen).
taughtBy(i2, frans_jeppsson_wall).
taughtBy(i3, marcus_gunnarsen).
taughtBy(i4, frans_jeppsson_wall).
taughtBy(i5, olle_olsson).
taughtBy(i6, frans_jeppsson_wall).
taughtBy(i7, olle_olsson).
taughtBy(i8, olle_olsson).
taughtBy(i9, olle_olsson).
taughtBy(i10, olle_olsson).
taughtBy(i11, benjamin_tennyson).
taughtBy(i12, benjamin_tennyson).
taughtBy(i13, daniel_fenton).
taughtBy(i14, daniel_fenton).
taughtBy(i15, finn_campbell_mertens).
taughtBy(i16, finn_campbell_mertens).
taughtBy(i17, henrik_rosenkvist).
taughtBy(i18, henrik_rosenkvist).
taughtBy(i19, joakim_nivre).
taughtBy(i20, joakim_nivre).
taughtBy(i21, viveka_adelsward).
taughtBy(i22, viveka_adelsward).
taughtBy(i23, viveka_adelsward).
taughtBy(i24, viveka_adelsward).
taughtBy(i25, olle_olsson).

taughtTo(i1, studentGroup_1).
taughtTo(i1, studentGroup_6).
taughtTo(i2, studentGroup_1).
taughtTo(i2, studentGroup_6).
taughtTo(i3, studentGroup_1).
taughtTo(i3, studentGroup_6).
taughtTo(i4, studentGroup_2).
taughtTo(i5, studentGroup_2).
taughtTo(i6, studentGroup_2).
taughtTo(i7, studentGroup_2).
taughtTo(i8, studentGroup_3).
taughtTo(i9, studentGroup_3).
taughtTo(i10, studentGroup_3).
taughtTo(i11, studentGroup_4).
taughtTo(i12, studentGroup_4).
taughtTo(i13, studentGroup_5).
taughtTo(i14, studentGroup_5).
taughtTo(i15, studentGroup_6).
taughtTo(i16, studentGroup_6).
taughtTo(i17, studentGroup_1).
taughtTo(i18, studentGroup_1).
taughtTo(i19, studentGroup_2).
taughtTo(i20, studentGroup_2).
taughtTo(i21, studentGroup_3).
taughtTo(i22, studentGroup_3).
taughtTo(i23, studentGroup_3).
taughtTo(i24, studentGroup_3).
taughtTo(i25, studentGroup_4).


