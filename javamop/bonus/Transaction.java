public class Transaction {
	
	public Transaction ()
	{
		
	}

	public void start() {
		System.out.println("Transaction started");
	}
	
	public void modify() {
		System.out.println("Transaction modified");
	}
	
	public void commit() {
		System.out.println("Transaction commited");
	}
	
	public void rollback() {
		System.out.println("Transaction rollbacked");
	}
	public static void main(String[] args) {
		Transaction t = new Transaction();
		t.start();
//		t.commit();
		t.modify();
		t.modify();
//		t.modify();
		t.rollback();
		t.rollback();
//		t.rollback();
		t.commit();
//		t.commit();
	}
}