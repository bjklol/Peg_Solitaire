note
	description: "Summary description for {COMMAND_MOVE_LEFT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	COMMAND_MOVE_RIGHT

inherit
	COMMAND

create
	make

feature -- operations of the command
	execute
		do
			current.game.move_right(row,column)
		end

	undo
		do
			game.undo_move_right (row, column)
		end

	redo
		do
			execute
		end
end
