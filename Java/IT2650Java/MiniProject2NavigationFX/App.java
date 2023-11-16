package com.mycompany.miniproject2navigationfx;

import javafx.application.Application;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.CheckBox;
import javafx.scene.control.Label;
import javafx.scene.control.ListView;
import javafx.scene.control.TextField;
import javafx.scene.layout.AnchorPane;
import javafx.stage.Stage;


public class App extends Application {

    @Override
    public void start(Stage stage) {
        /// Vehicle Creation scene Variables
        Label BuildTardisLabel = new Label("Let's build us a Tardis");
        Label MaxFuelCapLabel = new Label("Maximum Fuel Capacity");
        Label MpgLabel = new Label("Miles Per Gallon");
        Label BuildVehicleStatusLabel = new Label("Awaiting Input");
        TextField MaxFuelCapTextField = new TextField();
        TextField MpgTextField = new TextField();
        Button BuildVehicleButton = new Button("Build Vehicle");
        AnchorPane VehicleCreationPane = new AnchorPane();
        /// End of vehicle creation vars
        
        /// Travel Scene setup vars
        
        ListView<Location> LocationListView = new ListView();
        AnchorPane TravelPane = new AnchorPane();
        Label GasFillDisplay = new Label("");
        Label LocationLabel = new Label("");
        Label ActionStatus = new Label("");
        Button RefillButton = new Button("Refill");
        Button TravelButton = new Button("Travel");
        Button ShapeTheLandButton = new Button("Reshape the land");
        
        ///// End Travel Scene setup vars
        
        
        //// Terrain Editing Pane vars
        AnchorPane TerrainEditingPane = new AnchorPane();
        Button ReturnToTravelsButton = new Button("Return to your travels");
        Button ObliterateButton = new Button("Obliterate");
        ObliterateButton.getStyleClass().add("Obliterate");
        Label TerainChangeStatus = new Label("");
        TextField LocationNameField = new TextField();
        Label NamePromptLabel = new Label("Name the land you wish to create");
        TextField XPromptField = new TextField();
        TextField YPromptField = new TextField();
        Label XPromptLabel = new Label("X");
        Label YPromptLabel = new Label("Y");
        Label HasGasPromptLabel = new Label("has gas?");
        CheckBox HasGasCheckBox = new CheckBox();
        Button GeneratePlaceButton = new Button("Generate Location");
        
        //// End Terrain Editing Pane vars
        LocationListView.getItems().add(new Location("Cleveland",0,0,true));
        LocationListView.getItems().add(new Location("North Pole",500, -100, true));
        LocationListView.getItems().add(new Location("Campbell Hill", -50, -50, false));
        LocationListView.getItems().add(new Location("Tokyo", -100, 1000, true));
        LocationListView.getItems().add(new Location("Chicago", -200, 75,true));
        LocationListView.getItems().add(new Location("Erie PA", 150, 0, true));
        LocationListView.getItems().add(new Location("Allegheny Nation Forest", 300, -75, false));
        
        Vehicle Tardis = new Vehicle(LocationListView.getItems().get(0));
       
        ////////Vehicle Creation Pane, anchor and fill.
        AnchorPane.setTopAnchor(BuildTardisLabel, 10.0);
        AnchorPane.setLeftAnchor(BuildTardisLabel, 10.0);
        AnchorPane.setTopAnchor(MaxFuelCapLabel, 30.0);
        AnchorPane.setLeftAnchor(MaxFuelCapLabel, 10.0);
        AnchorPane.setTopAnchor(MpgLabel, 30.0);
        AnchorPane.setLeftAnchor(MpgLabel, 180.0);
        AnchorPane.setTopAnchor(MaxFuelCapTextField, 50.0);
        AnchorPane.setLeftAnchor(MaxFuelCapTextField, 10.0);
        AnchorPane.setTopAnchor(MpgTextField, 50.0);
        AnchorPane.setLeftAnchor(MpgTextField, 180.0);
        AnchorPane.setTopAnchor(BuildVehicleButton, 50.0);
        AnchorPane.setLeftAnchor(BuildVehicleButton, 330.0);
        AnchorPane.setTopAnchor(BuildVehicleStatusLabel, 80.0);
        AnchorPane.setLeftAnchor(BuildVehicleStatusLabel, 10.0);
        
        VehicleCreationPane.getChildren().addAll(BuildTardisLabel,MaxFuelCapTextField,MpgTextField,MaxFuelCapLabel,MpgLabel,BuildVehicleButton,BuildVehicleStatusLabel);
        /////////////End Vehicle creation pane.
        
        ////////////Travel Screen pane
        AnchorPane.setTopAnchor(LocationListView, 30.0);
        AnchorPane.setLeftAnchor(LocationListView, 10.0);
        AnchorPane.setTopAnchor(GasFillDisplay, 10.0);
        AnchorPane.setLeftAnchor(GasFillDisplay, 10.0);
        AnchorPane.setTopAnchor(LocationLabel, 10.0);
        AnchorPane.setLeftAnchor(LocationLabel, 100.0);
        AnchorPane.setTopAnchor(RefillButton, 430.0);
        AnchorPane.setLeftAnchor(RefillButton, 360.0);
        AnchorPane.setTopAnchor(TravelButton, 430.0);
        AnchorPane.setLeftAnchor(TravelButton, 300.0);
        AnchorPane.setTopAnchor(ActionStatus, 430.0);
        AnchorPane.setLeftAnchor(ActionStatus, 10.0);
        AnchorPane.setTopAnchor(ShapeTheLandButton, 430.0);
        AnchorPane.setLeftAnchor(ShapeTheLandButton, 500.0);
        
        TravelPane.getChildren().addAll(LocationListView, GasFillDisplay,LocationLabel, RefillButton, TravelButton,ActionStatus, ShapeTheLandButton);
        ///////////End Travel Screen Pane
        
        ///////////Terrain Editing Pane
        AnchorPane.setTopAnchor(ReturnToTravelsButton, 430.0);
        AnchorPane.setLeftAnchor(ReturnToTravelsButton, 500.0);
        //ObliterateButton
        AnchorPane.setTopAnchor(ObliterateButton, 430.0);
        AnchorPane.setLeftAnchor(ObliterateButton, 360.0);
        //TerainChangeStatus
        AnchorPane.setTopAnchor(TerainChangeStatus, 430.0);
        AnchorPane.setLeftAnchor(TerainChangeStatus, 10.0);
        //LocationNameField
        AnchorPane.setTopAnchor(LocationNameField, 30.0);
        AnchorPane.setLeftAnchor(LocationNameField, 360.0);
        //NamePromptLabel
        AnchorPane.setTopAnchor(NamePromptLabel, 10.0);
        AnchorPane.setLeftAnchor(NamePromptLabel, 360.0);
        //XPromptField
        AnchorPane.setTopAnchor(XPromptField, 80.0);
        AnchorPane.setLeftAnchor(XPromptField, 280.0);
        //YPromptField
        AnchorPane.setTopAnchor(YPromptField, 80.0);
        AnchorPane.setLeftAnchor(YPromptField, 450.0);
        //XPromptLabel
        AnchorPane.setTopAnchor(XPromptLabel, 65.0);
        AnchorPane.setLeftAnchor(XPromptLabel, 280.0);
        //YPromptLabel
        AnchorPane.setTopAnchor(YPromptLabel, 65.0);
        AnchorPane.setLeftAnchor(YPromptLabel, 450.0);
        
        //HasGasPromptLabel
        AnchorPane.setTopAnchor(HasGasPromptLabel, 120.0);
        AnchorPane.setLeftAnchor(HasGasPromptLabel, 380.0);
        
        //HasGasCheckBox
        AnchorPane.setTopAnchor(HasGasCheckBox, 120.0);
        AnchorPane.setLeftAnchor(HasGasCheckBox, 440.0);
        
        //GeneratePlaceButton
        AnchorPane.setTopAnchor(GeneratePlaceButton, 160.0);
        AnchorPane.setLeftAnchor(GeneratePlaceButton, 380.0);
        
         TerrainEditingPane.getChildren().addAll(ReturnToTravelsButton,ObliterateButton, TerainChangeStatus, LocationNameField, NamePromptLabel, XPromptField,YPromptField,XPromptLabel,YPromptLabel, HasGasPromptLabel,HasGasCheckBox,GeneratePlaceButton);
        ///////////End Terrain Editing Pane
        Scene TerrainEditingScene = new Scene(TerrainEditingPane, 640, 480);
        Scene TravelScene = new Scene(TravelPane, 640, 480);
        Scene VehicleCreationscene = new Scene(VehicleCreationPane, 640, 480);
        //Adding style sheets
        VehicleCreationscene.getStylesheets().add("VehicleCreationStyle.css");
        TravelScene.getStylesheets().add("TravelStyle.css");
        TerrainEditingScene.getStylesheets().add("TerrainStyle.css");
        //End style sheets
        stage.setScene(VehicleCreationscene);
        //stage.setScene(TravelScene);
        stage.show();
        BuildVehicleButton.setOnAction((ActionEvent) -> {BuildVehicleButtonPress(Tardis,MaxFuelCapTextField, MpgTextField,BuildVehicleStatusLabel, stage, TravelScene, GasFillDisplay, LocationLabel);});
        RefillButton.setOnAction(ActionEvent -> {refillButtonPress(Tardis,GasFillDisplay,ActionStatus);});
        TravelButton.setOnAction(ActionEvent -> {travelButtonPress(Tardis,LocationListView,LocationLabel,GasFillDisplay, ActionStatus);});
        ShapeTheLandButton.setOnAction(ActionEvent ->{ShapeTheLandButton(stage,TerrainEditingScene,TerrainEditingPane,LocationListView);});
        ReturnToTravelsButton.setOnAction(ActionEvent -> {ReturnToTravelsButtonPress(stage,LocationListView,TravelScene,TravelPane);});
        ObliterateButton.setOnAction(ActionEvent ->{ObliterateButton(Tardis,LocationListView,TerainChangeStatus);});
        GeneratePlaceButton.setOnAction(ActionEvent -> {GeneratePlaceButtonPress(LocationNameField,XPromptField,YPromptField,HasGasCheckBox,LocationListView,TerainChangeStatus);});
    }

