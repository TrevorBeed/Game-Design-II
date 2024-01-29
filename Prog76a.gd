extends Control



func _on_btn_calc_pressed():
	var num = int($L1.text)
	var ha = (num * 9) * 12345679
	$lblOut.text = str(ha)
	$lblTitle.text = "HAHAHAHAHAHA" 

func _on_btn_clear_pressed():
	$lblOut.text = ":)"
	$L1.text = ""
	$lblTitle.text = "Enter your Least Favorite Number
(1-9)"


func _on_btn_exit_pressed():
	get_tree().quit()
