from rdflib import Graph, Namespace, RDF, RDFS

# Load KG
g = Graph()
g.parse("kg.ttl", format="turtle")

NS = Namespace("http://www.semanticweb.org/vencilo/ontologies/2025/11/School-Scheduler/")

def local_name(uri):
    return uri.split("#")[-1] if "#" in uri else uri.split("/")[-1]

PREFIXES = """@prefix : <http://www.semanticweb.org/vencilo/ontologies/2025/11/School-Scheduler/> .
@prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .
@prefix owl: <http://www.w3.org/2002/07/owl#> .
@prefix xsd: <http://www.w3.org/2001/XMLSchema#> .

"""

instance_counter = 1
ttl_lines = []

ttl_lines.append(PREFIXES)
ttl_lines.append("# ----------Course Instances----------\n")

for course in g.subjects(RDF.type, NS.Course):
    occ_literal = next(g.objects(course, NS.occurrencesPerWeek), None)
    if occ_literal is None:
        continue

    occ = int(occ_literal)

    teachers = list(g.objects(course, NS.taughtBy))
    groups = list(g.objects(course, NS.taughtTo))

    if not teachers:
        raise ValueError(f"Course {local_name(course)} has no teachers")

    if not groups:
        raise ValueError(f"Course {local_name(course)} has no student groups")

    for i in range(occ):
        inst_id = f"i{instance_counter}"

        assigned_teacher = teachers[i % len(teachers)]

        ttl_lines.append(
            f""":{inst_id} a :CourseInstance ;
    rdfs:label "Course Instance {instance_counter}" ;
    :taughtBy :{local_name(assigned_teacher)} ;
    :taughtTo {", ".join(f":{local_name(g)}" for g in groups)} .

"""
        )

        instance_counter += 1

with open("generated_instances.ttl", "w") as f:
    f.write("".join(ttl_lines))

print("Course instances generated in generated_instances.ttl")