    public static void main(String[] args) {
        launch();
    }
    
    public static void BuildVehicleButtonPress(Vehicle t, TextField FuelCapField, TextField mpg, Label Status, Stage stage, Scene TravelScene, Label GasFillDisplay, Label LocationLabel)
    {
        boolean Failed = false;
            try
         {
           
           t.setMaximumFuelCapacity(Double.parseDouble(FuelCapField.getText()));
           t.setCurrentFuel(t.getMaximumFuelCapacity());
           t.setMpg(Double.parseDouble(mpg.getText()));
         }
            catch (Exception e){
                Status.setText("An error has occured, try again.");
                Failed = true;
            }
            if (Failed != true)
            {
                Status.setText("Vehicle Created Successfully!");
                stage.setScene(TravelScene);
                updateGasLabel(GasFillDisplay, t);
                UpdateLocationLabel(LocationLabel,t);
            }
        
    }
    
    public static void ShapeTheLandButton(Stage stage,Scene TerrainEditingScene,AnchorPane TerrainEditingPane,ListView<Location> LocationListView)
    {
        stage.setScene(TerrainEditingScene);
        TerrainEditingPane.getChildren().addAll(LocationListView);
    }
    
    public static void  ReturnToTravelsButtonPress(Stage stage,ListView<Location> LocationListView,Scene TravelScene,AnchorPane TravelPane)
    {
        TravelPane.getChildren().addAll(LocationListView);
        stage.setScene(TravelScene);
    }
    
