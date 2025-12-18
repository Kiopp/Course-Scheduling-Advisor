# Course-Scheduling-Advisor
A course scheduling advisor utilizing an ontology, knowledge graph and answer-set programming.

## How to use
1. Create a python virtual environment:
```
python -m venv venv
```
2. Enter the virtual environment:
```
source venv/bin/activate
```
3. Install required libraries:
```
pip install -r requirements.txt
```
4. Run main.py:
```
python main.py
```
5. Pick an option by typing in a number and hit enter. This option determines what facts will be loaded into the solver. To run using the knowledge graph pick option 1, the rest are for test cases.
6. The solver will run automatically, and the resulting schedule can be found in schedule.txt. If no optimal schedule is found, the conflicts can be found in there as well.
