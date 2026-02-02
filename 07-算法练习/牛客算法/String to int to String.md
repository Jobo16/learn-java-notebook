StringBuilder 
CharAt

public class Main{
    public static void main(String [] args){
        String s = "hello world";
        StringBuilder sb = new StringBuilder();
        
        for (int i = 0; i < s.length(); i++){
            char c = s.charAt(i);
            sb.append((char)(c+1));
        }
        System.out.print(sb.toString());
    }
}

https://ac.nowcoder.com/acm/contest/18839/1019