    public static void refillButtonPress(Vehicle t, Label GasFillDisplay,Label ActionStatus)
    {
        if(t.Refuel())
        {
            ActionStatus.setText("Your gas tank has been filled");
        }
        else
        {
            ActionStatus.setText("No gas at this location.");
        }
        updateGasLabel(GasFillDisplay,t);
    }
    
    public static void travelButtonPress(Vehicle t,ListView<Location> LocationListView, Label LocatLabel, Label GasFillDisplay, Label ActionStatus)
    {
        boolean Success;
        try
        {
            Success = t.Travelto(LocationListView.getSelectionModel().getSelectedItem());
            if (Success == true)
            {
                ActionStatus.setText("You successfully traveled to "+t.getLocation().getName()+"!");
            }
            else
            {
                ActionStatus.setText("I'm sorry you can't make that journey. Please refuel.");
            }
        }
        catch(Exception e)
        {
            ActionStatus.setText("You gotta go somewhere...");
        }
        
        UpdateLocationLabel(LocatLabel,t);
        updateGasLabel (GasFillDisplay, t);
        
    }
    
    public static void UpdateLocationLabel(Label LocLabel, Vehicle t)
    {
        LocLabel.setText("You are in " + t.getLocation().getName());
    }
    
    public static void updateGasLabel (Label FuelLabel, Vehicle t) 
    {
        FuelLabel.setText("Fuel: "+(Math.round(t.getCurrentFuel()*100)/100.0));
    }
    
