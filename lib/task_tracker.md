{{PROBLEM}} Method Design Recipe

1. Describe the Problem

Put or write the user story here. Add any clarifying notes you might have.

As a user So that I can keep track of my tasks I want to check if a text includes the string #TODO.
2. Design the Method Signature

Include the name of the method, its parameters, return value, and side effects.

'''ruby includes_todo = task_tracker(text)

text will be a string.
includes_todo will be a boolean, which will return true if the parameter contains the required characters. '''
3. Create Examples as Tests

Make a list of examples of what the method will take and return.

'''ruby

#1 task_tracker('#TODO')

=> true

#2 task_tracker('')

=> false

#3 task_tracker('TODO')

=> false

#4 task_trcker('#todo')

=> false

#5 task_tracker('This is my #TODO list')

=> true

#6 task_tracker('This is my #T0D0 list')

=> false

'''

Encode each example as a test. Youo can add to the above list as you go.

4. Implement the Behaviour

After each test you write, follow the test-driving process of red, green, refactor to implement behaviour.