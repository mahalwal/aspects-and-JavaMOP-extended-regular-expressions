import java.util.*;

public aspect IteratorVerifier
{
	ArrayList<String> lastCall = new ArrayList<String>();
	boolean lastRollBack = false;
	
	before(Transaction t):
		call(* Transaction.commit()) && target(t)
		{
			int sz = lastCall.size()-1;
			if(sz==-1) {
				throw new IteratorException(1);
			}
			if(lastCall.get(sz).equals("start")) {
				
			}
			else {
				throw new IteratorException(1);
			}
		}
	
	after(Transaction t):
		call(* Transaction.commit()) && target(t)
		{
			lastRollBack = false;
			lastCall.add("commit");
		}
	before(Transaction t):
		call(* Transaction.start()) && target(t)
		{
			int sz = lastCall.size()-1;
			if(sz!=-1 && lastCall.get(sz).equals("start")) {
				throw new IteratorException(3);
			}
		}
	
	after(Transaction t):
		call(* Transaction.start()) && target(t)
		{
			lastRollBack = false;
			lastCall.add("start");
		}
	
	before(Transaction t):
		call(* Transaction.modify()) && target(t)
		{
			int sz = lastCall.size()-1;
			if(sz==-1) {
				throw new IteratorException(5);
			}
			if(lastCall.contains("start") && (lastCall.get(sz).equals("start") || lastCall.get(sz).equals("modify"))) {
				
			}
			else 
				throw new IteratorException(5);
		}
	after(Transaction t):
		call(* Transaction.modify()) && target(t)
		{
			lastRollBack = false;
			lastCall.add("modify");
		}
	
	after(): 
		execution(* Testcase.main(..))
		{
			int sz = lastCall.size()-1;
			if(sz!=-1 && lastCall.get(sz).equals("start") && !lastRollBack) {
				throw new IteratorException(2);
			}
		}
	
	before(Transaction t):
		call(* Transaction.rollback()) && target(t)
		{
			if(lastRollBack) {
				throw new IteratorException(8);
			}
			int sz = lastCall.size()-1;
			if(sz==-1) {
				System.out.println();
				throw new IteratorException(6);
			}
			
			if(lastCall.get(sz).equals("start") || lastCall.get(sz).equals("commit") || lastCall.get(sz).equals("rollback")) {
				throw new IteratorException(6);
			}
			int count = 0;
			
			sz = lastCall.size()-1;
			if(!lastCall.contains("start")) {
				throw new IteratorException(7);
			}
			for(int i=sz; ; i--) {
				if(lastCall.get(i).equals("start")) {
					break;
				}
				count++;
			}
			for(int i=count; i>0; i--) {
					System.out.println("Rolling back transaction " + i);
			}
			
			sz = lastCall.size()-1;
			for(int i=sz; count>0; i--) {
				lastCall.remove(i);
				count--;
			}
		}
	after(Transaction t):
		call(* Transaction.rollback()) && target(t)
		{
			lastRollBack = true;
			lastCall.add("start");
		}
}