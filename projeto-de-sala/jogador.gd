extends CharacterBody2D


const SPEED = 300.0
var direcao = Vector2.ZERO
@onready var ponta_arma = $ponta_arma
@export var bala_cena : PackedScene

func _physics_process(delta: float) -> void:
	mover()
	rotacionar_corpo()
	move_and_slide()
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("atirar") :
		disparo()
		
func disparo(): 
	var nova_bala = bala_cena.instantiate()
	
	nova_bala.global_position = ponta_arma.global_position
	nova_bala.direcao = (ponta_arma.global_position - global_position).normalized()
	
	get_tree().current_scene.add_child(nova_bala)
	
	
	
func mover():
		direcao = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
		velocity = direcao * SPEED 

func rotacionar_corpo():
	look_at(get_global_mouse_position()) 
