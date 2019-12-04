import java.util.*;  

public class Testcase {    
	
	public static void main(String[] args) {
		Transaction t = new Transaction();
		t.start();
//		t.commit();
		t.modify();
		t.modify();
		t.modify();
		t.rollback();
		t.modify();
		t.rollback();
//		t.rollback();
		t.commit();
		t.commit();
	}
}