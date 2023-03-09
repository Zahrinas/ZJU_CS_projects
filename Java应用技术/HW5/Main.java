package homework5;

import java.awt.*;
import javax.swing.*;

public class Main extends JFrame{
    Main(){
        super("main");
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLocation(500, 500);
        setLayout(new GridLayout());
        
        JButton serverButton = new JButton("Run a Server");
        JButton clientButton = new JButton("Run a Client");
        serverButton.addActionListener(new NewFrameEvent("homework5.ServerFrame"));
        clientButton.addActionListener(new NewFrameEvent("homework5.ClientFrame"));
        
        getContentPane().add(serverButton);
        getContentPane().add(clientButton);
        
        pack();
        setVisible(true);
    }
    public static void main(String[] args){
        Main m = new Main();
    }
}
