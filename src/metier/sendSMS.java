package metier;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.Random;
 
public class sendSMS {
	private Random random ;
	
	public  static void main(String[] args){
		new sendSMS();
	}
	public  sendSMS() {
		try {
			
			random = new Random();
			int OTP = random.nextInt(999999);
			// Construct data
			String apiKey = "apikey=" + "jG1jIIzZFBc-IRXcnnNWAx81afjW7trTGZ9WixioJw";
			String message = "&message=" + "This is your message";
			String sender = "&sender=" + "TST";
			String numbers = "&numbers=" + "212615223491";
			
			// Send data
			HttpURLConnection conn = (HttpURLConnection) new URL("https://api.textlocal.in/send/?").openConnection();
			String data = apiKey + numbers + message + sender;
			conn.setDoOutput(true);
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Content-Length", Integer.toString(data.length()));
			conn.getOutputStream().write(data.getBytes("UTF-8"));
			final BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			final StringBuffer stringBuffer = new StringBuffer();
			String line;
			while ((line = rd.readLine()) != null) {
				stringBuffer.append(line);
			}
			rd.close();
			
			System.out.println(stringBuffer.toString());
		} catch (Exception e) {
			System.out.println("Error SMS "+e);
			System.out.println("Error "+e);
		}
	}
}