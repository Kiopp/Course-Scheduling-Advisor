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
    print("1. From knowledge graph")
    print("2. Test case 1")

    choice = input("Enter your choice (1-2): ")

    if choice == "1":
        print("Selecting from kg...")
        generate_knowledge_graph()
        translate_facts_from_kg()
        return "facts.lp"
    elif choice == "2":
        print("Selecting test case 1...")
        return "test.lp"
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
        print("Grounding...")
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