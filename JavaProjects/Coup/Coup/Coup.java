package Coup;

import java.util.ArrayList;
import java.util.Scanner;
import java.util.Random;

import java.awt.Toolkit;
import java.awt.Dimension;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyEvent;
import java.awt.Point;
import java.awt.event.KeyListener;
import java.awt.event.KeyEvent;

import javax.swing.JFrame;
import javax.swing.Timer;

public class Coup implements ActionListener, KeyListener {
    public static Coup coup;
    public JFrame jframe;
    public Board board;

    // Deck Constructor
    public final String cards[] = {
        "Duke", "Duke", "Duke", 
        "Contessa", "Contessa", "Contessa",
        "Assassin", "Assassin", "Assassin",
        "Captain", "Captain", "Captain",
        "Ambassador", "Ambassador", "Ambassador"
    };
    public static void main(String[] args) {
        coup = new Coup();
        
    }

    Dimension dim;
    
    // This creates the dimensions of the program
    public Coup() {
        dim = Toolkit.getDefaultToolkit().getScreenSize();
        jframe = new JFrame("Coup");
        jframe.setVisible(true);
        jframe.setSize(800, 700);
        jframe.setLocation(dim.width / 2 - jframe.getWidth() / 2, dim.width 
            / 2 - jframe.getHeight() / 2);
        jframe.add(board = new Board());
        jframe.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    }

    @Override
    public void keyTyped(KeyEvent e) {
        // TODO Auto-generated method stub

    }

    @Override
    public void keyPressed(KeyEvent e) {
        // TODO Auto-generated method stub

    }

    @Override
    public void keyReleased(KeyEvent e) {
        // TODO Auto-generated method stub

    }

    @Override
    public void actionPerformed(ActionEvent e) {
        // TODO Auto-generated method stub

    }
}