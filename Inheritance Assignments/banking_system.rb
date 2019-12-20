class Account

	private
	@@auto_generate_account_number=0
	@account_number
	@account_holder_name
	@balance

	def initialize(account_holder_name, amount)
		@@auto_generate_account_number += 1
		@account_number = @@auto_generate_account_number
		@account_holder_name = account_holder_name
		@balance = amount
		puts "Account created successfully.."
	end

	public
	def self.validate_amount(amount)
		if amount > 0.0
			return true
		else
			puts "Please enter a valid amount..\n"
			return false
		end		 
	end

	def self.validate_name(name)
		full_name_regex = /\A[a-zA-Z]\s*[a-zA-Z]*\Z/
		if full_name_regex.match?(name)
			return true
		else
			puts "Please enter a valid name..\n"
			return false	
		end	
	end

	def deposit()
		puts "\nEnter amount to be deposited: "
		amount = gets.chomp.to_f

		return if !Account.validate_amount(amount)

		@balance += amount
		puts "Money deposited successfully!"
		show_balance
	end	
	
	def withdraw()
		puts "\nEnter amount to be withdrawn: "
		amount = gets.chomp.to_f

		if amount>@balance
			puts "Sorry..insufficient balance.\n"
			return
		end

		@balance -= amount
		puts "Money withdrawn successfully!"
		show_balance
	end	

	def show_balance
		puts "Current balance: #{@balance} INR"
	end	

	def show_account_info
		puts "\nAccount number:\t#{@account_number}\nAccount Holder:\t#{@account_holder_name}\nBalance:\t#{@balance}"
	end	
end


class CurrentAccount < Account
	@rate_of_interest

	def initialize(account_holder_name, amount)
		super(account_holder_name, amount)
		@rate_of_interest = 12.0
	end	

	def calculate_interest(time_in_months)
		interest = 0
		interest += ( @balance*@rate_of_interest.to_f*time_in_months )/(12*100)
		puts "\nAmount you get after #{time_in_months} months : #{interest} INR."
	end	
end


class SavingAccount < Account	
	@@rate_of_interest

	def initialize(account_holder_name, amount)
		super(account_holder_name, amount)
		@rate_of_interest = 9.5
	end	

	def calculate_interest(time_in_months)
		interest = 0
		interest += ( @balance*@rate_of_interest*time_in_months.to_i )/(12*100)
		puts "\nAmount you get after #{time_in_months} months : #{interest} INR."
	end	
end

def get_account_obj(account_type, account_holder_name, amount)
	if account_type == 1
		return CurrentAccount.new(account_holder_name, amount)
	else
		return	SavingAccount.new(account_holder_name, amount)
	end
end	

while true

	puts "\nCreating new account-\n"
	puts "Please enter your name: "
	account_holder_name = gets.chomp

	puts "\nEnter amount: "
	amount = gets.chomp.to_f

	if Account.validate_name(account_holder_name) and Account.validate_amount(amount)
		
		puts "\nPlease select the type of account:\n1. Current Account\n2. Savings Account"
		account_type = gets.chomp.to_i
		if account_type != 1 and account_type != 2
			puts "Invalid account type.."
			break
		end	

		account_obj = get_account_obj(account_type, account_holder_name, amount)

		while true
			puts "\n1. Deposit\n2. Withdraw\n3. Get Interest Amount\n4. Show Account Information\n"
			puts "Enter you choice of your transaction: "
			transaction_choice = gets.chomp.to_i

			case transaction_choice
			when 1
				account_obj.deposit
			when 2
				account_obj.withdraw
			when 3
				puts "\nEnter the number of months: "
				time_in_months = gets.chomp.to_i
				account_obj.calculate_interest(time_in_months)	
			when 4
				account_obj.show_account_info	 
			else
				puts "Invalid choice.."	
			end

			puts "\nPress enter to make another transaction or X to exit!"
			choice = gets.chomp.upcase
			break if choice=='X'
		end	

		puts "\nPress enter to create another account or X to exit!"
		choice = gets.chomp.upcase
		break if choice=='X'
	end
	
	puts "Unable to create account..\n\n"
end