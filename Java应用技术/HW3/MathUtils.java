package homework3;

public class MathUtils {
    private MathUtils(){
    }
    
    static UnmodifiableVector getUnmodifiableVector(Vector V){
        return new UnmodifiableVector(V);
    }
    
    static UnmodifiableMatrix getUnmodifiableMatrix(Matrix M){
        return new UnmodifiableMatrix(M);
    }
}
