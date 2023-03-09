
package homework5;

import java.io.*;
import java.awt.*;
import java.net.*;
import javax.swing.*;
import java.awt.event.*;
import java.util.logging.*;

public final class ClientFrame extends JFrame{
    int tableID, curtID, opntID;
    boolean curtReady, opntReady, inGame;
    GameTable game;
    GameFrame gameF;
    
    Socket socket;
    DataInputStream in;
    DataOutputStream out;
    
    JLabel status;
    JButton newButton = new JButton("进入空闲房间");
    JButton matchButton = new JButton("随机匹配房间");
    JButton readyButton = new JButton("准备");
    JButton exitButton = new JButton("退出房间");
    JButton startButton = new JButton("开始游戏");
    JButton surrenderButton = new JButton("投降");
    
    ClientFrame(){
        super("Client");
        
        if(ServerFrame.hasServer == false) return;
        
        setLocation(700, 700);
        setDefaultCloseOperation(DISPOSE_ON_CLOSE);
        setLayout(new GridLayout(7, 1));
        
        newButton.addActionListener(new ClientEvent(SocketConst.ConnectToEmpty));
        matchButton.addActionListener(new ClientEvent(SocketConst.ConnectToRandom));
        readyButton.addActionListener(new ClientEvent(SocketConst.Standby));
        exitButton.addActionListener(new ClientEvent(SocketConst.ExitTable));
        startButton.addActionListener(new ClientEvent(SocketConst.StartGame));
        surrenderButton.addActionListener(new ClientEvent(SocketConst.Surrender));
        
        try {
            socket = new Socket("localhost", 5646);
            in = new DataInputStream(socket.getInputStream());
            out = new DataOutputStream(socket.getOutputStream());
        } catch (IOException ex) {
            Logger.getLogger(ClientFrame.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        curtID = getClientID();
        tableID = -1;
        
        status = new JLabel(info());
        getContentPane().add(status);
        drawTable();
        
        setVisible(true);
        
        listen();
    }
    
    String info(){
        StringBuilder ret = new StringBuilder();
        ret.append(" TableID: ").append(tableID);
        ret.append(" ClientID: ").append(curtID);
        ret.append(" ClientReady: ").append(curtReady);
        ret.append(" OpponentID: ").append(opntID);
        ret.append(" OpponentReady: ").append(opntReady);
        ret.append(" Gaming: ").append(inGame);
        return ret.toString();
    }
    
    void listen(){
        while(true){
            try {
                int event = in.readInt();
                if(event == SocketConst.ChangeTable) tableID = in.readInt();
                else if(event == SocketConst.ChangeReady) curtReady = in.readBoolean();
                else if(event == SocketConst.ChangeGaming){
                    inGame = in.readBoolean();
                    if(inGame) gameF = new GameFrame(300, 300);
                }else if(event == SocketConst.ChangeOpnt) opntID = in.readInt();
                else if(event == SocketConst.ChangeOpntReady) opntReady = in.readBoolean();
                else if(event == SocketConst.ChangeGameStatus){
                    int a = in.readInt();
                    int b = in.readInt();
                    game = new GameTable(a, b);
                    if(inGame){
                        GameFrame old = gameF;
                        gameF = new GameFrame(gameF.getX(), gameF.getY());
                        old.setVisible(false);
                    }
                }else if(event == SocketConst.Win){
                    JOptionPane.showMessageDialog(this, "To Client " + curtID + ": You win");
                    gameF.setVisible(false);
                }else if(event == SocketConst.Lose){
                    JOptionPane.showMessageDialog(this, "To Client " + curtID + ": You lose");
                    gameF.setVisible(false);
                }else if(event == SocketConst.Draw){
                    JOptionPane.showMessageDialog(this, "To Client " + curtID + ": Game ends in a draw");
                    gameF.setVisible(false);
                }
                drawTable();
            } catch (IOException ex) {
                Logger.getLogger(ClientFrame.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
    
    int getClientID(){
        int ret = 0;
        try {
            out.writeInt(SocketConst.GetClientID);
            ret = in.readInt();
        } catch (IOException ex) {
            Logger.getLogger(ClientFrame.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ret;
    }
    
    void step(int x, int y){
        try {
            out.writeInt(SocketConst.Step);
            out.writeInt(x);
            out.writeInt(y);
        } catch (IOException ex) {
            Logger.getLogger(ClientFrame.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    void drawTable(){
        getContentPane().add(newButton);
        newButton.setEnabled(tableID == -1);
        getContentPane().add(matchButton);
        matchButton.setEnabled(tableID == -1);
        getContentPane().add(readyButton);
        readyButton.setEnabled(tableID != -1 && !curtReady);
        getContentPane().add(exitButton);
        exitButton.setEnabled(tableID != -1 && !inGame);
        getContentPane().add(startButton);
        startButton.setEnabled(curtReady && opntReady && !inGame);
        getContentPane().add(surrenderButton);
        surrenderButton.setEnabled(inGame);
        getContentPane().remove(status);
        status = new JLabel(info());
        getContentPane().add(status);
        pack();
    }
    
    class ClientEvent implements ActionListener{
        int event;
        
        ClientEvent(int e){
            event = e;
        }
        
        @Override
        public void actionPerformed(ActionEvent e) {
            try {
                out.writeInt(event);
            } catch (IOException ex) {
                Logger.getLogger(ClientFrame.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
    
    final class GameFrame extends JFrame{
        GameFrame(int x, int y){
            super("Gaming: Client" + curtID);
            
            setLocation(x, y);
            setDefaultCloseOperation(DISPOSE_ON_CLOSE);
            
            getContentPane().add(new JPanel(){
                @Override
                public void paint(Graphics graphics){
                    super.paint(graphics);
                    graphics.setFont(new Font("Georgia", Font.BOLD, 100));
                    graphics.drawString(String.valueOf(game.condition() / 100000000 % 10), 0, 70);
                    graphics.drawString(String.valueOf(game.condition() / 10000000 % 10), 100, 70);
                    graphics.drawString(String.valueOf(game.condition() / 1000000 % 10), 200, 70);
                    graphics.drawString(String.valueOf(game.condition() / 100000 % 10), 0, 170);
                    graphics.drawString(String.valueOf(game.condition() / 10000 % 10), 100, 170);
                    graphics.drawString(String.valueOf(game.condition() / 1000 % 10), 200, 170);
                    graphics.drawString(String.valueOf(game.condition() / 100 % 10), 0, 270);
                    graphics.drawString(String.valueOf(game.condition() / 10 % 10), 100, 270);
                    graphics.drawString(String.valueOf(game.condition() / 1 % 10), 200, 270);
                    graphics.drawLine(0, 90, 300, 90);
                    graphics.drawLine(0, 190, 300, 190);
                    graphics.drawLine(80, 0, 80, 300);
                    graphics.drawLine(180, 0, 180, 300);
                }
            });
            
            addMouseListener(new MouseListener(){
                @Override
                public void mousePressed(MouseEvent e){}
                @Override
                public void mouseEntered(MouseEvent e){}
                @Override
                public void mouseReleased(MouseEvent e){}
                @Override
                public void mouseExited(MouseEvent e){}
                @Override
                public void mouseClicked(MouseEvent e){
                    if(0 <= e.getX() && e.getX() <= 80){
                        if(0 <= e.getY() && e.getY() <= 90) step(0, 0);
                        else if(90 <= e.getY() && e.getY() <= 190) step(0, 1);
                        else if(190 <= e.getY() && e.getY() <= 300) step(0, 2);
                    }else if(80 <= e.getX() && e.getX() <= 180){
                        if(0 <= e.getY() && e.getY() <= 90) step(1, 0);
                        else if(90 <= e.getY() && e.getY() <= 190) step(1, 1);
                        else if(190 <= e.getY() && e.getY() <= 300) step(1, 2);
                    }else if(180 <= e.getX() && e.getX() <= 300){
                        if(0 <= e.getY() && e.getY() <= 90) step(2, 0);
                        else if(90 <= e.getY() && e.getY() <= 190) step(2, 1);
                        else if(190 <= e.getY() && e.getY() <= 300) step(2, 2);
                    }
                }
            });
            
            setSize(300, 350);
            setVisible(true);
        }
    }
}
