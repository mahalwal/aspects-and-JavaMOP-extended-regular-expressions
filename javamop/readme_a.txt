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

7. For every error detected, an appropriate message mentioning which property got
violated should be printed.
regex:

