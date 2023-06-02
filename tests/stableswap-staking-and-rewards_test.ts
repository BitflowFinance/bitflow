
import { Clarinet, Tx, Chain, Account, types, EmptyBlock } from 'https://deno.land/x/clarinet@v1.6.0/index.ts';
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
    name: "Ensure we can stake again in different cycle",
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

        chain.mineEmptyBlockUntil(200);

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

        chain.mineEmptyBlockUntil(1585);

        const block = chain.mineBlock([
            Tx.contractCall("stableswap-staking-and-rewards", "unstake-all-lp-tokens", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token")], deployer.address)
        ]);

        block.receipts[0].result.expectOk()
        console.log(JSON.stringify(block.receipts));
    },
});

// Test staking
Clarinet.test({
    name: "Ensure we can unstake again in different cycle",
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

        chain.mineEmptyBlockUntil(200);

        chain.mineBlock([
            Tx.contractCall("stableswap-staking-and-rewards", "stake-lp-tokens", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(10), types.uint(1500000000)], deployer.address)
        ]);

        chain.mineEmptyBlockUntil(1585);

        chain.mineBlock([
            Tx.contractCall("stableswap-staking-and-rewards", "unstake-all-lp-tokens", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token")], deployer.address)
        ]);

        chain.mineEmptyBlockUntil(2000);

        const block = chain.mineBlock([
            Tx.contractCall("stableswap-staking-and-rewards", "unstake-all-lp-tokens", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token")], deployer.address)
        ]);

        block.receipts[0].result.expectOk()
        console.log(JSON.stringify(block.receipts));
    },
});

// Test staking
Clarinet.test({
    name: "Ensure we can unstake all lp tokens from different stakes",
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

        chain.mineEmptyBlockUntil(200);

        chain.mineBlock([
            Tx.contractCall("stableswap-staking-and-rewards", "stake-lp-tokens", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(10), types.uint(1500000000)], deployer.address)
        ]);

        chain.mineEmptyBlockUntil(2000);

        const block = chain.mineBlock([
            Tx.contractCall("stableswap-staking-and-rewards", "unstake-all-lp-tokens", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token")], deployer.address)
        ]);

        block.receipts[0].result.expectOk()
        console.log(JSON.stringify(block.receipts));
    },
});

// Test staking
Clarinet.test({
    name: "Ensure we can NOT unstake twice",
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

        chain.mineEmptyBlockUntil(1585);

        chain.mineBlock([
            Tx.contractCall("stableswap-staking-and-rewards", "unstake-all-lp-tokens", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token")], deployer.address)
        ]);

        const block = chain.mineBlock([
            Tx.contractCall("stableswap-staking-and-rewards", "unstake-all-lp-tokens", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token")], deployer.address)
        ]);

        block.receipts[0].result.expectErr()
        console.log(JSON.stringify(block.receipts));
    },
});

// Test staking
Clarinet.test({
    name: "Ensure we can NOT unstake if staking cycles haven't passed",
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

        chain.mineEmptyBlockUntil(15);

        const block = chain.mineBlock([
            Tx.contractCall("stableswap-staking-and-rewards", "unstake-all-lp-tokens", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token")], deployer.address)
        ]);

        block.receipts[0].result.expectErr()
        console.log(JSON.stringify(block.receipts));
    },
});

////////////////////////////////////////////
////////////////////////////////////////////
///////////////// CLAIMING /////////////////
////////////////////////////////////////////
////////////////////////////////////////////

// Test claiming
Clarinet.test({
    name: "Ensure we can claim rewards from a single cycle from a single token",
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
            Tx.contractCall("stableswap-staking-and-rewards", "stake-lp-tokens", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(2), types.uint(10000000000)], deployer.address)
        ]);

        chain.mineEmptyBlockUntil(145);

        chain.mineBlock([
            Tx.contractCall("stableswap", "swap-x-for-y", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(10000000), types.uint(0)], deployer.address)
        ]);

        chain.mineEmptyBlockUntil(290);

        const block = chain.mineBlock([
            Tx.contractCall("stableswap-staking-and-rewards", "claim-cycle-staking-rewards", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(1)], deployer.address)
        ]);

        block.receipts[0].result.expectOk()
        console.log(JSON.stringify(block.receipts));
    },
});

// Test claiming
Clarinet.test({
    name: "Ensure we can claim rewards from a single cycle from other token",
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
            Tx.contractCall("stableswap-staking-and-rewards", "stake-lp-tokens", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(2), types.uint(10000000000)], deployer.address)
        ]);

        chain.mineEmptyBlockUntil(145);

        chain.mineBlock([
            Tx.contractCall("stableswap", "swap-y-for-x", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100000), types.uint(0)], deployer.address)
        ]);

        chain.mineEmptyBlockUntil(290);

        const block = chain.mineBlock([
            Tx.contractCall("stableswap-staking-and-rewards", "claim-cycle-staking-rewards", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(1)], deployer.address)
        ]);

        block.receipts[0].result.expectOk()
        console.log(JSON.stringify(block.receipts));
    },
});

