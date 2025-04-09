#[starknet::interface]
pub trait ISupermarket<T> {
    fn set_totalnumber_of_doughnut(ref self: T, amount: u128);
    fn set_price(ref self: T, amount: u128, price: u128) -> u128;
    fn buy_doughnut(ref self: T, amount: u128, price: u128);
    fn get_remaining_amount(self: @T) -> u128;
}
