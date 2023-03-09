package homework5;

import java.awt.event.*;
import java.util.logging.*;

public class NewFrameEvent implements ActionListener{
    private final String frameName;
    
    public NewFrameEvent(String arg){
        frameName = arg;
    }
    
    @Override
    public void actionPerformed(ActionEvent e){
        new Thread(() -> {
            try {
                Class.forName(frameName).newInstance();
            } catch (ClassNotFoundException | InstantiationException | IllegalAccessException ex) {
                Logger.getLogger(NewFrameEvent.class.getName()).log(Level.SEVERE, null, ex);
            }
        }).start();
    }
}
