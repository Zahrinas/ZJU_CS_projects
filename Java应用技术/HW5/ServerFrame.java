package homework5;

import java.io.*;
import java.awt.*;
import java.net.*;
import java.util.logging.*;
import javax.swing.*;

public final class ServerFrame extends JFrame{
    static final int tableMax = 2;
    
    static int clientCnt = 0;
    static boolean hasServer = false;
    static TableEntry[] tables;
    
    ServerSocket serv;
    Socket socket;
    
    ServerFrame(){
        super("Server");
        
        synchronized(ServerFrame.class){
            if(hasServer == true) return;
            else hasServer = true;
        }
        
        setLocationRelativeTo(null);
        setDefaultCloseOperation(EXIT_ON_CLOSE);
        setLayout(new GridLayout(tableMax + 1, 1));
        
        tables = new TableEntry[tableMax];
        for(int i = 0; i < tableMax; ++i){
            tables[i] = new TableEntry(i);
        }
        drawEntryTable();
        
        setVisible(true);
        
        initSocket();
    }
    
    void initSocket(){
        try {
            serv = new ServerSocket(5646);
            while(true){
                socket = serv.accept();
                (new ServerThread(socket)).start();
            }
        } catch (IOException ex) {
            Logger.getLogger(ServerThread.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    void drawEntryTable(){
        getContentPane().removeAll();
        getContentPane().add(new JLabel("Current Tables:"));
        for(int i = 0; i < tableMax; ++i){
            getContentPane().add(new JLabel("Table " + i +":" + tables[i].info()));
        }
        pack();
    }
    
    synchronized int getEmptyTable(){
        for(int i = 0; i < tableMax; ++i){
            if(tables[i].isEmpty()) return i;
        }
        return -1;
    }
    
    synchronized int getRandomTable(){
        int cnt = 0;
        for(int i = 0; i < tableMax; ++i){
            if(tables[i].isWaiting()) ++cnt;
        }
        int loc = (int) (cnt * Math.random());
        for(int i = 0; i < tableMax; ++i){
            if(tables[i].isWaiting()){
                if(loc == 0) return i;
                --loc;
            }
        }
        return -1;
    }
    
    synchronized void sitAtTable(int clientID, Socket skt, int tableID) throws IOException{
        if(tableID == -1) return;
        tables[tableID].addPlayer(clientID, skt);
    }
    
    synchronized void exitTable(int clientID, int tableID) throws IOException{
        if(tableID == -1) return;
        tables[tableID].removePlayer(clientID);
    }
    
    synchronized boolean readyTable(int whichTable){
        if(whichTable == -1) return false;
        return tables[whichTable].isReady();
    }

    synchronized void updateTable(int clientID, int whichTable, boolean ready) throws IOException{
        if(whichTable == -1) return;
        tables[whichTable].setPlayerStatus(clientID, ready);
    }
    
    synchronized void startGame(int whichTable) throws IOException{
        if(whichTable == -1) return;
        tables[whichTable].start();
    }
    
    synchronized boolean currentGame(int whichTable){
        if(whichTable == -1) return false;
        return tables[whichTable].current();
    }
    
    synchronized int getOpponent(int clientID, int whichTable){
        if(whichTable == -1) return 0;
        return tables[whichTable].opponentPlayer(clientID);
    }
    
    synchronized void winGame(int clientID, int whichTable) throws IOException{
        if(whichTable == -1) return;
        tables[whichTable].winGame(clientID);
    }
    
    synchronized void gameStep(int clientID, int whichTable, int x, int y) throws IOException{
        tables[whichTable].step(clientID, x, y);
    }
    
    class ServerThread extends Thread{
        Socket socket;
        DataInputStream in;
        DataOutputStream out;
        int clientID;
        int whichTable;

        public ServerThread(Socket socket){
            try {
                this.socket = socket;
                in = new DataInputStream(socket.getInputStream());
                out = new DataOutputStream(socket.getOutputStream());
            } catch (IOException ex) {
                Logger.getLogger(ServerThread.class.getName()).log(Level.SEVERE, null, ex);
            }
            synchronized(ServerFrame.class){
                clientID = ++clientCnt;
            }
        }

        @Override
        public void run(){
            try {
                while(true){
                    int opr = in.readInt();
                    if(opr == SocketConst.ConnectToEmpty){
                        if(!currentGame(whichTable)){
                            exitTable(clientID, whichTable);
                            sitAtTable(clientID, socket, whichTable = getEmptyTable());
                        }
                    }else if(opr == SocketConst.ConnectToRandom){
                        if(!currentGame(whichTable)){
                            exitTable(clientID, whichTable);
                            sitAtTable(clientID, socket, whichTable = getRandomTable());
                        }
                    }else if(opr == SocketConst.Standby){
                        if(!currentGame(whichTable)) updateTable(clientID, whichTable, true);
                    }else if(opr == SocketConst.ExitTable){
                        if(!currentGame(whichTable)) exitTable(clientID, whichTable);
                    }else if(opr == SocketConst.StartGame){
                        if(!currentGame(whichTable) && readyTable(whichTable)) startGame(whichTable);
                    }else if(opr == SocketConst.Surrender){
                        if(currentGame(whichTable)) winGame(getOpponent(clientID, whichTable), whichTable);
                    }else if(opr == SocketConst.Step){
                        if(currentGame(whichTable)){
                            int x = in.readInt();
                            int y = in.readInt();
                            gameStep(clientID, whichTable, x, y);
                        }
                    }else if(opr == SocketConst.GetClientID){
                        out.writeInt(clientID);
                    }
                    drawEntryTable();
                }
            } catch (IOException ex) {
                Logger.getLogger(ServerThread.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
    
    class TableEntry{
        private DataOutputStream out1, out2;
        private int client1, client2;
        private boolean ready1, ready2;
        private boolean inGame;
        private final int tableID;
        
        private GameTable game;
        
        TableEntry(int ID){
            tableID = ID;
        }
        
        boolean isEmpty(){
            return client1 == 0 && client2 == 0;
        }

        boolean isWaiting(){
            return (client1 == 0 && client2 != 0) || (client1 != 0 && client2 == 0);
        }

        void addPlayer(int playerID, Socket socket) throws IOException{
            if(client1 == 0){
                client1 = playerID;
                ready1 = false;
                
                out1 = new DataOutputStream(socket.getOutputStream());
                
                out1.writeInt(SocketConst.ChangeTable);
                out1.writeInt(tableID);
                out1.writeInt(SocketConst.ChangeReady);
                out1.writeBoolean(false);
                if(out2 != null){
                    out1.writeInt(SocketConst.ChangeOpnt);
                    out1.writeInt(client2);
                    out1.writeInt(SocketConst.ChangeOpntReady);
                    out1.writeBoolean(ready2);
                    
                    out2.writeInt(SocketConst.ChangeOpnt);
                    out2.writeInt(playerID);
                    out2.writeInt(SocketConst.ChangeOpntReady);
                    out2.writeBoolean(false);
                }
            }else if(client2 == 0){
                client2 = playerID;
                ready2 = false;
                
                out2 = new DataOutputStream(socket.getOutputStream());
                
                out2.writeInt(SocketConst.ChangeTable);
                out2.writeInt(tableID);
                out2.writeInt(SocketConst.ChangeReady);
                out2.writeBoolean(false);
                if(out1 != null){
                    out2.writeInt(SocketConst.ChangeOpnt);
                    out2.writeInt(client1);
                    out2.writeInt(SocketConst.ChangeOpntReady);
                    out2.writeBoolean(ready1);
                    
                    out1.writeInt(SocketConst.ChangeOpnt);
                    out1.writeInt(client2);
                    out1.writeInt(SocketConst.ChangeOpntReady);
                    out1.writeBoolean(false);
                }
            }
        }

        void removePlayer(int playerID) throws IOException{
            if(client1 == playerID){
                client1 = 0;
                ready1 = false;
                
                out1.writeInt(SocketConst.ChangeTable);
                out1.writeInt(-1);
                out1.writeInt(SocketConst.ChangeReady);
                out1.writeBoolean(false);
                out1.writeInt(SocketConst.ChangeOpnt);
                out1.writeInt(0);
                out1.writeInt(SocketConst.ChangeOpntReady);
                out1.writeBoolean(false);
                
                out1 = null;
                
                if(out2 != null){
                    out2.writeInt(SocketConst.ChangeOpnt);
                    out2.writeInt(0);
                    out2.writeInt(SocketConst.ChangeOpntReady);
                    out2.writeBoolean(false);
                }
            }else if(client2 == playerID){
                client2 = 0;
                ready2 = false;
                
                out2.writeInt(SocketConst.ChangeTable);
                out2.writeInt(-1);
                out2.writeInt(SocketConst.ChangeReady);
                out2.writeBoolean(false);
                out2.writeInt(SocketConst.ChangeOpnt);
                out2.writeInt(0);
                out2.writeInt(SocketConst.ChangeOpntReady);
                out2.writeBoolean(false);
                
                out2 = null;
                
                if(out1 != null){
                    out1.writeInt(SocketConst.ChangeOpnt);
                    out1.writeInt(0);
                    out1.writeInt(SocketConst.ChangeOpntReady);
                    out1.writeBoolean(false);
                }
            }
        }

        boolean isReady() {
            return ready1 && ready2;
        }

        void setPlayerStatus(int clientID, boolean ready) throws IOException{
            if(client1 == clientID){
                ready1 = ready;
                out1.writeInt(SocketConst.ChangeReady);
                out1.writeBoolean(ready1);
                if(out2 != null){
                    out2.writeInt(SocketConst.ChangeOpntReady);
                    out2.writeBoolean(ready1);
                }
            }else if(client2 == clientID){
                ready2 = ready;
                out2.writeInt(SocketConst.ChangeReady);
                out2.writeBoolean(ready2);
                if(out1 != null){
                    out1.writeInt(SocketConst.ChangeOpntReady);
                    out1.writeBoolean(ready2);
                }
            }
        }

        void start() throws IOException{
            inGame = true;
            game = new GameTable();
            if(out1 != null){
                out1.writeInt(SocketConst.ChangeGaming);
                out1.writeBoolean(true);
                out1.writeInt(SocketConst.ChangeGameStatus);
                out1.writeInt(game.condition());
                out1.writeInt(game.getTurn());
            }
            if(out2 != null){
                out2.writeInt(SocketConst.ChangeGaming);
                out2.writeBoolean(true);
                out2.writeInt(SocketConst.ChangeGameStatus);
                out2.writeInt(game.condition());
                out2.writeInt(game.getTurn());
            }
        }

        boolean current(){
            return inGame;
        }

        int opponentPlayer(int clientID){
            if(client1 == clientID) return client2;
            else if(client2 == clientID) return client1;
            else return -1;
        }

        void winGame(int clientID) throws IOException{
            inGame = false;
            ready1 = ready2 =false;
            if(out1 != null){
                if(client1 == clientID) out1.writeInt(SocketConst.Win);
                else if(client2 == clientID) out1.writeInt(SocketConst.Lose);
                else out1.writeInt(SocketConst.Draw);
                out1.writeInt(SocketConst.ChangeGaming);
                out1.writeBoolean(false);
                out1.writeInt(SocketConst.ChangeReady);
                out1.writeBoolean(false);
                out1.writeInt(SocketConst.ChangeOpntReady);
                out1.writeBoolean(false);
            }
            if(out2 != null){
                if(client2 == clientID) out2.writeInt(SocketConst.Win);
                else if(client1 == clientID) out2.writeInt(SocketConst.Lose);
                else out2.writeInt(SocketConst.Draw);
                out2.writeInt(SocketConst.ChangeGaming);
                out2.writeBoolean(false);
                out2.writeInt(SocketConst.ChangeReady);
                out2.writeBoolean(false);
                out2.writeInt(SocketConst.ChangeOpntReady);
                out2.writeBoolean(false);
            }
        }
        
        void step(int clientID, int x, int y) throws IOException{
            if(client1 == clientID) game.tryStep(1, x, y);
            else if(client2 == clientID) game.tryStep(2, x, y);
            if(out1 != null){
                out1.writeInt(SocketConst.ChangeGameStatus);
                out1.writeInt(game.condition());
                out1.writeInt(game.getTurn());
            }
            if(out2 != null){
                out2.writeInt(SocketConst.ChangeGameStatus);
                out2.writeInt(game.condition());
                out2.writeInt(game.getTurn());
            }
            if(game.finished()) winGame(game.getWinner());
        }
        
        String info(){
            StringBuilder ret = new StringBuilder();
            ret.append(" GameStarted: ").append(inGame);
            ret.append(" P1:").append(client1).append(" Ready: ").append(ready1);
            ret.append(" P2:").append(client2).append(" Ready: ").append(ready2);
            return ret.toString();
        }
    }
}
