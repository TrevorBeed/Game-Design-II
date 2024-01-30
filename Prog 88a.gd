extends Control



func _on_btn_calc_pressed():
	var num1 = int($LineEdit.text)
	var num2 = int($LineEdit2.text)
	var Sum = num1 + num2
	var Diff = num1 - num2
	var Abs = abs(Diff)
	var Max = 0
	var Min = 0
	if num1 > num2:
		Max = num1
	else:
		Max = num2
		
	if Max == num1:
		Min = num2
	else:
		Min = num1
	var Prod = num1 * num2
	var Avg = Sum / 2
	$Label.text = "Sum:" + str(Sum) + \
	 "\nDiffrance: " + str(Diff) + \
	 "\nAbsolute: " + str(Abs) + \
	 "\nMax: " + str(Max) + \
	 "\nMinimum: " + str(Min) + \
	 "\nProduct: " + str(Prod) + \
	 "\nAvarage: " + str(Avg)


func _on_btn_clear_pressed():
	$Label.text = ""
	


func _on_btn_exit_pressed():
	get_tree().quit()
