package com.paymentDemo.controler;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.paymentDemo.Entity.FessBean;
import com.razorpay.Order;
import com.razorpay.RazorpayClient;
import com.razorpay.RazorpayException;

@Controller
public class paymentControler {
	@GetMapping("/v")
	public String pay() {
		return "Payment";

	}

	@PostMapping("/pay")
	public String payed(@ModelAttribute FessBean fessBean, Model model) {
		System.out.println(fessBean);
		model.addAttribute("succ", "Payment Done");
		return "Payment";

	}

	@PostMapping("/order")
	@ResponseBody
	public String order(@RequestBody FessBean fessBean) throws RazorpayException {
		System.out.println("hey Payment Started");
		System.out.println(fessBean);
		Integer amt = Integer.valueOf(fessBean.getAmount());
		RazorpayClient client = new RazorpayClient("rzp_test_GbSpoVJ9EMyiIA", "5IwdNO3sTEMANRwFceqoxcmt");

		JSONObject jsonObject = new JSONObject();
		jsonObject.put("amount", amt * 100);
		jsonObject.put("currency", "INR");
		jsonObject.put("receipt", "tx1");

		Order create = client.Orders.create(jsonObject);
		System.out.println(create);
		return create.toString();

	}
}
