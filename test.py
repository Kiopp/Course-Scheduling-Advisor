from rdflib import Graph, Namespace, Literal, RDF, RDFS, XSD

# --- Namespaces ---
NS = Namespace("http://www.semanticweb.org/vencilo/ontologies/2025/11/School-Scheduler/")

g = Graph()
g.bind("", NS)
g.bind("rdfs", RDFS)

# --- Configuration for automatic instance creation ---
courses = {
    "knowledge_representation_and_reasoning": {
        "label": "Knowledge Representation and Reasoning",
        "count": 3,
        "teacher": "marcus_gunnarsen",
        "student_group": "studentGroup_1",
    },
    "data_structures": {
        "label": "Data Structures",
        "count": 4,
        "teacher": "frans_jeppsson_wall",
        "student_group": "studentGroup_2",
    },
    "single_variable_calculus": {
        "label": "Single Variable Calculus",
        "count": 3,
        "teacher": "olle_olsson",
        "student_group": "studentGroup_3",
    },
    "statistics": {
        "label": "Statistics",
        "count": 2,
        "teacher": "benjamin_tennyson",
        "student_group": "studentGroup_4",
    },
    "international_marketing": {
        "label": "International Marketing",
        "count": 2,
        "teacher": "daniel_fenton",
        "student_group": "studentGroup_5",
    },
    "microeconomic_principles": {
        "label": "Microeconomic Principles",
        "count": 2,
        "teacher": "finn_campbell_mertens",
        "student_group": "studentGroup_3",
    },
    "phonetics": {
        "label": "Phonetics",
        "count": 2,
        "teacher": "henrik_rosenkvist",
        "student_group": "studentGroup_4",
    },
    "semantics": {
        "label": "Semantics",
        "count": 2,
        "teacher": "joakim_nivre",
        "student_group": "studentGroup_5",
    },
    "languages_of_the_world": {
        "label": "Languages of the World",
        "count": 4,
        "teacher": "viveka_adelsward",
        "student_group": "studentGroup_6",
    },
    "syntactic_theory": {
        "label": "Syntactic Theory",
        "count": 1,
        "teacher": "olle_olsson",
        "student_group": "studentGroup_1",
    }
}

# --- Generate instances automatically ---
instance_counter = 1
for course_id, info in courses.items():

    for _ in range(info["count"]):
        inst_uri = NS[f"i{instance_counter}"]

        # :iX a :CourseInstance
        g.add((inst_uri, RDF.type, NS.CourseInstance))

        # Label
        g.add((inst_uri, RDFS.label, Literal(f"Course Instance {instance_counter}")))

        # :taughtBy
        g.add((inst_uri, NS.taughtBy, NS[info["teacher"]]))

        # :taughtTo
        g.add((inst_uri, NS.taughtTo, NS[info["student_group"]]))

        # :hasCourse
        g.add((inst_uri, NS.hasCourse, NS[course_id]))

        instance_counter += 1


# --- Export TTL ---
g.serialize("generated_instances.ttl", format="turtle")
print("✔ generated_instances.ttl created successfully!")
