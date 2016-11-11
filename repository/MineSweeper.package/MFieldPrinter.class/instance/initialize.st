initialization
initialize
	super initialize.
	self writeStream: (WriteStream on: String new)