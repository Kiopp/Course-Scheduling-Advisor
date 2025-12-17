def selectInstance():
    print("--- Welcome to the course scheduler! ---")
    print("1. Instance 1: JU")
    print("2. Instance 2: KTH")

    choice = input("Enter your choice (1-2): ")

    if choice == "1":
        print("Selecting JU instance...")
    elif choice == "2":
        print("Selecting KTH instance...")
    else:
        print("You stupid mf.")

selectInstance()