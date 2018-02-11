/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mysoulmatematching;

import Entities.Matching;
import Entities.Personnalite;
import Entities.Preference;
import Services.SMatching;
import Services.SPersonnalite;
import Services.SPreference;

/**
 *
 * @author Fatma
 */
public class MySoulmateMatching {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
       Personnalite pe1= new Personnalite(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
        SPersonnalite spe1= new SPersonnalite();
        //spe1.ajouter(pe1);
        //System.out.println(spe1.lister(1));
        Preference pr1= new Preference(1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2);
        SPreference spr1= new SPreference();
        //spr1.ajouter(pr1);
        //System.out.println(spr1.lister(1));
        Matching m1= new Matching(1,2,100);
        SMatching sm1= new SMatching();
        System.out.println(sm1.match(2));
    }
    
}
