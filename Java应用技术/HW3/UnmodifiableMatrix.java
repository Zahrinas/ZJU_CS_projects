package homework3;

public class UnmodifiableMatrix {
    private final int xsize, ysize;
    private final double[][] ary;
    private UnmodifiableMatrix trp;
    private String ToS;
    public UnmodifiableMatrix(){
        xsize = ysize = 0;
        ary = new double[0][0];
    }
    public UnmodifiableMatrix(double[][] ary, int xsize, int ysize){
        this.xsize = xsize;
        this.ysize = ysize;
        this.ary = new double[xsize][ysize];
        for(int i = 0; i < xsize; ++i){
            for(int j = 0; j < ysize; ++j){
                this.ary[i][j] = ary[i][j];
            }
        }
    }
    public UnmodifiableMatrix(double[][] ary) throws Exception{
        for(int i = 1; i < ary.length; ++i){
            if(ary[i].length != ary[0].length) throw new Exception("传入数组不是合法矩阵！");
        }
        this.xsize = ary.length;
        this.ysize = ary[0].length;
        this.ary = new double[xsize][ysize];
        for(int i = 0; i < xsize; ++i){
            for(int j = 0; j < ysize; ++j){
                this.ary[i][j] = ary[i][j];
            }
        }
    }
    public UnmodifiableMatrix(int xsize, int ysize){
        this.xsize = xsize;
        this.ysize = ysize;
        this.ary = new double[xsize][ysize];
    }
    public UnmodifiableMatrix(Matrix v){
        xsize = v.getXSize();
        ysize = v.getYSize();
        this.ary = new double[xsize][ysize];
        for(int i = 0; i < xsize; ++i){
            for(int j = 0; j < ysize; ++j){
                this.ary[i][j] = v.getElementAt(i, j);
            }
        }
    }
    public int getXSize(){
        return xsize;
    }
    public int getYSize(){
        return ysize;
    }
    public double getElementAt(int x, int y){
        return ary[x][y];
    }
    public void modifyElementAt(int x, int y, double value){
        ary[x][y] = value;
    }
    public UnmodifiableMatrix negative(){
        UnmodifiableMatrix ret = new UnmodifiableMatrix(this.xsize, this.ysize);
        for(int i = 0; i < xsize; ++i){
            for(int j = 0; j < ysize; ++j){
                ret.ary[i][j] = -this.ary[i][j];
            }
        }
        return ret;
    }
    public UnmodifiableMatrix add(UnmodifiableMatrix x) throws Exception{
        if(x.xsize != this.xsize || x.ysize != this.ysize) throw new Exception("矩阵运算维数不匹配！");
        UnmodifiableMatrix ret = new UnmodifiableMatrix(this.xsize, this.ysize);
        for(int i = 0; i < xsize; ++i){
            for(int j = 0; j < ysize; ++j){
                ret.ary[i][j] = this.ary[i][j] + x.ary[i][j];
            }
        }
        return ret;
    }
    public UnmodifiableMatrix sub(UnmodifiableMatrix x) throws Exception{
        return this.add(x.negative());
    }
    public UnmodifiableMatrix mul(double x){
        UnmodifiableMatrix ret = new UnmodifiableMatrix(this.xsize, this.ysize);
        for(int i = 0; i < xsize; ++i){
            for(int j = 0; j < ysize; ++j){
                ret.ary[i][j] = this.ary[i][j] * x;
            }
        }
        return ret;
    }
    public UnmodifiableMatrix mul(UnmodifiableMatrix x) throws Exception{
        if(this.ysize != x.xsize) throw new Exception("矩阵运算维数不匹配！");
        UnmodifiableMatrix ret = new UnmodifiableMatrix(this.xsize, x.ysize);
        for(int i = 0; i < this.xsize; ++i){
            for(int j = 0; j < x.ysize; ++j){
                for(int k = 0; k < this.ysize; ++k){
                   ret.ary[i][j] += this.ary[i][k] * x.ary[k][j]; 
                }
            }
        }
        return ret;
    }
    public UnmodifiableMatrix transposition(){
        if(trp == null){
            trp = new UnmodifiableMatrix(this.ysize, this.xsize);
            for(int i = 0; i < xsize; ++i){
                for(int j = 0; j < ysize; ++j){
                    trp.ary[j][i] = this.ary[i][j];
                }
            }
        }
        return trp;
    }
    @Override
    public String toString(){
        if(ToS == null){
            StringBuilder ret = new StringBuilder();
            for(int i = 0; i < xsize; ++i){
                for(int j = 0; j < ysize; ++j){
                    if(j != 0) ret.append(' ');
                    ret.append(this.ary[i][j]);
                }
                if(i != xsize - 1) ret.append('\n');
            }
            ToS = ret.toString();
        }
        return ToS;
    }
}
