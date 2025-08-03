extends Node2D

var top_open = false
var side_open = false
func _process(delta: float):
	check_for_top_relic_done()
	check_for_side_relic_done()
	
func check_for_side_relic_done():
	if !side_open:
		if Global.level >= 3:
			$SideSecretWall.open()
			side_open = true
		
	
func check_for_top_relic_done():
	if !top_open : 
		if torch_check():
			$TopSecretWall.open()
			$TopSecretWalls.visible = true
			$TopSecretFloor.visible = true
			top_open = true
# TOBY FOX'S SCHOOL OF GAME DEV AND SOFTWARE ENGINEERING RIGHT HERE
func torch_check():
	if $Torch5.out and $Torch7.out and $Torch13.out and $Torch18.out and $Torch20.out and $Torch24.out:
		return !$Torch.out and !$Torch2.out and !$Torch3.out and !$Torch4.out and !$Torch6.out and !$Torch8.out and !$Torch9.out and !$Torch10.out and !$Torch11.out and !$Torch12.out and !$Torch14.out and !$Torch15.out and !$Torch16.out and !$Torch17.out and !$Torch19.out and !$Torch21.out and !$Torch22.out and !$Torch23.out
