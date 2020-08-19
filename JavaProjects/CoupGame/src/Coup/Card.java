package Coup;

import java.util.Random;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class Card implements Comparable<Card>{
    /*
    
    Card card represents all the different types of cards available

    CARDS
    Duke - tax/block foreign aid
    Contessa - block assassination
    Assassin - assissinate
    Captain - steal/blocks steal
    Amassador - exchange/blocks steal

    */
    private Card() {

    }

    public enum CardName {
        DUKE, ASSASSIN, CONTESSA, CAPTAIN, AMBASSADOR
    }

    private CardName cdName;

    public CardName getCdName() {
        return cdName;
    }

    public static List<Card> getPackOfCards() {
        List<Card> crdList = new ArrayList<Card>();

        for (CardName names: CardName.values()) {
            Card cd = new Card();
            cd.cdName = names;
            crdList.add(cd);
        }
        return crdList;
    }
    
    public static void shuffleCards(List<Card> cards) {
        Collections.shuffle(cards);
    }

    // Not sure how the compare to will work
    @Override
    public int compareTo (Card o) {
        if(this.getCdName() == o.getCdName()) {
            return 0;
        }  else {
            return -1;
        }
    }

}