from translate import translate_facts_from_kg
from instance_generator import generate_knowledge_graph
import clingo

def main():
    # Initial value
    selected_file = ""
    
    # Keep going if input is invalid
    while selected_file == "":
        selected_file = select_instance()
        if selected_file == "":
            print("Invalid input, please try again...\n")

    solve(facts_filename=selected_file)

# Menu system
def select_instance():
    print("--- Welcome to the course scheduler! ---")
    print("Please select a dataset to use")
    print("1. From knowledge graph")
    print("2. Capacity 1")
    print("3. Capacity 2")
    print("4. Classroom 1")
    print("5. Classroom 2")
    print("6. Multi-conflict 1")
    print("7. Multi-conflict 2")
    print("8. Occurrences 1")
    print("9. Occurrences 2")
    print("10. Student group 1")
    print("11. Student group 2")
    print("12. Teacher 1")
    print("13. Teacher 2")
    print("14. Valid 1")
    print("15. Valid 2")

    choice = input("Enter your choice (1-15): ")

    if choice == "1":
        print("Selecting instance from knowledge graph...")
        generate_knowledge_graph()
        translate_facts_from_kg()
        return "facts.lp"
    elif choice == "2":
        print("Selecting test_capacity...")
        return "tests/test_capacity.lp"
    elif choice == "3":
        print("Selecting test_capacity2...")
        return "tests/test_capacity2.lp"
    elif choice == "4":
        print("Selecting test_classroom...")
        return "tests/test_classroom.lp"
    elif choice == "5":
        print("Selecting test_classroom2...")
        return "tests/test_classroom2.lp"
    elif choice == "6":
        print("Selecting test_multi_conflict...")
        return "tests/test_multi_conflict.lp"
    elif choice == "7":
        print("Selecting test_multi_conflict2...")
        return "tests/test_multi_conflict2.lp"
    elif choice == "8":
        print("Selecting test_occurrences...")
        return "tests/test_occurrences.lp"
    elif choice == "9":
        print("Selecting test_occurrences2...")
        return "tests/test_occurrences2.lp"
    elif choice == "10":
        print("Selecting test_student_group...")
        return "tests/test_student_group.lp"
    elif choice == "11":
        print("Selecting test_student_group2...")
        return "tests/test_student_group2.lp"
    elif choice == "12":
        print("Selecting test_teacher...")
        return "tests/test_teacher.lp"
    elif choice == "13":
        print("Selecting test_teacher2...")
        return "tests/test_teacher2.lp"
    elif choice == "14":
        print("Selecting test_valid...")
        return "tests/test_valid.lp"
    elif choice == "15":
        print("Selecting test_valid2...")
        return "tests/test_valid2.lp"
    else:
        return ""

def solve(facts_filename, output_filename="schedule.txt"):
    # Create Control object
    ctl = clingo.Control(["0"])

    try:
        # Load the rules and the selected fact file
        print(f"Loading rules.lp and {facts_filename}...")
        ctl.load("rules.lp")
        ctl.load(facts_filename)

        # Store the optimal answer set
        optimal_predicates = None
        optimal_cost = None

        # Ground the logic program
        ctl.ground([("base", [])])

        # Run solver
        with ctl.solve(yield_=True) as handle:
            for model in handle:
                optimal_symbols = model.symbols(shown=True)
                optimal_cost = model.cost
            
            # Check if we found a solution at all
            mode_result = handle.get()
            
            with open(output_filename, "w") as f:
                if optimal_symbols:
                    f.write("--- SOLUTION ---\n")
                    
                    # Write the Cost
                    is_optimal = True
                    for cost in optimal_cost:
                        if cost != 0:
                            is_optimal = False

                    f.write(f"Optimization Value (Cost): {optimal_cost}\n")

                    if is_optimal:
                        f.write(f"Valid schedule found!\n\n")
                    else:
                        f.write(f"No valid schedule found! See conflicts...\n\n")
                    
                    # Write the Solution
                    f.write("Solution:\n")
                    for atom in optimal_symbols:
                        f.write(f"{atom}\n")
                    
                    print(f"Solution written to {output_filename} with cost {optimal_cost}.")
                else:
                    f.write("UNSATISFIABLE\n")
                    print("Problem is UNSATISFIABLE.")

    except RuntimeError as e:
        print(f"Clingo Error: {e}")
    except FileNotFoundError as e:
        print(f"File Error: {e}")

main()