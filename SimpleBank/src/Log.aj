import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

public aspect Log {
	File file = new File("log.txt");
	Calendar cal = Calendar.getInstance();
	private BufferedWriter bw;
	//Aspecto: Deben hacer los puntos de cortes (pointcut) para crear un log con los tipos de transacciones realizadas.
	pointcut success() : call(* moneyMake*(..) );
	after() : success() {
			try {
				bw = new BufferedWriter(new FileWriter(file,true));
				PrintWriter escribir = new PrintWriter(bw);
				escribir.println("Realizar Deposito Hora: " + cal.toString());
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
			bw = new BufferedWriter(new FileWriter(file, true));
			PrintWriter write = new PrintWriter(bw);
			write.println("Realizar Retiro Hora: " + cal.toString());
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
