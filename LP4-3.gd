extends Control

func _on_btn_calc_pressed():
	var egg = int($L1.text)
	var dozen = egg / 12
	var LO = egg - (dozen * 12)
	var price = 0
	if dozen >= 0 and dozen < 3:
		price = dozen * 0.50
	elif dozen >= 3 and dozen < 6:
		price = dozen * 0.45
	elif dozen >= 6 and dozen < 11:
		price = dozen * 0.40
	elif dozen >= 11:
		price = dozen * 0.35
	var ep = LO * (price/12)
	var fp = ep + price
	$lblOut.text = "$" + str(fp)

func _on_btn_clear_pressed():
	$lblOut.text = ""
	$L1.text = ""


func _on_btn_exit_pressed():
	get_tree().quit()
