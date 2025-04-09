#[starknet::contract]
mod supermarket {
    // import the above ICounter trait
    use starknet::ContractAddress;
    use starknet::storage::{StoragePointerReadAccess, StoragePointerWriteAccess};
    use crate::ISupermarket::ISupermarket;


    #[storage]
    struct Storage {
        no_of_doughnut: u128,
        price: u128,
    }


    #[abi(embed_v0)]
    impl SupermarketImpl of ISupermarket<ContractState> {
        fn set_totalnumber_of_doughnut(ref self: ContractState, amount: u128) {
            self.no_of_doughnut.write(amount);
        }

        fn set_price(ref self: ContractState, amount: u128, price: u128) -> u128 {
            if (amount > 40) {
                price - 10
            } else {
                price
            }
        }

        fn buy_doughnut(ref self: ContractState, amount: u128, price: u128) {
            let final_price = self.set_price(amount, price);
            self.no_of_doughnut.write(amount * final_price);
        }

        fn get_remaining_amount(self: @ContractState) -> u128 {
            self.no_of_doughnut.read()
        }
    }
}

