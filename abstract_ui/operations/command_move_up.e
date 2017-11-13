note
	description: "Summary description for {COMMAND_MOVE_LEFT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	COMMAND_MOVE_UP

inherit
	COMMAND

create
	make

feature -- operations of the command
	execute
		do
			current.game.move_up(row,column)
		end

	undo
		do
			game.undo_move_up(row, column)
		end

	redo
		do
			execute
		end
end
