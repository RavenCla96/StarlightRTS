extends Node2D

@export var sprite_scene: PackedScene # Assign your Sprite2D scene in the Inspector
@export var grid_size: int = 64      # Set your grid size in pixels (e.g., 32, 64)

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		# Get the mouse position in global/world coordinates
		var mouse_pos: Vector2 = get_global_mouse_position()
		
		# Snap the position to the grid
		var snapped_pos: Vector2 = snapped(mouse_pos, Vector2(grid_size, grid_size))
		
		place_sprite(snapped_pos)

func place_sprite(target_position: Vector2) -> void:
	if sprite_scene:
		var new_sprite = sprite_scene.instantiate()
		new_sprite.global_position = target_position
		add_child(new_sprite)
