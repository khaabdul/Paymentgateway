package com.paymentDemo.Entity;

import org.springframework.stereotype.Component;

@Component
public class FessBean {
	private int amount;

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	@Override
	public String toString() {
		return "FessBean [amount=" + amount + "]";
	}

}
