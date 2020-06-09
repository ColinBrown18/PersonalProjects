package Snake;

import java.awt.Toolkit;
import java.awt.Dimension;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JFrame;
import javax.swing.Timer;

public class Snake implements ActionListener{

    public JFrame jframe;
    public RenderPanel renderPanel;
    public Timer timer = new Timer(20, this);
    public static Snake snake;


    // This creates the dimensions of the program
    public Snake() {
        Dimension dim = Toolkit.getDefaultToolkit().getScreenSize();
        jframe = new JFrame("Snake");
        jframe.setVisible(true);
        jframe.setSize(800, 700);
        jframe.setLocation(dim.width / 2 - jframe.getWidth() / 2, dim.width 
            / 2 - jframe.getHeight() / 2);
        jframe.add(renderPanel = new RenderPanel());
        jframe.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        timer.start();
    }

    public static void main(final String[] args) {
        snake = new Snake();
    }

    @Override
    public void actionPerformed(ActionEvent arg0) {
        renderPanel.repaint();
    }
}