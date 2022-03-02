// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.10;

import "./blockchain_txn_coinbase_v1.sol";
import "./blockchain_txn_security_coinbase_v1.sol";
import "./blockchain_txn_oui_v1.sol";
import "./blockchain_txn_gen_gateway_v1.sol";
import "./blockchain_txn_routing_v1.sol";
import "./blockchain_txn_payment_v1.sol";
import "./blockchain_txn_security_exchange_v1.sol";
import "./blockchain_txn_consensus_group_v1.sol";
import "./blockchain_txn_consensus_group_failure_v1.sol";
import "./blockchain_txn_add_gateway_v1.sol";
import "./blockchain_txn_assert_location_v1.sol";
import "./blockchain_txn_create_htlc_v1.sol";
import "./blockchain_txn_redeem_htlc_v1.sol";
import "./blockchain_txn_poc_request_v1.sol";
import "./blockchain_txn_poc_receipts_v1.sol";
import "./blockchain_txn_vars_v1.sol";
import "./blockchain_txn_rewards_v1.sol";
import "./blockchain_txn_token_burn_v1.sol";
import "./blockchain_txn_dc_coinbase_v1.sol";
import "./blockchain_txn_token_burn_exchange_rate_v1.sol";
import "./blockchain_txn_state_channel_open_v1.sol";
import "./blockchain_txn_update_gateway_oui_v1.sol";
import "./blockchain_txn_state_channel_close_v1.sol";
import "./blockchain_txn_payment_v2.sol";
import "./blockchain_txn_price_oracle_v1.sol";
import "./blockchain_txn_gen_price_oracle_v1.sol";
import "./blockchain_txn_transfer_hotspot_v1.sol";
import "./blockchain_txn_rewards_v2.sol";

import "./blockchain_txn_gen_validator_v1.sol";
import "./blockchain_txn_stake_validator_v1.sol";
import "./blockchain_txn_transfer_validator_stake_v1.sol";
import "./blockchain_txn_unstake_validator_v1.sol";
import "./blockchain_txn_validator_heartbeat_v1.sol";

import "./blockchain_txn_assert_location_v2.sol";
import "./blockchain_txn_transfer_hotspot_v2.sol";

library SmartmeshBlockchain_block_txn {
    enum Data {
        SmartmeshBlockchain_txn_add_gateway_v1.Data add_gateway;
        SmartmeshBlockchain_txn_assert_location_v1.Data assert_location;
        SmartmeshBlockchain_txn_coinbase_v1.Data coinbase;
        SmartmeshBlockchain_txn_create_htlc_v1.Data create_htlc;
        SmartmeshBlockchain_txn_gen_gateway_v1.Data gen_gateway;
        SmartmeshBlockchain_txn_consensus_group_v1.Data consensus_group;
        SmartmeshBlockchain_txn_oui_v1.Data oui;
        SmartmeshBlockchain_txn_payment_v1.Data payment;
        SmartmeshBlockchain_txn_poc_receipts_v1.Data poc_receipts;
        SmartmeshBlockchain_txn_poc_request_v1.Data poc_request;
        SmartmeshBlockchain_txn_redeem_htlc_v1.Data redeem_htlc;
        SmartmeshBlockchain_txn_security_coinbase_v1.Data security_coinbase;
        SmartmeshBlockchain_txn_routing_v1.Data routing;
        SmartmeshBlockchain_txn_security_exchange_v1.Data security_exchange;
        SmartmeshBlockchain_txn_vars_v1.Data vars;
        SmartmeshBlockchain_txn_rewards_v1.Data rewards;
        SmartmeshBlockchain_txn_token_burn_v1.Data token_burn;
        SmartmeshBlockchain_txn_dc_coinbase_v1.Data dc_coinbase;
        SmartmeshBlockchain_txn_token_burn_exchange_rate_v1.Data token_burn_exchange_rate;
        SmartmeshBlockchain_txn_bundle_v1.Data bundle;
        SmartmeshBlockchain_txn_state_channel_open_v1.Data state_channel_open;
        SmartmeshBlockchain_txn_update_gateway_oui_v1.Data update_gateway_oui;
        SmartmeshBlockchain_txn_state_channel_close_v1.Data state_channel_close;
        SmartmeshBlockchain_txn_payment_v2.Data payment_v2;
        SmartmeshBlockchain_txn_price_oracle_v1.Data price_oracle_submission;
        SmartmeshBlockchain_txn_gen_price_oracle_v1.Data gen_price_oracle;
        SmartmeshBlockchain_txn_transfer_hotspot_v1.Data transfer_hotspot;
        SmartmeshBlockchain_txn_gen_validator_v1.Data gen_validator;
        SmartmeshBlockchain_txn_stake_validator_v1.Data stake_validator;
        SmartmeshBlockchain_txn_transfer_validator_stake_v1.Data transfer_val_stake;
        SmartmeshBlockchain_txn_unstake_validator_v1.Data unstake_validator;
        SmartmeshBlockchain_txn_validator_heartbeat_v1.Data val_heartbeat;
        SmartmeshBlockchain_txn_consensus_group_failure_v1.Data consensus_group_failure;
        SmartmeshBlockchain_txn_rewards_v2.Data rewards_v2;
        SmartmeshBlockchain_txn_assert_location_v2.Data assert_location_v2;
        SmartmeshBlockchain_txn_transfer_hotspot_v2.Data transfer_hotspot_v2;
    }
}

library SmartmeshBlockchain_txn_bundle_v1{
    struct Data {
        SmartmeshBlockchain_block_txn.Data transactions;
    }
}
