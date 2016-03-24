=========
STUDY BRO
=========

A simple tool I developed to help me study for my exams in college.
Based on values set within script itself representing problems in a textbook,
generates a random chapter, section & problem #, to help make studying for
a final exam easier by dynamically creating a practice test.
The problems returned are always ODD, allowing the user to
check their answers against the solutions in the back of the book.

Use: 
	-	calling ">perl StudyBro.pl" in the command line will return a
		random odd chapter, section & problem # such as "5.2, #7".
	-	calling with a whole-number argument such as
		">perl StudyBro.pl 5" will focus only on problems in the specified chapter.
	-	calling with a decimal representing chapter.section, such as
		">perl StudyBro.pl 5.6" will focus only on problems in the specified chapter
		AND section.

Please note the algorithm must be configured according to
the book in question by filling in the data in "USER SETUP" below.