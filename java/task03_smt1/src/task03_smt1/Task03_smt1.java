/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package task03_smt1;

/**
 *
 * @author xanal
 */
public class Task03_smt1 {
    static int[] m_arr = new int[0];
    
    public static int count() {
        return m_arr.length;
    }
    
    public static void print() {
        for(int i = 0; i < count(); ++i) {
            System.out.println(m_arr[i]);
        }
    }
    
    static void sort() {
        for(int i = 0; i < count(); ++i) {
            for(int j = i; j < count(); ++j) {
                if(m_arr[i] > m_arr[j]) {
                    int temp = m_arr[i];
                    m_arr[i] = m_arr[j];
                    m_arr[j] = temp;
                }
            }
        }
    }
    
    public static void insert(int num) {
        int[] arr = new int[count() + 1];
        arr[0] = num;
        
        for(int i = 0; i < count(); ++i) {
            arr[i + 1] = m_arr[i];
        }
        
        m_arr = arr;
        sort();
    }
    
    public static void deleteFirst() {
        int[] arr = new int[count() - 1];
        
        for(int i = 1; i < count(); ++i) {
            arr[i-1] = m_arr[i];
        }
        
        m_arr = arr;
    }
    
    public static void deleteLast() {
        int[] arr = new int[count() - 1];
        
        for(int i = 0; i < count() - 1; ++i) {
            arr[i] = m_arr[i];
        }
        
        m_arr = arr;
    }
    
    public static void main(String[] args) {
        
    }
}
