import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

public aspect Log {
	File file = new File("log.txt");
	Calendar cal;
	private BufferedWriter bw;
	pointcut success() : call(* moneyMake*(..) );
	after() : success() {
			try {
				cal = Calendar.getInstance();
				bw = new BufferedWriter(new FileWriter(file,true));
				PrintWriter escribir = new PrintWriter(bw);
				escribir.println("Realizar Deposito Hora: " + cal.get(Calendar.HOUR_OF_DAY) + "H:" +
															cal.get(Calendar.MINUTE) + "M:" +
															cal.get(Calendar.SECOND) + "S");
				escribir.flush();
				escribir.close();
				bw.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
			finally {
				System.out.println("**Aspect Log ejecutado**");
			}
			
	}
	
	pointcut succes() : call(* moneyWithdrawal*(..) );
	after() : succes() {
		try {
			cal = Calendar.getInstance();
			bw = new BufferedWriter(new FileWriter(file, true));
			PrintWriter write = new PrintWriter(bw);
			write.println("Realizar Retiro Hora: " + cal.get(Calendar.HOUR_OF_DAY) + "H:" +
													cal.get(Calendar.MINUTE) + "M:" +
													cal.get(Calendar.SECOND) + "S");
			write.flush();
			write.close();
			bw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}finally {
			System.out.println("**Aspect Log ejecutado**");
		}
	}
}
