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
public class Foo extends Bar{
    private int a = 3;                
    public int more(int m){                
        return a + m;                
    }                        
    public int something(){                
        return super.more(a);                
    }
}
