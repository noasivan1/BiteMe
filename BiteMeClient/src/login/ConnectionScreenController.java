package login;

import client.ClientController;

import java.net.ConnectException;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.TextField;
import javafx.stage.Stage;
import javafx.scene.control.Label;

/**
 * Controller class for the connection screen of the application. Manages user
 * interactions with the connection screen and initiates a connection to the
 * server. This class handles the validation of the IP address and port input,
 * and transitions to the login screen upon successful connection.
 * 
 * @author yosra
 */
public class ConnectionScreenController {

	@FXML
	private Button btnConnect;

	@FXML
	private TextField ipAddressT;

	@FXML
	private TextField portT;

	@FXML
	private Label errorIPLabel;

	/**
	 * Initializes the connection screen controller. Disables the connect button
	 * initially and adds listeners to enable/disable it based on input validation.
	 */
	public void initialize() {
		// Disable the Connect button initially
		btnConnect.setDisable(true);

		// Add listeners to the TextFields to enable/disable the Connect button
		ipAddressT.textProperty().addListener((observable, oldValue, newValue) -> validateInput());
		portT.textProperty().addListener((observable, oldValue, newValue) -> validateInput());
	}

	/**
	 * Validates the input fields and enables/disables the connect button
	 * accordingly. The connect button is enabled only if both the IP address and
	 * port number fields are non-empty.
	 */
	private void validateInput() {
		String ip = ipAddressT.getText();
		String port = portT.getText();
		boolean isIpValid = ip != null && !ip.trim().isEmpty();
		boolean isPortValid = port != null && !port.trim().isEmpty();

		// Enable the Connect button only if both fields are non-empty
		btnConnect.setDisable(!(isIpValid && isPortValid));
	}

	/**
	 * Starts the JavaFX application by setting up the primary stage with the
	 * connection screen.
	 * 
	 * @param primaryStage the primary stage for this application, onto which the
	 *                     application scene can be set
	 * @throws Exception if the FXML file cannot be loaded
	 */
	public void start(Stage primaryStage) throws Exception {
		FXMLLoader loader = new FXMLLoader(getClass().getResource("/login/ConnectionScreen.fxml"));
		Parent root = loader.load();
		Scene scene = new Scene(root);
		primaryStage.setTitle("BiteMeClient");
		primaryStage.setScene(scene);
		primaryStage.show();
	}

	/**
	 * Gets the IP address from the input field.
	 * 
	 * @return the IP address entered by the user
	 */
	private String getIpAddress() {
		return ipAddressT.getText();
	}

	/**
	 * Gets the port number from the input field.
	 * 
	 * @return the port number entered by the user
	 */
	private Integer getPort() {
		return Integer.valueOf(portT.getText());
	}

	/**
	 * Handles the action event for the connect button. Initiates a connection to
	 * the server with the provided IP address and port. If the connection is
	 * successful, it transitions to the login screen. If the connection fails, an
	 * error message is displayed.
	 * 
	 * @param event The action event generated by clicking the connect button.
	 */
	@FXML
	void getBtnConnect(ActionEvent event) {
		try {
			ClientController clientController = new ClientController(getIpAddress(), getPort());
			clientController.display("Connected");

			// Move to the login screen only if the connection is successful
			((Node) event.getSource()).getScene().getWindow().hide();
			LoginScreenController newScreen = new LoginScreenController();
			newScreen.start(new Stage());

		} catch (ConnectException e) {
			errorIPLabel.setVisible(true);
			System.out.println("Unable to connect to the IP address");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
