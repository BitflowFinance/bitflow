
import { Clarinet, Tx, Chain, Account, types, EmptyBlock } from 'https://deno.land/x/clarinet@v0.31.0/index.ts';
import { assertEquals } from 'https://deno.land/std@0.90.0/testing/asserts.ts';

///////////////////////////////////////////
///////////////////////////////////////////
///////////////// STAKING /////////////////
///////////////////////////////////////////
///////////////////////////////////////////

// Test staking
Clarinet.test({
    name: "Ensure we can stake",
    async fn(chain: Chain, accounts: Map<string, Account>) {
        const deployer = accounts.get("deployer")!;
        const wallet_1 = accounts.get("wallet_1")!;

        chain.mineBlock([
            Tx.contractCall("usda-token", "mint", [types.uint(500000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("susdt-token", "mint", [types.uint(50000000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "create-pair", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.ascii("test"), types.uint(10000000000000000), types.uint(100000000000000)], deployer.address)
        ]);

        const block = chain.mineBlock([
            Tx.contractCall("stableswap-staking-and-rewards", "stake-lp-tokens", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(10), types.uint(10000000000)], deployer.address)
        ]);

        block.receipts[0].result.expectOk()
        console.log(JSON.stringify(block.receipts));
    },
});

// Test staking
Clarinet.test({
    name: "Ensure we can NOT stake if cycles to high",
    async fn(chain: Chain, accounts: Map<string, Account>) {
        const deployer = accounts.get("deployer")!;
        const wallet_1 = accounts.get("wallet_1")!;

        chain.mineBlock([
            Tx.contractCall("usda-token", "mint", [types.uint(500000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("susdt-token", "mint", [types.uint(50000000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "create-pair", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.ascii("test"), types.uint(10000000000000000), types.uint(100000000000000)], deployer.address)
        ]);

        const block = chain.mineBlock([
            Tx.contractCall("stableswap-staking-and-rewards", "stake-lp-tokens", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(122), types.uint(10000000000)], deployer.address)
        ]);

        block.receipts[0].result.expectErr()
        console.log(JSON.stringify(block.receipts));
    },
});

// Test staking
Clarinet.test({
    name: "Ensure we can NOT stake if cycles to low",
    async fn(chain: Chain, accounts: Map<string, Account>) {
        const deployer = accounts.get("deployer")!;
        const wallet_1 = accounts.get("wallet_1")!;

        chain.mineBlock([
            Tx.contractCall("usda-token", "mint", [types.uint(500000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("susdt-token", "mint", [types.uint(50000000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "create-pair", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.ascii("test"), types.uint(10000000000000000), types.uint(100000000000000)], deployer.address)
        ]);

        const block = chain.mineBlock([
            Tx.contractCall("stableswap-staking-and-rewards", "stake-lp-tokens", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(0), types.uint(10000000000)], deployer.address)
        ]);

        block.receipts[0].result.expectErr()
        console.log(JSON.stringify(block.receipts));
    },
});

// Test staking
Clarinet.test({
    name: "Ensure we can NOT stake if amount to low",
    async fn(chain: Chain, accounts: Map<string, Account>) {
        const deployer = accounts.get("deployer")!;
        const wallet_1 = accounts.get("wallet_1")!;

        chain.mineBlock([
            Tx.contractCall("usda-token", "mint", [types.uint(500000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("susdt-token", "mint", [types.uint(50000000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "create-pair", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.ascii("test"), types.uint(10000000000000000), types.uint(100000000000000)], deployer.address)
        ]);

        const block = chain.mineBlock([
            Tx.contractCall("stableswap-staking-and-rewards", "stake-lp-tokens", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(10), types.uint(0)], deployer.address)
        ]);

        block.receipts[0].result.expectErr()
        console.log(JSON.stringify(block.receipts));
    },
});

// Test staking
Clarinet.test({
    name: "Ensure we can NOT stake if not enough lp balance",
    async fn(chain: Chain, accounts: Map<string, Account>) {
        const deployer = accounts.get("deployer")!;
        const wallet_1 = accounts.get("wallet_1")!;

        chain.mineBlock([
            Tx.contractCall("usda-token", "mint", [types.uint(500000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("susdt-token", "mint", [types.uint(50000000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "create-pair", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.ascii("test"), types.uint(10000000000000000), types.uint(100000000000000)], deployer.address)
        ]);

        const block = chain.mineBlock([
            Tx.contractCall("stableswap-staking-and-rewards", "stake-lp-tokens", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(10), types.uint(50000000000000000)], deployer.address)
        ]);

        block.receipts[0].result.expectErr()
        console.log(JSON.stringify(block.receipts));
    },
});

// Test staking
Clarinet.test({
    name: "Ensure we can NOT stake if no pair data",
    async fn(chain: Chain, accounts: Map<string, Account>) {
        const deployer = accounts.get("deployer")!;
        const wallet_1 = accounts.get("wallet_1")!;

        chain.mineBlock([
            Tx.contractCall("usda-token", "mint", [types.uint(500000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("susdt-token", "mint", [types.uint(50000000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        const block = chain.mineBlock([
            Tx.contractCall("stableswap-staking-and-rewards", "stake-lp-tokens", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(10), types.uint(50000000000000000)], deployer.address)
        ]);

        block.receipts[0].result.expectErr()
        console.log(JSON.stringify(block.receipts));
    },
});

// Test staking
Clarinet.test({
    name: "Ensure we can NOT stake if pair not approved",
    async fn(chain: Chain, accounts: Map<string, Account>) {
        const deployer = accounts.get("deployer")!;
        const wallet_1 = accounts.get("wallet_1")!;

        chain.mineBlock([
            Tx.contractCall("usda-token", "mint", [types.uint(500000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("susdt-token", "mint", [types.uint(50000000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "create-pair", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.ascii("test"), types.uint(10000000000000000), types.uint(100000000000000)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "set-pair-approval", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.bool(false)], deployer.address)
        ]);

        const block = chain.mineBlock([
            Tx.contractCall("stableswap-staking-and-rewards", "stake-lp-tokens", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(10), types.uint(50000000000000000)], deployer.address)
        ]);

        block.receipts[0].result.expectErr()
        console.log(JSON.stringify(block.receipts));
    },
});


/////////////////////////////////////////////
/////////////////////////////////////////////
///////////////// UNSTAKING /////////////////
/////////////////////////////////////////////
/////////////////////////////////////////////

// Test staking
Clarinet.test({
    name: "Ensure we can unstake",
    async fn(chain: Chain, accounts: Map<string, Account>) {
        const deployer = accounts.get("deployer")!;
        const wallet_1 = accounts.get("wallet_1")!;

        chain.mineBlock([
            Tx.contractCall("usda-token", "mint", [types.uint(500000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("susdt-token", "mint", [types.uint(50000000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "create-pair", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.ascii("test"), types.uint(10000000000000000), types.uint(100000000000000)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap-staking-and-rewards", "stake-lp-tokens", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(10), types.uint(10000000000)], deployer.address)
        ]);

        chain.mineEmptyBlockUntil(1441);

        const block = chain.mineBlock([
            Tx.contractCall("stableswap-staking-and-rewards", "unstake-all-lp-tokens", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token")], deployer.address)
        ]);

        block.receipts[0].result.expectOk()
        console.log(JSON.stringify(block.receipts));
    },
});