// Test claiming
Clarinet.test({
    name: "Ensure we can claim rewards from both tokens",
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
            Tx.contractCall("stableswap-staking-and-rewards", "stake-lp-tokens", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(2), types.uint(10000000000)], deployer.address)
        ]);

        chain.mineEmptyBlockUntil(145);

        chain.mineBlock([
            Tx.contractCall("stableswap", "swap-y-for-x", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100000), types.uint(0)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "swap-x-for-y", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(10000000), types.uint(0)], deployer.address)
        ]);

        chain.mineEmptyBlockUntil(290);

        const block = chain.mineBlock([
            Tx.contractCall("stableswap-staking-and-rewards", "claim-cycle-staking-rewards", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(1)], deployer.address)
        ]);

        block.receipts[0].result.expectOk()
        console.log(JSON.stringify(block.receipts));
    },
});

// Test claiming
Clarinet.test({
    name: "Ensure we can claim rewards from different cycles from same token",
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
            Tx.contractCall("stableswap-staking-and-rewards", "stake-lp-tokens", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(2), types.uint(10000000000)], deployer.address)
        ]);

        chain.mineEmptyBlockUntil(145);

        chain.mineBlock([
            Tx.contractCall("stableswap", "swap-y-for-x", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100000), types.uint(0)], deployer.address)
        ]);

        chain.mineEmptyBlockUntil(290);

        chain.mineBlock([
            Tx.contractCall("stableswap", "swap-y-for-x", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100000), types.uint(0)], deployer.address)
        ]);

        chain.mineEmptyBlockUntil(500);

        const block = chain.mineBlock([
            Tx.contractCall("stableswap-staking-and-rewards", "claim-all-staking-rewards", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token")], deployer.address)
        ]);

        block.receipts[0].result.expectOk()
        console.log(JSON.stringify(block.receipts));
    },
});

// Test claiming
Clarinet.test({
    name: "Ensure we can claim rewards from different cycles from same other token",
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
            Tx.contractCall("stableswap-staking-and-rewards", "stake-lp-tokens", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(2), types.uint(10000000000)], deployer.address)
        ]);

        chain.mineEmptyBlockUntil(145);

        chain.mineBlock([
            Tx.contractCall("stableswap", "swap-x-for-y", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(10000000), types.uint(0)], deployer.address)
        ]);

        chain.mineEmptyBlockUntil(290);

        chain.mineBlock([
            Tx.contractCall("stableswap", "swap-x-for-y", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(10000000), types.uint(0)], deployer.address)
        ]);

        chain.mineEmptyBlockUntil(500);

        const block = chain.mineBlock([
            Tx.contractCall("stableswap-staking-and-rewards", "claim-all-staking-rewards", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token")], deployer.address)
        ]);

        block.receipts[0].result.expectOk()
        console.log(JSON.stringify(block.receipts));
    },
});

// Test claiming
Clarinet.test({
    name: "Ensure we can claim rewards from different cycles from both tokens",
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
            Tx.contractCall("stableswap-staking-and-rewards", "stake-lp-tokens", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(2), types.uint(10000000000)], deployer.address)
        ]);

        chain.mineEmptyBlockUntil(145);

        chain.mineBlock([
            Tx.contractCall("stableswap", "swap-x-for-y", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(10000000), types.uint(0)], deployer.address)
        ]);

        chain.mineEmptyBlockUntil(290);

        chain.mineBlock([
            Tx.contractCall("stableswap", "swap-y-for-x", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100000), types.uint(0)], deployer.address)
        ]);

        chain.mineEmptyBlockUntil(500);

        const block = chain.mineBlock([
            Tx.contractCall("stableswap-staking-and-rewards", "claim-all-staking-rewards", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token")], deployer.address)
        ]);

        block.receipts[0].result.expectOk()
        console.log(JSON.stringify(block.receipts));
    },
});

// Test claiming
Clarinet.test({
    name: "Ensure we can NOT claim rewards from different cycles from both tokens if one of them was not generated on a staking cycle",
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
            Tx.contractCall("stableswap-staking-and-rewards", "stake-lp-tokens", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(2), types.uint(10000000000)], deployer.address)
        ]);

        chain.mineEmptyBlockUntil(145);

        chain.mineBlock([
            Tx.contractCall("stableswap", "swap-x-for-y", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(10000000), types.uint(0)], deployer.address)
        ]);

        chain.mineEmptyBlockUntil(500);

        chain.mineBlock([
            Tx.contractCall("stableswap", "swap-y-for-x", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100000), types.uint(0)], deployer.address)
        ]);

        chain.mineEmptyBlockUntil(560);

        const block = chain.mineBlock([
            Tx.contractCall("stableswap-staking-and-rewards", "claim-all-staking-rewards", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token")], deployer.address)
        ]);

        block.receipts[0].result.expectOk()
        console.log(JSON.stringify(block.receipts));
    },
});

