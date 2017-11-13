note
	description: "Summary description for {TEST_SOLITAIRE_UI}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	TEST_SOLITAIRE_UI
inherit
	ES_TEST
create
	make
feature
	make
		do
			add_boolean_case (agent test)
			add_boolean_case (agent test_redo)
			add_boolean_case (agent test_redo2)
		end
feature
	test: BOOLEAN
		local
			ui: SOLITAIRE_USER_INTERFACE
			bta: BOARD_TEMPLATES_ACCESS
			b1: BOARD
		do
			comment ("test_cross_game: undo")

			create ui.new_cross_game
			Result := ui.game.board ~ bta.templates.cross_board
			check Result end

			b1 := ui.game.board.deep_twin
			ui.move_left (3, 4)

			ui.undo
			Result :=
				ui.game.board ~ b1 and
				ui.message ~ ui.success
			check Result end
		end

	test_redo: BOOLEAN
		local
			ui: SOLITAIRE_USER_INTERFACE
			bta: BOARD_TEMPLATES_ACCESS
			b1: BOARD
			b2: BOARD
		do
			comment ("test_cross_game: undo")

			create ui.new_skull_game
			Result := ui.game.board ~ bta.templates.skull_board
			check Result end

			b1 := ui.game.board.deep_twin
			ui.move_up (6, 3)
			b2 := ui.game.board.deep_twin

			ui.undo
			Result :=
				ui.game.board ~ b1 and
				ui.message ~ ui.success
			check Result end

			ui.redo
			Result :=
				ui.game.board ~ b2 and
				ui.message ~ ui.success
			check Result end
		end

	test_redo2:BOOLEAN
	local
			ui: SOLITAIRE_USER_INTERFACE
			bta: BOARD_TEMPLATES_ACCESS
			b1: BOARD
			b2: BOARD
		do
			comment ("test_diamond_game: multiple redos and undos")

			create ui.new_diamond_game
			Result := ui.game.board ~ bta.templates.diamond_board
			check Result end

			b1 := ui.game.board.deep_twin --original
			ui.move_right (3, 5)
			ui.move_down (2, 4)
			ui.move_left (5, 3)
			b2 := ui.game.board.deep_twin --new

			ui.undo
			ui.undo
			ui.undo
			Result :=
				ui.game.board ~ b1 and
				ui.message ~ ui.success
			check Result end

			ui.redo
			ui.redo
			ui.redo
			Result :=
				ui.game.board ~ b2 and
				ui.message ~ ui.success
			check Result end
		end
end
