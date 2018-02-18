/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Presentation;

import Entities.Question;
import Services.SQuestion;
import Util.util;

import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.ResourceBundle;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Alert;
import javafx.scene.control.Button;
import javafx.scene.control.ChoiceBox;
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
import javafx.stage.Stage;
import static javax.management.Query.value;


/**
 * FXML Controller class
 *
 * @author Fatma
 */
public class QuestionsController implements Initializable {

    @FXML
    private TableView<Question> tvquestions;
    @FXML
    private TableColumn question;
    @FXML
    private TableColumn type;
    @FXML
    private TableColumn trait;
    @FXML
    private TableColumn reponse1;
    @FXML
    private TableColumn reponse2;
    @FXML
    private TableColumn reponse3;
    @FXML
    private Button ajouter;
    @FXML
    private TextField texterecherche;
    @FXML
    private Button valider;
    @FXML
    private Button supprimer;
    @FXML
    private Label nbquestions;
    @FXML
    private Label labelquestion;
    @FXML
    private Pane pane;
    @FXML
    private TextField question1;
    @FXML
    private TextField trait1;
    @FXML
    private TextField reponse11;
    @FXML
    private TextField reponse21;
    @FXML
    private TextField reponse31;
    @FXML
    private Label questionlabel;
    @FXML
    private Label traitlabel;
    @FXML
    private Label reponse1label;
    @FXML
    private Label reponse2label;
    @FXML
    private Label reponse3label;
    @FXML
    private Button modifier;
    @FXML
    private TextField type1;
    @FXML
    private Label typelabel;
    @FXML
    private ImageView imagecoeur1;
    @FXML
    private ImageView imagecoeur3;
    @FXML
    private ImageView imagecoeur4;
    @FXML
    private ImageView imagecoeur2;
    @FXML
    private Label labelselection;

    /**
     * Initializes the controller class.
     */
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        refresh();
        pane.setVisible(false);
        labelselection.setVisible(true);

        tvquestions.setOnMousePressed(new EventHandler<MouseEvent>() {
            @Override
            public void handle(MouseEvent event) {
                if (event.isPrimaryButtonDown()) {
                    Question q = tvquestions.getSelectionModel().getSelectedItem();
                    pane.setVisible(true);
                    question1.setText(q.getQuestion());
                    type1.setText(q.getType());
                    trait1.setText(q.getTrait());
                    reponse11.setText(q.getReponse1());
                    reponse21.setText(q.getReponse2());
                    reponse31.setText(q.getReponse3());
                    labelselection.setVisible(false);
                }
            }
        });

    }

    @FXML
    private void ajoutQuestion(ActionEvent event) throws IOException {
        Parent root = FXMLLoader.load(getClass().getResource("/Presentation/ajoutQuestion.fxml"));
        Scene scene = new Scene(root);
        Stage stage = new Stage();
        stage.setScene(scene);
        stage.show();
    }

    @FXML
    private void rechercheQuestion(ActionEvent event) {
        String champsrecherche = texterecherche.getText();
        ObservableList<Question> QuestionData = FXCollections.observableArrayList();
        SQuestion sq = new SQuestion();
        List<Question> listeq = new ArrayList<Question>();
        listeq = sq.rechercher(champsrecherche);
        QuestionData.addAll(listeq);
        question.setCellValueFactory(new PropertyValueFactory<Question, String>("question"));
        type.setCellValueFactory(new PropertyValueFactory<Question, String>("type"));
        trait.setCellValueFactory(new PropertyValueFactory<Question, String>("trait"));
        reponse1.setCellValueFactory(new PropertyValueFactory<Question, String>("reponse1"));
        reponse2.setCellValueFactory(new PropertyValueFactory<Question, String>("reponse2"));
        reponse3.setCellValueFactory(new PropertyValueFactory<Question, String>("reponse3"));
        tvquestions.setItems(QuestionData);
        nbquestions.setText(listeq.size() + " Questions");
        pane.setVisible(false);
        labelselection.setVisible(true);

    }

    @FXML
    private void supprimerQuestion(ActionEvent event) {
        if (tvquestions.getSelectionModel().getSelectedItem() != null) {
            Question selectedQuestion = tvquestions.getSelectionModel().getSelectedItem();
            SQuestion sq = new SQuestion();
            sq.supprimer(selectedQuestion.getQuestion());
            refresh();
            bullesupprimer();

        }
    }

    private void bullesupprimer() {

        Alert alert = new Alert(Alert.AlertType.INFORMATION);
        alert.setTitle("Question supprimée");
        alert.setHeaderText("Question supprimée");
        alert.setContentText("Votre question a été supprimée avec succès!");

        alert.showAndWait();
    }
