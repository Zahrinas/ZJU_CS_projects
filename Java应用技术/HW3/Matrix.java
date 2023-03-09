package homework3;

public class Matrix {
    private int xsize, ysize;
    private double[][] ary;
    public Matrix(){
        xsize = ysize = 0;
        ary = new double[0][0];
    }
    public Matrix(double[][] ary, int xsize, int ysize){
        this.xsize = xsize;
        this.ysize = ysize;
        this.ary = new double[xsize][ysize];
        for(int i = 0; i < xsize; ++i){
            for(int j = 0; j < ysize; ++j){
                this.ary[i][j] = ary[i][j];
            }
        }
    }
    public Matrix(double[][] ary) throws Exception{
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
    public Matrix(int xsize, int ysize){
        this.xsize = xsize;
        this.ysize = ysize;
        this.ary = new double[xsize][ysize];
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
    public Matrix negative(){
        Matrix ret = new Matrix(this.xsize, this.ysize);
        for(int i = 0; i < xsize; ++i){
            for(int j = 0; j < ysize; ++j){
                ret.ary[i][j] = -this.ary[i][j];
            }
        }
        return ret;
    }
    public Matrix add(Matrix x) throws Exception{
        if(x.xsize != this.xsize || x.ysize != this.ysize) throw new Exception("矩阵运算维数不匹配！");
        Matrix ret = new Matrix(this.xsize, this.ysize);
        for(int i = 0; i < xsize; ++i){
            for(int j = 0; j < ysize; ++j){
                ret.ary[i][j] = this.ary[i][j] + x.ary[i][j];
            }
        }
        return ret;
    }
    public Matrix sub(Matrix x) throws Exception{
        return this.add(x.negative());
    }
    public Matrix mul(double x){
        Matrix ret = new Matrix(this.xsize, this.ysize);
        for(int i = 0; i < xsize; ++i){
            for(int j = 0; j < ysize; ++j){
                ret.ary[i][j] = this.ary[i][j] * x;
            }
        }
        return ret;
    }
    public Matrix mul(Matrix x) throws Exception{
        if(this.ysize != x.xsize) throw new Exception("矩阵运算维数不匹配！");
        Matrix ret = new Matrix(this.xsize, x.ysize);
        for(int i = 0; i < this.xsize; ++i){
            for(int j = 0; j < x.ysize; ++j){
                for(int k = 0; k < this.ysize; ++k){
                   ret.ary[i][j] += this.ary[i][k] * x.ary[k][j]; 
                }
            }
        }
        return ret;
    }
    public Matrix transposition(){
        Matrix ret = new Matrix(this.ysize, this.xsize);
        for(int i = 0; i < xsize; ++i){
            for(int j = 0; j < ysize; ++j){
                ret.ary[j][i] = this.ary[i][j];
            }
        }
        return ret;
    }
    @Override
    public String toString(){
        StringBuilder ret = new StringBuilder();
        for(int i = 0; i < xsize; ++i){
            for(int j = 0; j < ysize; ++j){
                if(j != 0) ret.append(' ');
                ret.append(this.ary[i][j]);
            }
            if(i != xsize - 1) ret.append('\n');
        }
        return ret.toString();
    }
}