    public static void ObliterateButton(Vehicle Tardis,ListView<Location> LocationListView,Label TerainChangeStatus)
    {
        String NameOfTarget;
        try
        {
            NameOfTarget = LocationListView.getSelectionModel().getSelectedItem().getName();
            if (LocationListView.getSelectionModel().getSelectedItem().Distance(Tardis.getLocation()) > 0)
            {
                LocationListView.getItems().remove(LocationListView.getSelectionModel().getSelectedItem());
                TerainChangeStatus.setText(NameOfTarget + " was reduced to ash.");
            }
            else
            {
                TerainChangeStatus.setText("Do you want to die?");
            }
            
        }
        catch (Exception e)
        {
            TerainChangeStatus.setText("You need a target to destroy...");
        }
    }
    
    public static void GeneratePlaceButtonPress(TextField LocationNameField,TextField XPromptField,TextField YPromptField,CheckBox HasGasCheckBox, ListView<Location> LocationListView,Label TerainChangeStatus)
    {
        String IssueMessage = "";
        Boolean IssueDetected = false;
        double x;
        double y;
        
        //Name
        String Name = LocationNameField.getText();
        if (Name.isEmpty())
        {
            IssueDetected = true;
            IssueMessage = "You need a name.";
        }
        
        // x
        try {
        x = Double.parseDouble(XPromptField.getText());
        }
        catch (Exception e)
        {
            x = 0.0;
            IssueDetected = true;
            if(IssueMessage.isEmpty())
            {
                IssueMessage = "X needs to be a number.";
            }
            else
            {
                IssueMessage += " X needs to be a number.";
            }
        }
        
        //Y
        try {y = Double.parseDouble(YPromptField.getText());}
        catch(Exception e)
        {
            y = 0.0;
            IssueDetected = true;
            if(IssueMessage.isEmpty())
            {
                IssueMessage = "Y needs to be a number.";
            }
            else
            {
                IssueMessage += " Y needs to be a number.";
            }
        }
        // hasgas
        boolean gas = HasGasCheckBox.isSelected();
        if (IssueDetected == false)
        {
            LocationListView.getItems().add(new Location(Name,x,y,gas));
            TerainChangeStatus.setText(Name+" has been created.");
        }
        else
        {
            TerainChangeStatus.setText(IssueMessage);
        }
    }
}