private void bullemodifier() {

        Alert alert = new Alert(Alert.AlertType.INFORMATION);
        alert.setTitle("Question modifiée");
        alert.setHeaderText("Question modifiée");
        alert.setContentText("Votre question a été modifiée avec succès!");

        alert.showAndWait();
    }
private void bullenonmodifiiee() {

        Alert alert = new Alert(Alert.AlertType.ERROR);
        alert.setTitle("Question non modifiée");
        alert.setHeaderText("Question non modifiée");
        alert.setContentText("Votre question n'a pas été modifiée!");

        alert.showAndWait();
    }
    private void refresh() {
        ObservableList<Question> QuestionData = FXCollections.observableArrayList();
        List<Question> listeq = new ArrayList<Question>();
        SQuestion sq = new SQuestion();
        listeq = sq.listerAll();
        QuestionData.addAll(listeq);
        question.setCellValueFactory(new PropertyValueFactory<Question, String>("question"));
        type.setCellValueFactory(new PropertyValueFactory<Question, String>("type"));
        trait.setCellValueFactory(new PropertyValueFactory<Question, String>("trait"));
        reponse1.setCellValueFactory(new PropertyValueFactory<Question, String>("reponse1"));
        reponse2.setCellValueFactory(new PropertyValueFactory<Question, String>("reponse2"));
        reponse3.setCellValueFactory(new PropertyValueFactory<Question, String>("reponse3"));
        tvquestions.setItems(QuestionData);
        nbquestions.setText(listeq.size() + " Questions");

    }

    @FXML
    private void modifierQuestion(ActionEvent event) {
        Question q= new Question();
        q.setQuestion(question1.getText());
        q.setType(type1.getText());
        q.setTrait(trait1.getText());
        q.setReponse1(reponse11.getText());
        q.setReponse2(reponse21.getText());
        q.setReponse3(reponse31.getText());
        SQuestion sq = new SQuestion();
        sq.modifier(q, tvquestions.getSelectionModel().getSelectedItem().getQuestion());
        refresh();
    }

    @FXML
    private void rechercheAjax(KeyEvent event) {
        String champsrecherche = texterecherche.getText();
        ObservableList<Question> QuestionData = FXCollections.observableArrayList();
        SQuestion sq = new SQuestion();
        List<Question> listeq = new ArrayList<Question>();
        listeq = sq.rechercher(champsrecherche);
        QuestionData.addAll(listeq);
        question.setCellValueFactory(new PropertyValueFactory<Question, String>("question"));
        type.setCellValueFactory(new PropertyValueFactory<Question, String>("type"));
        trait.setCellValueFactory(new PropertyValueFactory<Question, String>("trait"));
        reponse1.setCellValueFactory(new PropertyValueFactory<Question, String>("reponse1"));
        reponse2.setCellValueFactory(new PropertyValueFactory<Question, String>("reponse2"));
        reponse3.setCellValueFactory(new PropertyValueFactory<Question, String>("reponse3"));
        tvquestions.setItems(QuestionData);
        nbquestions.setText(listeq.size() + " Questions");
        pane.setVisible(false);
        labelselection.setVisible(true);
    }
    

}
