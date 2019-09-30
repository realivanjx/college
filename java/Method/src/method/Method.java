/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package method;

/**
 *
 * @author xanal
 */
public class Method {
    
    static int simpleAdd(int n) {
        if(n == 0) {
            return n;
        }
        
        return simpleAdd(n - 1) + n;
    }

    static int factorial(int n) {
        if(n == 1) {
            return n;
        }
        
        return factorial(n - 1) * n;
    }
    
    static double power(int a, int n) {
        if(n == 0) {
            return Math.pow(a, n); // 1.
        }
        
        return power(a, n - 1) * Math.pow(a, n);
    }
    
    static int fib(int n) {
        if(n == 1 || n == 0) {
            return n;
        }
        
        return fib(n - 1) + fib(n - 2);
    }
    
    static int gcd(int a, int b) {
        if(b == 0) {
            return a;
        }
        
        return gcd(b, a % b);
    }
    
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        System.out.println(power(2, 2));
    }
    
}
