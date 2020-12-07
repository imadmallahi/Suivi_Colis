package email;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;

public class sendSMS {
	public String sendSms() {
		try {
			// Construct data
			String apiKey = "apikey=" + "pnLgnf9x+iY-iS9rHyY205or0l9zPBg44xKegHaDUO";
			String message = "&message=" + "This is your message";
			String sender = "&sender=" + "Yaqout";
			String numbers = "&numbers=" + "212615223491";

			// Send data
			HttpURLConnection conn = (HttpURLConnection) new URL("https://api.txtlocal.com/send/?").openConnection();
			String data = apiKey + numbers + message + sender;
			conn.setDoOutput(true);
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Content-Type", "application/json");
			conn.setRequestProperty("Content-Length", Integer.toString(data.length()));
			conn.getOutputStream().write(data.getBytes("UTF-8"));
			final BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			final StringBuffer stringBuffer = new StringBuffer();
			String line;
			while ((line = rd.readLine()) != null) {
				System.out.println("mmm");
				stringBuffer.append(line);
			}
			rd.close();
			System.out.println(stringBuffer.toString());
			return stringBuffer.toString();
		} catch (Exception e) {
			System.out.println("Error SMS "+e);
			System.out.println("==========Error "+e);
			return "Error "+e;
		}
	}
	
	public static void main(String[] args){
		new sendSMS().sendSms();
		
	}
}