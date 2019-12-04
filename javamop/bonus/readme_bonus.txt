Rollback:

1. Every commit should have a preceding start.
regex: 

2. Every start should have a commit.
regex:

3. Start followed by immediate start is an error.
regex:

4. Commit followed by immediate commit is also an error.
regex:

5. Modify can only happen between start and commit.
regex:

6. There can be multiple consecutive modify operations.
regex:


1. Transaction, once started, has to be completed (start again in case of rollback).
regex: 

2. Every rollback should have a preceding start.
regex: 

3. Rollback followed by immediate rollback is also an error.
regex: 
