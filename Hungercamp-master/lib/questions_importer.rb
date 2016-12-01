class QuestionsImporter
  def import
    Question.create(assignment_id: 1, question: 'Case statements are a great way to refactor if-else statements', answer: true, difficulty: 1)
    Question.create(assignment_id: 1, question: 'It is possible to get a input from a user through grabs.chomp', answer: false, difficulty: 2) 
    Question.create(assignment_id: 1, question: 'Using user_input.capitalize will allow for both conditions("shakil stop") and ("Shakil STOP!") to result in the same outcome', answer: false, difficulty: 3) 
    Question.create(assignment_id: 2, question: 'The answers to this question are booleans', answer: true, difficulty: 1)
    Question.create(assignment_id: 2, question: 'In ruby, only the value "false" and 0 are actually false', answer: false, difficulty: 2) 
    Question.create(assignment_id: 2, question: 'The answer to (((2+6) > 7) || ((5*5) <= 3)) is true', answer: true, difficulty: 3)
    Question.create(assignment_id: 3, question: '{} is common syntax for arrays', answer: false, difficulty: 1)
    Question.create(assignment_id: 3, question: 'The methods reduce and inject are both able to be used to calculate the sum of an array', answer: true, difficulty: 2) 
    Question.create(assignment_id: 3, question: 'In an array of 3 cities, if you were to type cities[0] and set it to a value, the number of elements in the array would increase to 4', answer: false, difficulty: 3) 
    Question.create(assignment_id: 4, question: 'A REPL takes user inputs, evaluates them and then returns the result to the user', answer: true, difficulty: 1)
    Question.create(assignment_id: 4, question: 'While pseudocode may lack values assigned to defined variable names, it still includes the proper indentation', answer: true, difficulty: 2) 
    Question.create(assignment_id: 4, question: '$ is for global variables, @ is for instance variables and @@ is for class variables', answer: true, difficulty: 3)
    Question.create(assignment_id: 5, question: 'The difference between puts and print is that print adds a newline to the end of the output', answer: false, difficulty: 1)
    Question.create(assignment_id: 5, question: 'The value in brackets in the method is called the parameter', answer: true, difficulty: 2) 
    Question.create(assignment_id: 5, question: 'A method can call another method in the same class', answer: true, difficulty: 3) 
    Question.create(assignment_id: 6, question: 'pp is an abbreviation for pretty print', answer: true, difficulty: 1)
    Question.create(assignment_id: 6, question: 'You can call on other files by requiring them', answer: true, difficulty: 2) 
    Question.create(assignment_id: 6, question: 'It is possible to convert a string into a symbol by calling .to_sym on it', answer: true, difficulty: 3)
    Question.create(assignment_id: 7, question: 'The name of a player could be one of the parameters for the initialize method', answer: true, difficulty: 1)
    Question.create(assignment_id: 7, question: 'Attr_accessor is not a method', answer: false, difficulty: 2) 
    Question.create(assignment_id: 7, question: 'pry is useful when you want to debug your program', answer: true, difficulty: 3) 
    Question.create(assignment_id: 8, question: '8 who are you 1', answer: true, difficulty: 1)
    Question.create(assignment_id: 8, question: '8 who are you 2', answer: true, difficulty: 2) 
    Question.create(assignment_id: 8, question: '8 who are you 3', answer: true, difficulty: 3) 
    Question.create(assignment_id: 9, question: '9 who are you 1', answer: true, difficulty: 1)
    Question.create(assignment_id: 9, question: '9 who are you 2', answer: true, difficulty: 2) 
    Question.create(assignment_id: 9, question: '9 who are you 3', answer: true, difficulty: 3) 
    Question.create(assignment_id: 10, question: '10 who are you 1', answer: true, difficulty: 1)
    Question.create(assignment_id: 10, question: '10 who are you 2', answer: true, difficulty: 2) 
    Question.create(assignment_id: 10, question: '10 who are you 3', answer: true, difficulty: 3)
    Question.create(assignment_id: 11, question: '11 who are you 1', answer: true, difficulty: 1)
    Question.create(assignment_id: 11, question: '11 who are you 2', answer: true, difficulty: 2) 
    Question.create(assignment_id: 11, question: '11 who are you 3', answer: true, difficulty: 3) 
    Question.create(assignment_id: 12, question: '12 who are you 1', answer: true, difficulty: 1)
    Question.create(assignment_id: 12, question: '12 who are you 2', answer: true, difficulty: 2) 
    Question.create(assignment_id: 12, question: '12 who are you 3', answer: true, difficulty: 3)
    Question.create(assignment_id: 13, question: '13 who are you 1', answer: true, difficulty: 1)
    Question.create(assignment_id: 13, question: '13 who are you 2', answer: true, difficulty: 2) 
    Question.create(assignment_id: 13, question: '13 who are you 3', answer: true, difficulty: 3) 
    Question.create(assignment_id: 14, question: '14 who are you 1', answer: true, difficulty: 1)
    Question.create(assignment_id: 14, question: '14 who are you 2', answer: true, difficulty: 2) 
    Question.create(assignment_id: 14, question: '14 who are you 3', answer: true, difficulty: 3)
    Question.create(assignment_id: 15, question: 'Custom errors inherit from the StandardError class', answer: true, difficulty: 1)
    Question.create(assignment_id: 15, question: 'Rescuing Exception will rescue every exception that inherits from Exception', answer: true, difficulty: 2) 
    Question.create(assignment_id: 15, question: 'SyntaxError and LoadError inherit from Exception', answer: true, difficulty: 3) 
    Question.create(assignment_id: 16, question: '16 who are you 1', answer: true, difficulty: 1)
    Question.create(assignment_id: 16, question: '16 who are you 2', answer: true, difficulty: 2) 
    Question.create(assignment_id: 16, question: '16 who are you 3', answer: true, difficulty: 3)
    Question.create(assignment_id: 17, question: '17 who are you 1', answer: true, difficulty: 1)
    Question.create(assignment_id: 17, question: '17 who are you 2', answer: true, difficulty: 2) 
    Question.create(assignment_id: 17, question: '17 who are you 3', answer: true, difficulty: 3) 
    Question.create(assignment_id: 18, question: '18 who are you 1', answer: true, difficulty: 1)
    Question.create(assignment_id: 18, question: '18 who are you 2', answer: true, difficulty: 2) 
    Question.create(assignment_id: 18, question: '18 who are you 3', answer: true, difficulty: 3)
    Question.create(assignment_id: 19, question: '19 who are you 1', answer: true, difficulty: 1)
    Question.create(assignment_id: 19, question: '19 who are you 2', answer: true, difficulty: 2) 
    Question.create(assignment_id: 19, question: '19 who are you 3', answer: true, difficulty: 3) 
    Question.create(assignment_id: 20, question: '20 who are you 1', answer: true, difficulty: 1)
    Question.create(assignment_id: 20, question: '20 who are you 2', answer: true, difficulty: 2) 
    Question.create(assignment_id: 20, question: '20 who are you 3', answer: true, difficulty: 3) 
    Question.create(assignment_id: 21, question: '21 who are you 1', answer: true, difficulty: 1)
    Question.create(assignment_id: 21, question: '21 who are you 2', answer: true, difficulty: 2) 
    Question.create(assignment_id: 21, question: '21 who are you 3', answer: true, difficulty: 3) 
    Question.create(assignment_id: 22, question: '22 who are you 1', answer: true, difficulty: 1)
    Question.create(assignment_id: 22, question: '22 who are you 2', answer: true, difficulty: 2) 
    Question.create(assignment_id: 22, question: '22 who are you 3', answer: true, difficulty: 3)
    Question.create(assignment_id: 23, question: '23 who are you 1', answer: true, difficulty: 1)
    Question.create(assignment_id: 23, question: '23 who are you 2', answer: true, difficulty: 2) 
    Question.create(assignment_id: 23, question: '23 who are you 3', answer: true, difficulty: 3) 
    Question.create(assignment_id: 24, question: '24 who are you 1', answer: true, difficulty: 1)
    Question.create(assignment_id: 24, question: '24 who are you 2', answer: true, difficulty: 2) 
    Question.create(assignment_id: 24, question: '24 who are you 3', answer: true, difficulty: 3)  
    Question.create(assignment_id: 25, question: '25 who are you 1', answer: true, difficulty: 1)
    Question.create(assignment_id: 25, question: '25 who are you 2', answer: true, difficulty: 2) 
    Question.create(assignment_id: 25, question: '25 who are you 3', answer: true, difficulty: 3) 
    Question.create(assignment_id: 26, question: '26 who are you 1', answer: true, difficulty: 1)
    Question.create(assignment_id: 26, question: '26 who are you 2', answer: true, difficulty: 2) 
    Question.create(assignment_id: 26, question: '26 who are you 3', answer: true, difficulty: 3) 
    Question.create(assignment_id: 27, question: '27 who are you 1', answer: true, difficulty: 1)
    Question.create(assignment_id: 27, question: '27 who are you 2', answer: true, difficulty: 2) 
    Question.create(assignment_id: 27, question: '27 who are you 3', answer: true, difficulty: 3) 
    Question.create(assignment_id: 28, question: '28 who are you 1', answer: true, difficulty: 1)
    Question.create(assignment_id: 28, question: '28 who are you 2', answer: true, difficulty: 2) 
    Question.create(assignment_id: 28, question: '28 who are you 3', answer: true, difficulty: 3)
    Question.create(assignment_id: 29, question: '29 who are you 1', answer: true, difficulty: 1)
    Question.create(assignment_id: 29, question: '29 who are you 2', answer: true, difficulty: 2) 
    Question.create(assignment_id: 29, question: '29 who are you 3', answer: true, difficulty: 3) 
    Question.create(assignment_id: 30, question: 'You can nest css selectors in scss files', answer: true, difficulty: 1)
    Question.create(assignment_id: 30, question: 'To implement the hover effect on the images, you can use img:hover{}, with the selectors in the {}', answer: true, difficulty: 2) 
    Question.create(assignment_id: 30, question: 'In the css box model, the closest layer to the content is the border', answer: false, difficulty: 3) 
    Question.create(assignment_id: 31, question: 'Tables can be linked with each other through one to many relationships', answer: true, difficulty: 1)
    Question.create(assignment_id: 31, question: 'In the music wall assignment, a user has many songs so the users table will have a song_id', answer: false, difficulty: 2) 
    Question.create(assignment_id: 31, question: 'Uniqueness, presence and numericality are all validations helpers', answer: true, difficulty: 3)   
  end
end