package homework5;

public final class SocketConst{
    public static final int ConnectToEmpty = 1;
    public static final int ConnectToRandom = 2;
    public static final int Standby = 3;
    public static final int ExitTable = 4;
    public static final int StartGame = 5;
    public static final int Surrender = 6;
    public static final int Step = 7;
    public static final int GetClientID = 8;
    
    public static final int ChangeTable = 200;
    public static final int ChangeReady = 201;
    public static final int ChangeGaming = 202;
    public static final int ChangeOpnt = 203;
    public static final int ChangeOpntReady = 204;
    
    public static final int ChangeGameStatus = 300;
    public static final int Win = 301;
    public static final int Lose = 302;
    public static final int Draw = 303;
    
    private SocketConst(){
    }
}
