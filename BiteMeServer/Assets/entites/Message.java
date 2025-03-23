package entites;

import java.io.Serializable;

import enums.Commands;

/**
 * Represents a message containing an object and a command.
 * This class is used to encapsulate a command along with its associated data
 * for communication between different parts of the application.
 * It implements Serializable to allow its objects to be serialized.
 * 
 * @author yosra
 */
public class Message implements Serializable {

	/**
     * A unique identifier for the serialization runtime to associate with the Message class.
     * This value ensures that a deserialized object is compatible with the current class definition.
     */
	private static final long serialVersionUID = 1L;

	/**
     * The object associated with the message, which may contain data relevant to the command.
     */
	private Object obj;
	
	/**
     * The command associated with the message, representing an action to be performed.
     */
	private Commands cmd;

	/**
     * Constructs a new Message object with the specified object and command.
     * 
     * @param obj The object associated with the message.
     * @param cmd The command associated with the message.
     */
	public Message(Object obj, Commands cmd) {
		this.obj = obj;
		this.cmd = cmd;
	}

	/**
     * Returns the object associated with the message.
     * 
     * @return The object associated with the message.
     */
	public Object getObj() {
		return obj;
	}

	 /**
     * Sets the object associated with the message.
     * 
     * @param obj The object to associate with the message.
     */
	public void setObj(Object obj) {
		this.obj = obj;
	}

	/**
     * Returns the command associated with the message.
     * 
     * @return The command associated with the message.
     */
	public Commands getCmd() {
		return cmd;
	}

	/**
     * Sets the command associated with the message.
     * 
     * @param cmd The command to associate with the message.
     */
	public void setCmd(Commands cmd) {
		this.cmd = cmd;
	}
}
