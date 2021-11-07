/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package vidaflix;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;

/**
 *
 * @author user
 */
public class query {
    public String Url(String url) throws MalformedURLException, IOException{
     URL oracle = new URL(url);
    BufferedReader in = new BufferedReader(
    new InputStreamReader(oracle.openStream()));
    String inputLine=in.readLine();
    in.close();
    
    return inputLine;
    }
}
