Implement aspects and JavaMOP extended regular expressions (ERE) for a Transaction
class. This class implements the following 3 methods: Start, Commit, and Modify. The
transaction class should comply with the following properties:
1. Every commit should have a preceding start.
2. Every start should have a commit.
3. Start followed by immediate start is an error.
4. Commit followed by immediate commit is also an error.
5. Modify can only happen between start and commit.
6. There can be multiple consecutive modify operations.
7. For every error detected, an appropriate message mentioning which property got
violated should be printed.
The transaction class has been shared in Transaction.java. You may add additional methods to
this class if needed. The errors should be reported by the designed aspects in case of violation
of any of the properties.
You also need to submit a regular expression as well as a DFA corresponding to it. You can
submit a picture(if you want to).
Bonus
The transaction can also be rollbacked which will discard all the modifications made after the
starting the transaction. The transaction class also contains a method called Rollback. You
need to modify the previous aspect to check the following properties and report the error by
displaying an appropriate message:
1. Transaction, once started, has to be completed (start again in case of rollback).
2. Every rollback should have a preceding start.
3. Rollback followed by immediate rollback is also an error.
You also need to submit a modified regular expression as well as a DFA corresponding to the
added feature.
Note:
1. This assignment can be done in pairs.
2. Please state all your assumptions (if any) in a separate file and attach it with the
assignment.
Your submission should contain:
1. A zipped folder containing aspects (.aj file) and appropriate exception classes written by
you to verify the above mentioned properties. (Providing the entire zipped project is
advisable)

2. JavaMOP ERE specifications (.mop) file to verify the same properties.
3. Generated monitor (aspects) from your ERE (.mop) specifications using JavaMOP online
interface.
4. DFA for your system Transaction.
