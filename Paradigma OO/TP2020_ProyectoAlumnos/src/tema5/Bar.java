/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema5;

/**
 *
 * @author Usuario
 */

public class Bar {
    private int x = 2;        
    public int more(int m){
            return m + x;
    }
    public int something(){
        return more(x);
    }
    public int andMore(){
        return more(x);
    }
}


