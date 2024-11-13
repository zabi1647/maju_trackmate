const StudentDataString = '''
 {
  "student_info": {
    "registration_number": "SP21-BSSE-0330",
    "student_name": "Jennifer John",
    "father_name": "Harvard Norbut John",
    "program": "BS(SE)",
    "date_of_birth": "15-02-1999",
    "date": "Nov 3, 2024"
  },
  "semesters": [
    {
      "semester_no": "1",
      "semester": "Spring",
      "year": "2021",
      "courses": [
        { "code": "CS1210", "title": "Introduction to Computing", "credit_hours": 3, "grade": "B" },
        { "code": "CS1211", "title": "Introduction to Computing Lab", "credit_hours": 1, "grade": "A" },
        { "code": "CS1410", "title": "Computer Programming", "credit_hours": 3, "grade": "A-" },
        { "code": "CS1411", "title": "Computer Programming Lab", "credit_hours": 1, "grade": "A" },
        { "code": "MG1100", "title": "Principles of Management", "credit_hours": 3, "grade": "A-" },
        { "code": "SS1101", "title": "Freshman English", "credit_hours": 3, "grade": "A-" },
        { "code": "SS1410", "title": "Ethics", "credit_hours": 3, "grade": "B+" }
      ],
      "gpa": 3.08
    },
    {
      "semester_no": "2",
      "semester": "Fall",
      "year": "2021",
      "courses": [
        { "code": "CS1420", "title": "Object Oriented Programming", "credit_hours": 3, "grade": "B" },
        { "code": "CS1421", "title": "Object Oriented Programming Lab", "credit_hours": 1, "grade": "A" },
        { "code": "CS1212", "title": "Discrete Structures", "credit_hours": 3, "grade": "A" },
        { "code": "MT1410", "title": "Calculus and Analytical Geometry", "credit_hours": 3, "grade": "A-" },
        { "code": "NS1240", "title": "Applied Physics", "credit_hours": 3, "grade": "A-" },
        { "code": "SS2120", "title": "Oral Communication", "credit_hours": 3, "grade": "A" }
      ],
      "gpa": 3.75
    },
    {
      "semester_no": "3",
      "semester": "Spring",
      "year": "2022",
      "courses": [
        { "code": "CS2110", "title": "Data Structures and Algorithms", "credit_hours": 3, "grade": "A" },
        { "code": "CS2111", "title": "Data Structures and Algorithms Lab", "credit_hours": 1, "grade": "A" },
        { "code": "CS3210", "title": "Software Engineering", "credit_hours": 3, "grade": "A-" },
        { "code": "CS3211", "title": "Software Engineering Lab", "credit_hours": 1, "grade": "A" },
        { "code": "MT2300", "title": "Linear Algebra", "credit_hours": 3, "grade": "A" },
        { "code": "MT2300", "title": "Probability and Statistics", "credit_hours": 3, "grade": "A-" },
        { "code": "SS2130", "title": "Principles of Sociology", "credit_hours": 3, "grade": "B+" }
      ],
      "gpa": 3.65
    },
    {
      "semester_no": "4",
      "semester": "Fall",
      "year": "2022",
      "courses": [
        { "code": "CS2730", "title": "Database Management Systems", "credit_hours": 3, "grade": "A" },
        { "code": "CS2731", "title": "Database Management Systems Lab", "credit_hours": 1, "grade": "A" },
        { "code": "CS3110", "title": "Software Engineering Lab", "credit_hours": 1, "grade": "A" },
        { "code": "CS3170", "title": "Software Requirement Engineering", "credit_hours": 3, "grade": "A" },
        { "code": "CS3130", "title": "Business Process Engineering", "credit_hours": 3, "grade": "A-" },
        { "code": "CS3140", "title": "Software Construction and Development", "credit_hours": 3, "grade": "A" },
        { "code": "MG3430", "title": "Organizational Behavior", "credit_hours": 3, "grade": "D" }
      ],
      "gpa": 3.80
    }
  ],
  "summary": {
    "credits_earned": 118,
    "cgpa": 3.60
  }
}

  ''';
