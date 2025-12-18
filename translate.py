from rdflib import Graph, Namespace, RDF, RDFS, XSD

def translate_facts_from_kg():
    g = Graph()
    g.parse("kg.ttl", format="turtle")
    g.parse("generated_instances.ttl", format="turtle")
    
    NS = Namespace("http://www.semanticweb.org/vencilo/ontologies/2025/11/School-Scheduler/")
    
    def local_name(uri):
        """Return the fragment/local name of a URI."""
        return uri.split("#")[-1] if "#" in uri else uri.split("/")[-1]
    
    asp_lines = []
    
    for room in g.subjects(RDF.type, NS.Classroom):
        asp_lines.append(f"room({local_name(room)}).")
    
        for cap in g.objects(room, NS.capacity):
            asp_lines.append(f"capacity({local_name(room)}, {int(cap)}).")
    
    asp_lines.append("")
    
    for ts in g.subjects(RDF.type, NS.Timeslot):
        asp_lines.append(f"timeslot({local_name(ts)}).")
    
    asp_lines.append("")
    
    for course in g.subjects(RDF.type, NS.Course):
        occ = None
        for o in g.objects(course, NS.occurrencesPerWeek):
            occ = int(o)
        if occ is None:
            occ = 1
    
        asp_lines.append(f"course({local_name(course)}, {occ}).")
    
    asp_lines.append("")
    
    for sg in g.subjects(RDF.type, NS.StudentGroup):
        size = None
        for s in g.objects(sg, NS.size):
            size = int(s)
    
        if size is None:
            size = 1
    
        asp_lines.append(f"group_size({local_name(sg)}, {size}).")
    
    asp_lines.append("")
    
    for inst in g.subjects(RDF.type, NS.CourseInstance):
        asp_lines.append(f"instance({local_name(inst)}).")
    
    asp_lines.append("")
    
    for course in g.subjects(RDF.type, NS.Course):
        for inst in g.objects(course, NS.hasCourseInstance):
            asp_lines.append(f"has_course({local_name(inst)}, {local_name(course)}).")
    
    asp_lines.append("")
    
    for inst in g.subjects(RDF.type, NS.CourseInstance):
        for teacher in g.objects(inst, NS.taughtBy):
            asp_lines.append(f"taughtBy({local_name(inst)}, {local_name(teacher)}).")
    
    asp_lines.append("")
    
    for inst in g.subjects(RDF.type, NS.CourseInstance):
        for group in g.objects(inst, NS.taughtTo):
            asp_lines.append(f"taughtTo({local_name(inst)}, {local_name(group)}).")
    
    asp_lines.append("")
    
    for inst in g.subjects(RDF.type, NS.CourseInstance):
        for room in g.objects(inst, NS.taughtIn):
            asp_lines.append(f"taughtIn({local_name(inst)}, {local_name(room)}).")
    
    asp_lines.append("")
    
    for inst in g.subjects(RDF.type, NS.CourseInstance):
        for ts in g.objects(inst, NS.scheduledAt):
            asp_lines.append(f"scheduledAt({local_name(inst)}, {local_name(ts)}).")
    
    asp_lines.append("")
    
    output = "\n".join(asp_lines)
    
    with open("facts.lp", "w") as f:
        f.write(output)
    
    print("ASP translation complete! Output written to facts.lp")
    