/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package otp;

/**
 *
 * @author kadam_08
 */
public class generateotp {
    String getotp = "";
    
    /**
     *
     * @param otp
     * @return
     * @throws ArithmeticException
     */
    public String getotp(String otp) throws ArithmeticException {
        
            int randomPin = (int)(Math.random()*9000)+1000;
           
            getotp = String.valueOf(randomPin);
           
            
           return getotp;
            }
             
        }