// // Test claiming
// Clarinet.test({
//     name: "Ensure we can NOT claim rewards if current cycle",
//     async fn(chain: Chain, accounts: Map<string, Account>) {
//         const deployer = accounts.get("deployer")!;
//         const wallet_1 = accounts.get("wallet_1")!;

//         chain.mineBlock([
//             Tx.contractCall("usda-token", "mint", [types.uint(500000000000000), types.principal(deployer.address)], deployer.address)
//         ]);

//         chain.mineBlock([
//             Tx.contractCall("susdt-token", "mint", [types.uint(50000000000000000), types.principal(deployer.address)], deployer.address)
//         ]);

//         chain.mineBlock([
//             Tx.contractCall("stableswap", "create-pair", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.ascii("test"), types.uint(10000000000000000), types.uint(100000000000000)], deployer.address)
//         ]);

//         chain.mineBlock([
//             Tx.contractCall("stableswap-staking-and-rewards", "stake-lp-tokens", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(2), types.uint(10000000000)], deployer.address)
//         ]);

//         chain.mineEmptyBlockUntil(145);

//         chain.mineBlock([
//             Tx.contractCall("stableswap", "swap-x-for-y", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(10000000), types.uint(0)], deployer.address)
//         ]);

//         chain.mineBlock([
//             Tx.contractCall("stableswap", "swap-y-for-x", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100000), types.uint(0)], deployer.address)
//         ]);

//         const block = chain.mineBlock([
//             Tx.contractCall("stableswap-staking-and-rewards", "claim-all-staking-rewards", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token")], deployer.address)
//         ]);

//         block.receipts[0].result.expectErr()
//         console.log(JSON.stringify(block.receipts));
//     },
// });


// Test read only get rewards at a certain cycle
Clarinet.test({
    name: "Ensure we can read the rewards at a certain cycle",
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
            Tx.contractCall("stableswap-staking-and-rewards", "stake-lp-tokens", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(2), types.uint(10000000000)], deployer.address)
        ]);

        chain.mineEmptyBlockUntil(145);

        chain.mineBlock([
            Tx.contractCall("stableswap", "swap-x-for-y", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(10000000), types.uint(0)], deployer.address)
        ]);

        chain.mineEmptyBlockUntil(290);
        const call = chain.callReadOnlyFn("stableswap-staking-and-rewards", "get-staking-rewards-at-cycle", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(1)], deployer.address)

        call.result.expectOk().expectTuple()
        console.log(JSON.stringify(call.result));
    },
});

// Test read only get rewards at cycle zero when it should produce an error
Clarinet.test({
    name: "Ensure we are get an error when reading cycle rewards at zero",
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
            Tx.contractCall("stableswap-staking-and-rewards", "stake-lp-tokens", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(2), types.uint(10000000000)], deployer.address)
        ]);

        chain.mineEmptyBlockUntil(145);

        chain.mineBlock([
            Tx.contractCall("stableswap", "swap-x-for-y", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(10000000), types.uint(0)], deployer.address)
        ]);

        chain.mineEmptyBlockUntil(290);
        const call = chain.callReadOnlyFn("stableswap-staking-and-rewards", "get-staking-rewards-at-cycle", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(0)], deployer.address)

        call.result.expectErr()
        console.log(JSON.stringify(call.result));
    },
});


// Test read only get both x and y rewards at cycle
Clarinet.test({
    name: "Ensure we can read both x and y rewards at cycle when trading fees have been collected",
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
            Tx.contractCall("stableswap-staking-and-rewards", "stake-lp-tokens", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(2), types.uint(10000000000)], deployer.address)
        ]);

        chain.mineEmptyBlockUntil(145);

        chain.mineBlock([
            Tx.contractCall("stableswap", "swap-x-for-y", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(10000000), types.uint(0)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "swap-y-for-x", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100000), types.uint(0)], deployer.address)
        ]);

        chain.mineEmptyBlockUntil(290);
        const call = chain.callReadOnlyFn("stableswap-staking-and-rewards", "get-staking-rewards-at-cycle", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(1)], deployer.address)

        call.result.expectOk().expectTuple()
        console.log(JSON.stringify(call.result));
    },
});

// Test read only get both x and y rewards at cycle
Clarinet.test({
    name: "Ensure we can read both x and y rewards at cycle > 0 when NO trading fees have been collected",
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
            Tx.contractCall("stableswap-staking-and-rewards", "stake-lp-tokens", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(2), types.uint(10000000000)], deployer.address)
        ]);

        chain.mineEmptyBlockUntil(145);

        chain.mineBlock([
            Tx.contractCall("stableswap", "swap-x-for-y", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(10000000), types.uint(0)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "swap-y-for-x", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100000), types.uint(0)], deployer.address)
        ]);

        chain.mineEmptyBlockUntil(1500);
        const call = chain.callReadOnlyFn("stableswap-staking-and-rewards", "get-staking-rewards-at-cycle", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(5)], deployer.address)

        call.result.expectErr()
        console.log(JSON.stringify(call.result));
    },
});