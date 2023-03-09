package homework3;

public class UnmodifiableVector {
    private final int size;
    private final double[] ary;
    private boolean normCalculated = false;
    private double norm = 0;
    private String ToS = null;
    public UnmodifiableVector(){
        size = 0;
        ary = new double[0];
    }
    public UnmodifiableVector(double[] ary, int size){
        this.size = size;
        this.ary = new double[size];
        for(int i = 0; i < size; ++i){
            this.ary[i] = ary[i];
        }
    }
    public UnmodifiableVector(double[] ary){
        this(ary, ary.length);
    }
    public UnmodifiableVector(int size){
        this.size = size;
        this.ary = new double[size];
    }
    public UnmodifiableVector(Vector v){
        size = v.getSize();
        this.ary = new double[size];
        for(int i = 0; i < size; ++i){
            this.ary[i] = v.getElementAt(i);
        }
    }
    public int getSize(){
        return size;
    }
    public double getElementAt(int index){
        return ary[index];
    }
    public UnmodifiableVector negative(){
        UnmodifiableVector ret = new UnmodifiableVector(this.size);
        for(int i = 0; i < this.size; ++i){
            ret.ary[i] = -this.ary[i];
        }
        return ret;
    }
    public UnmodifiableVector add(UnmodifiableVector x) throws Exception{
        if(x.size != this.size) throw new Exception("向量运算维数不匹配！");
        UnmodifiableVector ret = new UnmodifiableVector(this.size);
        for(int i = 0; i < this.size; ++i){
            ret.ary[i] = this.ary[i] + x.ary[i];
        }
        return ret;
    }
    public UnmodifiableVector sub(UnmodifiableVector x) throws Exception{
        return this.add(x.negative());
    }
    public UnmodifiableVector mul(double x){
        UnmodifiableVector ret = new UnmodifiableVector(this.size);
        for(int i = 0; i < this.size; ++i){
            ret.ary[i] = this.ary[i] * x;
        }
        return ret;
    }
    public double norm(){
        if(normCalculated){
            return norm;
        }else{
            normCalculated = true;
            for(int i = 0; i < this.size; ++i){
                norm += this.ary[i] * this.ary[i];
            }
            norm = Math.sqrt(norm);
            return norm;
        }
    }
    @Override
    public String toString(){
        if(ToS == null){
            StringBuilder ret = new StringBuilder();
            for(int i = 0; i < size; ++i){
                if(i != 0) ret.append(' ');
                ret.append(this.ary[i]);
            }
            ToS = ret.toString();
        }
        return ToS;
    }
}
