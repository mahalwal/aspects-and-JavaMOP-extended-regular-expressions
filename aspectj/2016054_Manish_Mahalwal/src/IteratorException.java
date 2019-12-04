
public class IteratorException extends RuntimeException {
	public IteratorException(int type) {
		switch(type) {
		case 1: 
			System.out.println("Every commit should have a preceding start");
			break;
		case 2: 
			System.out.println("Every start should have a commit.");
			break;
		case 3: 
			System.out.println("Start followed by immediate start is an error.");
			break;
		case 4: 
			System.out.println("Commit followed by immediate commit is also an error.");
			break;
		case 5: 
			System.out.println("Modify can only happen between start and commit.");
			break;
		case 6:
			System.out.println("Rollback should be preceded by modify");
			break;
		case 7: 
			System.out.println("Rollback should be preceded by a start");
			break;
		case 8: 
			System.out.println("Rollback followed by a rollback");
			break;
		default:
			
			break;
		
		}
	}
	public static void throw1() {
		System.out.println("Every commit should have a preceding start.");
	}
}
