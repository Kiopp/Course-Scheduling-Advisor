from translate import translate_facts_from_kg

# Initial value
selected_file = ""

#
def select_instance():
    print("--- Welcome to the course scheduler! ---")
    print("1. From knowledge graph")
    print("2. Test case 1")

    choice = input("Enter your choice (1-2): ")

    if choice == "1":
        print("Selecting from kg...")
        translate_facts_from_kg()
        return "facts.lp"
    elif choice == "2":
        print("Selecting test case 1...")
        return "test.lp"
    else:
        return ""

# Keep going if input is invalid
while selected_file == "":
    selected_file = select_instance()
    if selected_file == "":
        print("Invalid input, please try again...\n")
print(selected_file)