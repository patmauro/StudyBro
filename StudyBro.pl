#!/usr/bin/perl

#	=========
#	STUDY BRO
#	=========
#
#	A simple tool I developed to help me study for my exams in college.
#	Based on values set within script itself representing problems in a textbook,
#	generates a random chapter, section & problem #, to help make studying for
#	a final exam easier by dynamically creating a practice test.
#	The problems returned are always ODD, allowing the user to
#	check their answers against the solutions in the back of the book.
#
#	Use: 
#		-	calling ">perl StudyBro.pl" in the command line will return a
#			random odd chapter, section & problem # such as "5.2, #7".
#		-	calling with a whole-number argument such as
#			">perl StudyBro.pl 5" will focus only on problems in the specified chapter.
#		-	calling with a decimal representing chapter.section, such as
#			">perl StudyBro.pl 5.6" will focus only on problems in the specified chapter
#			AND section.
#
#	Please note the algorithm must be configured according to
#	the book in question by filling in the data in "USER SETUP" below.
#


use strict; ## request conservative error checking
use warnings; 
use POSIX; #package that contains floor() function


#	USER SETUP --------------------------------------------------------------------

# the following must all be set up manually by the user
# to cater to their book and/or study habits.

# CHAP/SECTION ARRAYS
# Textbooks usually don't always have the same number of sections in each chapter.
# Here we specify how many sections are in each chapter by creating an array
# that lists how many sections are in each corresponding chapter.
# For example, if Ch.1 & 2 have 9 sections, chapters 3, 5 & 6 have 3 sections,
# and chapter 4 has 6 sections, we'd put (9, 9, 3, 6, 3, 3).
my @sectionsPerChap = (9, 9, 3, 6, 3, 3);

# Optional -
# want to focus on a GROUP of chapters specifically?
# if so, set $isChapGroup to "1" and then specify the
# group below (in this example, 4, 5 and 6).
my $isChapGroup = 0;
my @chapGroup = (4, 5, 6);

# Input the number of problems in each section.
# Use a rough estimate if necessary.
# In this example, my book used 40 questions in each section.
my $probrange = 40;

#	-------------------------------------------------------------------------------


# Instantiate other values
my $isSpecialChap = 0;
my $isSpecialSect = 0;
my $usrIn = 0;
my $chap = 0;
my $sect = 0;
my $prob = 0;


#	BEGIN ALGORITHM PROCESS
#	-----------------------

# 	I - GENERATE CHAPTER

# Case if user requests a specific chapter
if(scalar @ARGV){

	$usrIn = shift @ARGV;
	$isSpecialChap = 1;

	#If user has given a whole # int then they have NOT specified a section.
	if($usrIn == floor($usrIn)){
		$chap = $usrIn;
	}
	#User has specified a section. Set chap to floor(usrin) and sect to the decimal.
	else{
		$chap = floor($usrIn);
		$sect = ($usrIn - $chap);
		$isSpecialSect = 1;
		}		
}

# If isSpecialChap is 0 (false) then we will run regularly. Assign Chap value.
if($isSpecialChap == 0){
	if($isChapGroup == 0){
		$chap = int(rand(scalar(@sectionsPerChap))) + 1;
	}
	else {
		$chap = $chapGroup[rand @chapGroup];
	}
}


# 	II - GENERATE SECTION

# If a special section has already been specified, 
# reformat value and move on 
if($isSpecialSect == 1){
	$sect = $sect * 10;
	if($sect < 1){$sect = 1;}
}

# Normal function - Now grab a section based on the chapter arrays specified earlier
else {
	$sect = int(rand($sectionsPerChap[($chap - 1)])) + 1;
}

# 	III - GENERATE PROBLEM

#Chooses a problem between 1-$probrange
$prob = int(rand(($probrange - 1))) +1;

#Makes problem odd for ease of checking
if ($prob%2==0) {
$prob--;
}

#	IV - RETURN CHAPTER, SECTION & PROBLEM

#Prints out the problem as "Chat.Sect, #Prob "
print "$chap.$sect, #$prob \n";

#end of code
