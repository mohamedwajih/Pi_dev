/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Presentation;

import java.io.IOException;
import java.net.URL;
import java.util.ResourceBundle;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Alert;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.PasswordField;
import javafx.scene.control.TextField;
import javafx.scene.image.ImageView;
import javafx.stage.Stage;

/**
 * FXML Controller class
 *
 * @author Fatma
 */
public class BienvenueController implements Initializable {

    @FXML
    private Label labelquestion;
    @FXML
    private ImageView coeur;
    @FXML
    private PasswordField password;
    @FXML
    private TextField login;

    /**
     * Initializes the controller class.
     */
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        
    }    

    @FXML
    private void login(ActionEvent event) throws IOException {
        if(login.getText().compareTo("admin")==0 && password.getText().compareTo("admin")==0 )
        {
            Parent root = FXMLLoader.load(getClass().getResource("/Presentation/Questions.fxml"));
        Scene scene = new Scene(root);
        Stage stage = new Stage();
        stage.setScene(scene);
        stage.show();
        Stage currentStage= (Stage) login.getScene().getWindow();
        currentStage.close();
        }
        else if(login.getText().compareTo("fatma")==0 && password.getText().compareTo("fatma")==0)
        {
            Parent root = FXMLLoader.load(getClass().getResource("/Presentation/TestPersonnalite.fxml"));
        Scene scene = new Scene(root);
        Stage stage = new Stage();
        stage.setScene(scene);
        stage.show();
         Stage currentStage= (Stage) login.getScene().getWindow();
        currentStage.close();
        }
        else
        {
            bulleloginfalse();
        }
    }
    private void bulleloginfalse() {
        
        Alert alert = new Alert(Alert.AlertType.ERROR);
        alert.setTitle("Erreur authentification");
        alert.setHeaderText("Erreur authentification");
        alert.setContentText("Vérifiez votre login/mot de passe!");
 
        alert.showAndWait();
    }
}
