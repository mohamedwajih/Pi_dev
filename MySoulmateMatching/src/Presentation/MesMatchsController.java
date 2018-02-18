/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Presentation;

import Entities.Matching;
import Entities.Question;
import Services.SMatching;
import Services.SQuestion;
import Services.SUser;

import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.ResourceBundle;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.TextField;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.input.KeyEvent;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.Pane;

/**
 * FXML Controller class
 *
 * @author Fatma
 */
public class MesMatchsController implements Initializable {

    @FXML
    private Label labelmatch;
    @FXML
    private ImageView photo;
    @FXML
    private Label nom;
    @FXML
    private Label age;
    @FXML
    private Label adresse;
    @FXML
    private ImageView imagecoeur2;
    @FXML
    private Label pourcent;
    int id = 2;
    @FXML
    private Label prenom;
   
    SMatching sm = new SMatching();
    SUser su = new SUser();
    @FXML
    private Label nbmatchs;
    @FXML
    private Label labelselection;
    List<Matching> matchs = new ArrayList<>(sm.listerOne(id));
    int compteur=0;

    /**
     * Initializes the controller class.
     */
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        System.out.println("Path="+su.getUserById(matchs.get(compteur).getIdUser2()).getPhoto_de_profil());
        nom.setText(su.getUserById(matchs.get(0).getIdUser2()).getNom());
        prenom.setText(su.getUserById(matchs.get(0).getIdUser2()).getPrenom());
        age.setText(su.getUserById(matchs.get(0).getIdUser2()).getAge() + " ans");
        adresse.setText(su.getUserById(matchs.get(0).getIdUser2()).getAdresse());
       Image i = new Image(su.getUserById(matchs.get(0).getIdUser2()).getPhoto_de_profil());
       photo.setImage(i);
nbmatchs.setText(matchs.size()+" Matchs pour \n"+su.getUserById(id).getNom()+" "+su.getUserById(id).getPrenom());
pourcent.setText(matchs.get(0).getPourcentage()+" %");

    }

    @FXML
    private void Like(ActionEvent event) {
        
    }

    @FXML
    private void Dislike(ActionEvent event) {

    }
@FXML
    private void Next(MouseEvent event) {
        System.out.println("Clicked!");
      
        System.out.println("compteur="+compteur);
        if(compteur<matchs.size()){compteur++;
         nom.setText(su.getUserById(matchs.get(compteur).getIdUser2()).getNom());
        prenom.setText(su.getUserById(matchs.get(compteur).getIdUser2()).getPrenom());
        age.setText(su.getUserById(matchs.get(compteur).getIdUser2()).getAge() + " ans");
        adresse.setText(su.getUserById(matchs.get(compteur).getIdUser2()).getAdresse());
            
        Image i = new Image(su.getUserById(matchs.get(compteur).getIdUser2()).getPhoto_de_profil());
        photo.setImage(i);
        pourcent.setText(matchs.get(compteur).getPourcentage()+" %");
          
        }
        else if (compteur>matchs.size()) {compteur=0;
         nom.setText(su.getUserById(matchs.get(compteur).getIdUser2()).getNom());
        prenom.setText(su.getUserById(matchs.get(compteur).getIdUser2()).getPrenom());
        age.setText(su.getUserById(matchs.get(compteur).getIdUser2()).getAge() + " ans");
        adresse.setText(su.getUserById(matchs.get(compteur).getIdUser2()).getAdresse());
            
        Image i = new Image(su.getUserById(matchs.get(compteur).getIdUser2()).getPhoto_de_profil());
        photo.setImage(i);
        pourcent.setText(matchs.get(compteur).getPourcentage()+" %");
        
        }
    }



    @FXML
    private void Previous(MouseEvent event) {
         System.out.println("Clicked!");
       
        System.out.println("compteur="+compteur);
        if(compteur<matchs.size()){ compteur--;
         nom.setText(su.getUserById(matchs.get(compteur).getIdUser2()).getNom());
        prenom.setText(su.getUserById(matchs.get(compteur).getIdUser2()).getPrenom());
        age.setText(su.getUserById(matchs.get(compteur).getIdUser2()).getAge() + " ans");
        adresse.setText(su.getUserById(matchs.get(compteur).getIdUser2()).getAdresse());
        Image i = new Image(su.getUserById(matchs.get(compteur).getIdUser2()).getPhoto_de_profil());
        photo.setImage(i);
        pourcent.setText(matchs.get(compteur).getPourcentage()+" %");
      
        }
         else if(compteur<1)
        {
            compteur=matchs.size();
             nom.setText(su.getUserById(matchs.get(compteur).getIdUser2()).getNom());
        prenom.setText(su.getUserById(matchs.get(compteur).getIdUser2()).getPrenom());
        age.setText(su.getUserById(matchs.get(compteur).getIdUser2()).getAge() + " ans");
        adresse.setText(su.getUserById(matchs.get(compteur).getIdUser2()).getAdresse());
            
        Image i = new Image(su.getUserById(matchs.get(compteur).getIdUser2()).getPhoto_de_profil());
        photo.setImage(i);
        pourcent.setText(matchs.get(compteur).getPourcentage()+" %");
        }
    }
}
