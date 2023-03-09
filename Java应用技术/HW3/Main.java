package homework3;

import java.time.Clock;
import java.time.Duration;

public class Main {
    static double[] vector = new double[2];
    static double[][] matrix = new double[2][2];
    public static void main(String[] args) throws Exception{
        for(int i = 0; i < 2; ++i){
            vector[i] = i;
            for(int j = 0; j < 2; ++j){
                matrix[i][j] = i * 2 + j;
            }
        }
        Vector v = new Vector(vector);
        Matrix m = new Matrix(matrix);
        UnmodifiableVector uv = MathUtils.getUnmodifiableVector(v);
        UnmodifiableMatrix um = MathUtils.getUnmodifiableMatrix(m);
        long cstart, cend;
        double a, b;
        
        /*//Test1
        cstart = System.currentTimeMillis();
        for(int i = 0; i < 10000000; ++i){
            m = m.mul(m);
        }
        System.out.println();
        cend = System.currentTimeMillis();
        System.out.println(cend - cstart);
        
        cstart = System.currentTimeMillis();
        for(int i = 0; i < 10000000; ++i){
            um = um.mul(um);
        }
        System.out.println();
        cend = System.currentTimeMillis();
        System.out.println(cend - cstart);
        
        //Test2
        cstart = System.currentTimeMillis();
        Matrix rm = m;
        for(int i = 0; i < 10000000; ++i){
            rm = rm.mul(m.transposition());
        }
        cend = System.currentTimeMillis();
        System.out.println(cend - cstart);
        
        cstart = System.currentTimeMillis();
        UnmodifiableMatrix rum = um;
        for(int i = 0; i < 10000000; ++i){
            rum = rum.mul(um.transposition());
        }
        cend = System.currentTimeMillis();
        System.out.println(cend - cstart);*/
        
        //Test3
        /*cstart = System.currentTimeMillis();
        Vector rv2 = v;
        for(int i = 0; i < 100000000; ++i){
            rv2 = rv2.add(v);
            rv2 = rv2.sub(v);
            a = rv2.norm();
        }
        cend = System.currentTimeMillis();
        System.out.println(cend - cstart);
        
        cstart = System.currentTimeMillis();
        UnmodifiableVector ruv2 = uv;
        for(int i = 0; i < 100000000; ++i){
            ruv2 = ruv2.add(uv);
            ruv2 = ruv2.sub(uv);
            a = ruv2.norm();
        }
        cend = System.currentTimeMillis();
        System.out.println(cend - cstart);*/
    }
}
