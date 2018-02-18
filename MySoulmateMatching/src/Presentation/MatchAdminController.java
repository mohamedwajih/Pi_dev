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
import javafx.scene.image.ImageView;
import javafx.scene.input.InputMethodEvent;
import javafx.scene.input.KeyEvent;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.Pane;

/**
 * FXML Controller class
 *
 * @author Fatma
 */
public class MatchAdminController implements Initializable {

    @FXML
    private TextField texterecherche;
    @FXML
    private Label labelmatch;
    @FXML
    private Label nbmatchs;
    @FXML
    private Pane pane;
    @FXML
    private ImageView imagecoeur3;
    @FXML
    private ImageView imagecoeur4;
    @FXML
    private ImageView imagecoeur1;
    @FXML
    private ImageView imagecoeur2;
    @FXML
    private Label labelselection;
    @FXML
    private TableView<Matching> tvmatchs;
    @FXML
    private TableColumn<Matching, Integer> user1;
    @FXML
    private TableColumn<Matching, Integer> user2;
    @FXML
    private TableColumn<Matching, Integer> pourcentage;
    
    /**
     * Initializes the controller class.
     */
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        refresh();
        pane.setVisible(false);
        labelselection.setVisible(true);
        
        tvmatchs.setOnMousePressed(new EventHandler<MouseEvent>() {
            @Override
            public void handle(MouseEvent event) {
                if (event.isPrimaryButtonDown()) {
                    Matching m = tvmatchs.getSelectionModel().getSelectedItem();
                    pane.setVisible(true);
                    
                    labelselection.setVisible(false);
                }
            }
        });

    }    

    
    private void refresh() {
        ObservableList<Matching> MatchingData = FXCollections.observableArrayList();
        List<Matching> listeq = new ArrayList<Matching>();
        SMatching sq = new SMatching();
        listeq = sq.listerAll();
        MatchingData.addAll(listeq);
        user1.setCellValueFactory(new PropertyValueFactory<Matching, Integer>("idUser1"));
        user2.setCellValueFactory(new PropertyValueFactory<Matching, Integer>("idUser2"));
        pourcentage.setCellValueFactory(new PropertyValueFactory<Matching, Integer>("pourcentage"));
       
        tvmatchs.setItems(MatchingData);
        nbmatchs.setText(listeq.size() + " Matchs");

    }
    
    @FXML
    private void rechercheMatchs(KeyEvent event) {
        System.out.println("TEXT="+texterecherche.getText());
        int champsrecherche = Integer.parseInt(texterecherche.getText());
        
        ObservableList<Matching> MatchingData = FXCollections.observableArrayList();
        SMatching sq = new SMatching();
        List<Matching> listeq = new ArrayList<Matching>();
        listeq = sq.listerOne(champsrecherche);
        MatchingData.addAll(listeq);
        user1.setCellValueFactory(new PropertyValueFactory<Matching, Integer>("idUser1"));
        user2.setCellValueFactory(new PropertyValueFactory<Matching, Integer>("idUser2"));
        pourcentage.setCellValueFactory(new PropertyValueFactory<Matching, Integer>("pourcentage"));
        
        tvmatchs.setItems(MatchingData);
        nbmatchs.setText(listeq.size() + " Matchs");
        pane.setVisible(false);
        labelselection.setVisible(true);
    }

    @FXML
    private void rechercheMatchs(InputMethodEvent event) {
    }
}
