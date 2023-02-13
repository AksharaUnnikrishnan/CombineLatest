# CombineLatest
Implement a login validation form with 4 text fields and 1 button. Validation rules:  Name cannot be empty. Security code - any number that can be divided by 3. passwords - min 6 symbols and should match.  The button should be enabled when all conditions are true. The state should be updated on any character change.


Combine Latest 4:
A publisher that receives and combines the latest elements from four publishers.


Declarations:
 
 struct CombineLatest4<A, B, C, D> where 
 A : Publisher, B : Publisher, C : Publisher, D : Publisher, 
 A.Failure == B.Failure, B.Failure == C.Failure, C.Failure == D.Failure
 
 
Publishers.Map
A publisher that transforms all elements from the upstream publisher with a provided closure.

Declarations:
struct Map<Upstream, Output> where Upstream : Publisher
