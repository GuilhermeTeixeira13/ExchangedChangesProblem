# ExchangedChangesProblem

How ot use:
  After download the files, put them in the same folder and just execute "./tp3" in the CLI.
----------------------
In this Ocaml exercise, we will exemplify the differences between dynamic programming and greedy algorihms.
To do so, let us look at the classic change problem in several monetary systems, some of them esoteric.
----------------------
* Problem *
  We assume here that we have enough coins or notes and that the monetary system considered allows for the return of any change. To give 32 euros change with the smallest number of coins, just choose the maximum number of coins with the highest value below the amount to be returned (32) whose sum does not exceed this amount. Here it is a 20 euro bill. Remaining 12 euros to return. We apply the same recipe with a value of 12 and it results in a 10 euro note and, finally, with the remaining two euros, a 2 euro coin. The process followed here is a classic greedy algorithm. It always works on the Euro monetary system. But not all existing or existing monetary systems share this benefit. 
  Let's look at the system in which there are 1, 3 and 4 coins. If we have to return change for the value 6, the method described above chooses three coins: one coin of 4 and two coins of 1. But with two coins of 3 we would have the change returned with one less coin. 
  It is possible to design a solution by dynamic programming that always finds the best way to give change in any monetary system. 
  And is the confrontation between these two methods that we will show here in this exercise.
  Given the ordered list of coins in a monetary system, your task is to give an indication of whether in this monetary system the solution to the problem of change by greedy algorithm is coincident with the algorithm by dynamic program. If it is identical, the answer must be YES. If not, then it must return the smallest quantity that exhibits a different behavior in the two solutions. For example, in system 1, 3 and 4, the smallest value where the two solutions disagree is precisely the value 6 that we mentioned above. 
----------------------  
* Input *
  In the first line there is an integer indicating how many coins make up the considered system. In the following lines there is an integer representing the numerical value of each of the coins of the considered monetary system. These coins are presented in ascending order and are all different. 
----------------------  
* Output *
   -> A line with the word YES if the monetary system in question allows the greedy algorithm to agree with the solution by dynamic programming; 
   -> An integer p which is the lowest amount for which the change calculated by the two algorithms is discordant.
----------------------  
* Limits * 
  0 < n ≤ 100, and the coins do not exceed the value 500 
----------------------  
* Input Example * 
3
1
3
4
----------------------
* Output example * 
6
