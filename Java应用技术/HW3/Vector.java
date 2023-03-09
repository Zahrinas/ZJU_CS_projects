package homework3;

public class Vector {
    private int size;
    private double[] ary;
    public Vector(){
        size = 0;
        ary = new double[0];
    }
    public Vector(double[] ary, int size){
        this.size = size;
        this.ary = new double[size];
        for(int i = 0; i < size; ++i){
            this.ary[i] = ary[i];
        }
    }
    public Vector(double[] ary){
        this(ary, ary.length);
    }
    public Vector(int size){
        this.size = size;
        this.ary = new double[size];
    }
    public int getSize(){
        return size;
    }
    public double getElementAt(int index){
        return ary[index];
    }
    public void modifyElementAt(int index, double value){
        ary[index] = value;
    }
    public Vector negative(){
        Vector ret = new Vector(this.size);
        for(int i = 0; i < this.size; ++i){
            ret.ary[i] = -this.ary[i];
        }
        return ret;
    }
    public Vector add(Vector x) throws Exception{
        if(x.size != this.size) throw new Exception("向量运算维数不匹配！");
        Vector ret = new Vector(this.size);
        for(int i = 0; i < this.size; ++i){
            ret.ary[i] = this.ary[i] + x.ary[i];
        }
        return ret;
    }
    public Vector sub(Vector x) throws Exception{
        return this.add(x.negative());
    }
    public Vector mul(double x){
        Vector ret = new Vector(this.size);
        for(int i = 0; i < this.size; ++i){
            ret.ary[i] = this.ary[i] * x;
        }
        return ret;
    }
    public double norm(){
        double sum = 0;
        for(int i = 0; i < this.size; ++i){
            sum += this.ary[i] * this.ary[i];
        }
        return Math.sqrt(sum);
    }
    @Override
    public String toString(){
        StringBuilder ret = new StringBuilder();
        for(int i = 0; i < size; ++i){
            if(i != 0) ret.append(' ');
            ret.append(this.ary[i]);
        }
        return ret.toString();
    }
}
