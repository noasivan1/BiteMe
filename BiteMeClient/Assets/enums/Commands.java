package enums;

/**
 * This enum defines various commands for communication between client and server.
 * 
 * @author yosra
 */
public enum Commands {

	ClientConnect, // command to indicates client connection.
	ClientDisconnect, // command to indicate client disconnection
	terminate, // command that calls for client disconnection
	getRestaurantOrders, // command that request all Restaurant Pending Orders data From DB by restaurant
							// ID through Server, for Employee screen
	setRestaurantOrders, // command that tells Client to update Restaurant Pending Orders data From DB by
							// restaurant ID to the Employee screen
	updateRestaurantOrderToStatus, // command that request to update order status in DB table restaurant orders
	CheckUsername, // command for Login Process
	UpdateLoginStatus, // command for updating login status
	LogoutUser, // command for logging out
	UpdateStatus, // command for updating customer status
	getPendingOrders, // command for customer to approve receiving order
	CheckStatus, // command for checking customer status
	UpdateCustomerOrdersStatus, // command for updating customer orders
	UpdateCredit, // command for updating credit if late delivery
	updateRestaurantOrderStatus, // command from restaurant to update order status
	updateCoustomerToContactByCoustomerId, // command from restaurant to update coustomerToContact to send them SMS &
											// Email
	updateRestaurantOrdersTable, // command to tell the employee controller to update restaurant orders table
	OrderReport, // command for orders report
	getIncomeReport, // command from branch manager to get Income Report from DB
	setIncomeReport, // command from server to manager to set Income Report from DB
	getPerformanceReport, // command for creating and getting performance report
	RestaurantQuarterReport1, // command for viewing restaurant quarter report
	GetRestaurantDishes, // command for updating menu
	GetRestaurantNum, // command for updating menu
	GetRestaurantName, // command for updating menu
	AddDish, // command for updating menu
	DeleteDish, // command for updating menu
	UpdateDishPrice, // command for updating menu
	CheckDishExists, // command for updating menu
	updateBegin, // command for updating menu
	EndUpdate,// command for updating menu
    getRestaurantList,
    gotMyRestaurantList,
    getRestaurantMenu, //command to get restaurant menu
    gotMyRestaurantMenu,
    getCustomerDetails,
    gotMyCustomerDetails,
    getUpdateTimes,
    RestaurantQuarterIncomeReport, //command for generating quarter reports
    RestaurantQuarterReport2, //command for generating quarter reports
    RestaurantQuarterIncomeReport1, //command for generating income reports
    RestaurantQuarterReport3, //command for generating quarter reports
    RestaurantQuarterIncomeReport2,//command for generating income reports
    sendCustomerOrder,
    updateCustomerCredit,
    updatedCustomerCredit

}
