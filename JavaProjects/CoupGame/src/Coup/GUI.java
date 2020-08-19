package Coup;

import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyEvent;
import java.awt.BorderLayout;

import javax.management.JMException;
import javax.swing.BorderFactory;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JMenuItem;
import javax.swing.JPanel;
import javax.swing.JPopupMenu;
import javax.swing.JTextField;
import javax.swing.Popup;
import javax.swing.event.MouseInputAdapter;

public class GUI implements ActionListener {
    
    private JLabel nameLabel;
    private JTextField userName;
    private JButton hostbtn;
    private JButton joinbtn;
    public JFrame frame = new JFrame();
    public JPanel panel = new JPanel();

    
    public void login() {
        
        frame = new JFrame();
        
        frame.setSize(1280, 720);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.add(panel, BorderLayout.CENTER);
        panel.setLayout(null);
        
        nameLabel = new JLabel("Name");
        nameLabel.setBounds(10, 20, 80, 25);
        panel.add(nameLabel);
        
        userName = new JTextField(20);
        userName.setBounds(100, 20, 165, 25);
        panel.add(userName);
        
        hostbtn = new JButton("Host");
        hostbtn.setBounds(100, 80, 165, 25);
        hostbtn.addActionListener(this);
        panel.add(hostbtn);
        
        
        joinbtn = new JButton("Join");
        joinbtn.setBounds(100, 110, 165, 25);
        joinbtn.addActionListener(this);
        panel.add(joinbtn); 
        
        frame.setVisible(true);
    }
    
    
    @Override
    public void actionPerformed(ActionEvent e) {
        if (e.getSource() == hostbtn) {
            GUI lobby = new GUI();
            lobby.lobbyGUI();
            
            System.out.println("Host Button Clicked");
        } else if (e.getSource() == joinbtn) {
            
            
            lobbyPop.show(popupFrame, 200, 200);
            
            System.out.println("Join Button Clicked");
        } else if (e.getSource() == joinGameBtn) {
            lobbyGUI();
        }
    }

    private JFrame popupFrame;
    private JLabel popupLabel;
    private JPanel popupPanel;
    private JTextField popupText;
    private JButton joinGameBtn;
    private JPopupMenu lobbyPop;
    
    public void joinGUI() {
        //JMenuItem menuLobby = new JMenuItem();
        popupFrame = new JFrame("Popup");
        popupFrame.setSize(300, 300);
        popupFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        popupPanel = new JPanel();

        joinGameBtn = new JButton("Enter Lobby");
        joinGameBtn.addActionListener(this);

        lobbyPop = new JPopupMenu("Enter Lobby Code");
  
        // add button and label to frame 
        popupPanel.add(joinGameBtn); 
        popupPanel.add(popupLabel); 
  
        popupFrame.add(popupPanel); 
        popupFrame.show(); 

        System.out.println("Enter Lobby Code");
    }

    public void lobbyGUI() {
        
        
        System.out.println("In the Lobby");
    }
    
    public void gameGUI () {
        
    }
}