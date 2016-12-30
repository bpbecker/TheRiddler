 r←ScrabbleProblem n;matches;words;lens;seed;match
 ⍝ From the Scrabble problem described on
 ⍝ http://fivethirtyeight.com/features/this-challenge-will-boggle-your-mind/
 ⍝
 ⍝ n is the starting word length (2 in the case of article)
 ⍝ r is the list of maximum length words that can be built up as described in the problem
 ⍝
 ⍝ Download the list of words from:
 ⍝ https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/dotnetperls-controls/enable1.txt
 ⍝ I saved mine in c:\tmp\enable1.txt, change the first line of code to wherever you download yours

 words←⊃⎕NGET'c:\tmp\enable1.txt' 1     ⍝ get the list of words
 lens←≢¨words                           ⍝ and their lengths
 seed←words/⍨n=lens                     ⍝ seed the result with words of length n
 :Repeat
     match←words/⍨lens=n+1              ⍝ find all the words of length n+1
     match←match/⍨∨⌿(1 ¯1∘.↓match)∊seed ⍝ drop off the first and last letters and compare
     :If 0∊⍴match                       ⍝ don't have any matches?
         r←seed                         ⍝ we're done
         :Leave
     :Else
         seed←match                     ⍝ otherwise, use this list as the new seed
         n+←1                           ⍝ and try again
     :EndIf
 :EndRepeat
