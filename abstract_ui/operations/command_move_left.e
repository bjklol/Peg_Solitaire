note
	description: "Summary description for {COMMAND_MOVE_LEFT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	COMMAND_MOVE_LEFT

inherit
	COMMAND

create
	make

feature -- operations of the command
	execute
		do
			current.game.move_left(row,column)
		end

	undo
		do
			game.undo_move_left (row, column)
		end

	redo
		do
			execute
		end
end
