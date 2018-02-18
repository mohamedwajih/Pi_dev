/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mysoulmatematching;

import Entities.Matching;
import Entities.Personnalite;
import Entities.Preference;
import Entities.Question;
import Services.SMatching;
import Services.SPersonnalite;
import Services.SPreference;
import Services.SQuestion;

/**
 *
 * @author Fatma
 */
public class MySoulmateMatching {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        SPersonnalite sp= new SPersonnalite();
        sp.ajouterPourcentage("sensible", 25, 1);
    }
    
}
