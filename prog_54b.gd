extends Control



func _on_btn_calc_pressed():
	var num1 = int($le1.text)
	var num2 = int($le2.text)
	var num3 = int($le3.text)
	var num4 = int($le4.text)
	var sum = num1 + num2 + num3 + num4
	var avg = sum / 4.0
	$lblSum.text = "The sum of the four numbers is: " + str(sum)
	$lblAvarage.text = "The average of the four numbers are: " + str(avg)


func _on_btn_clear_pressed():
	$le1.text = ""
	$le2.text = ""
	$le3.text = ""
	$le4.text = ""
	$lblSum.text = "The sum of the four numbers is: "
	$lblAvarage.text = "The average of the four numbers are: "


func _on_btn_exit_pressed():
	get_tree().quit()
