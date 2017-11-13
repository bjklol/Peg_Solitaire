note
	description: "A history of executed commands."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	HISTORY

create
	make

feature
	history: LIST [COMMAND]

feature {SOLITAIRE_USER_INTERFACE}

	make
		do
			history := create {ARRAYED_LIST [COMMAND]}.make (0)
		end

feature -- history

	extend_history (new_cmd: COMMAND)
			-- Remove all operations to the right of the current
			-- cursor to history, then extend with the new command.
		do
			remove_right
			history.extend (new_cmd)
		end

	remove_right
			--Remove all elements to the right of the current cursor in history.
		do
			check attached {ARRAYED_LIST [COMMAND]} history as h then
				from
				until
					h.index = h.count
				loop
					h.remove_right
				end
			end
		end

	item: COMMAND
			-- Item at the current cursor position.
		do
			result := history.item
		end

	on_item: BOOLEAN
			-- Is cursor at a valid position?
		do
			result := (history.index >= 1) and (history.index <= history.count)
		end

	forth
			-- Move the cursor forward.
		do
			history.forth
		end

	back
			-- Move the cursor backward.
		do
			history.back
		end

	is_empty: BOOLEAN
			-- Is there at least one command in the history?
		do
			Result := history.is_empty
		end

	is_last: BOOLEAN
			-- Is cursor at the last position?
		do
			Result := history.islast
		end

end
