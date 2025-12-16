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

# WRITE PREFIXES FIRST
ttl_lines.append(PREFIXES)
ttl_lines.append("# ----------Course Instances----------\n")

for course in g.subjects(RDF.type, NS.Course):
    occ = next(g.objects(course, NS.occurrencesPerWeek), None)
    if occ is None:
        continue

    occ = int(occ)

    teacher = next(g.objects(course, NS.taughtBy), None)
    group = next(g.objects(course, NS.taughtTo), None)

    if teacher is None or group is None:
        raise ValueError(f"Course {local_name(course)} missing taughtBy or taughtTo")

    for _ in range(occ):
        inst_id = f"i{instance_counter}"

        ttl_lines.append(
            f""":{inst_id} a :CourseInstance ;
    rdfs:label "Course Instance {instance_counter}" ;
    :taughtBy :{local_name(teacher)} ;
    :taughtTo :{local_name(group)} .

"""
        )

        instance_counter += 1

# Write output
with open("generated_instances.ttl", "w") as f:
    f.write("".join(ttl_lines))

print("Course instances generated in generated_instances.ttl")
