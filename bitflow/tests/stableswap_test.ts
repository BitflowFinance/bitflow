
import { Clarinet, Tx, Chain, Account, types, EmptyBlock } from 'https://deno.land/x/clarinet@v0.31.0/index.ts';
import { assertEquals } from 'https://deno.land/std@0.90.0/testing/asserts.ts';

// Test get pair data with no pair set
Clarinet.test({
    name: "Ensure we can read the pair data with no pair set",
    async fn(chain: Chain, accounts: Map<string, Account>) {
        const deployer = accounts.get("deployer")!;
        const wallet_1 = accounts.get("wallet_1")!;

        const call = chain.callReadOnlyFn("stableswap", "get-pair-data", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token")], deployer.address)

        call.result.expectNone()
        console.log(JSON.stringify(call.result));
    },
});

// Test get pair data after setting a pair
Clarinet.test({
    name: "Ensure we can read the pair data after setting a pair",
    async fn(chain: Chain, accounts: Map<string, Account>) {
        const deployer = accounts.get("deployer")!;
        const wallet_1 = accounts.get("wallet_1")!;

        chain.mineBlock([
            Tx.contractCall("usda-token", "mint", [types.uint(100000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("susdt-token", "mint", [types.uint(100000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "create-pair", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.ascii("test"), types.uint(10000000000), types.uint(10000000000)], deployer.address)
        ]);

        const call = chain.callReadOnlyFn("stableswap", "get-pair-data", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token")], deployer.address)

        call.result.expectSome().expectTuple()
        console.log(JSON.stringify(call.result));
    },
});

// Test get current cycle
Clarinet.test({
    name: "Ensure we can get the current cycle",
    async fn(chain: Chain, accounts: Map<string, Account>) {
        const deployer = accounts.get("deployer")!;
        const wallet_1 = accounts.get("wallet_1")!;

        const call = chain.callReadOnlyFn("stableswap", "get-current-cycle", [], deployer.address)

        call.result.expectUint(0)
        console.log(JSON.stringify(call.result));
    },
});

// Test get current cycle
Clarinet.test({
    name: "Ensure we can get the deployment height",
    async fn(chain: Chain, accounts: Map<string, Account>) {
        const deployer = accounts.get("deployer")!;
        const wallet_1 = accounts.get("wallet_1")!;

        const call = chain.callReadOnlyFn("stableswap", "get-deployment-height", [], deployer.address)

        call.result.expectUint(0)
        console.log(JSON.stringify(call.result));
    },
});

////////////////////////////////////////////////
////////////////////////////////////////////////
///////////////// SWAP X FOR Y /////////////////
////////////////////////////////////////////////
////////////////////////////////////////////////

// Test swap x for y
Clarinet.test({
    name: "Ensure we can swap x-token for y-token small amount",
    async fn(chain: Chain, accounts: Map<string, Account>) {
        const deployer = accounts.get("deployer")!;
        const wallet_1 = accounts.get("wallet_1")!;

        chain.mineBlock([
            Tx.contractCall("usda-token", "mint", [types.uint(100000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("susdt-token", "mint", [types.uint(100000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "create-pair", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.ascii("test"), types.uint(10000000000), types.uint(10000000000)], deployer.address)
        ]);

        const block = chain.mineBlock([
            Tx.contractCall("stableswap", "swap-x-for-y", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(10), types.uint(0)], deployer.address)
        ]);

        block.receipts[0].result.expectOk().expectBool(true)
        console.log(JSON.stringify(block.receipts));
    },
});

// Test swap x for y
Clarinet.test({
    name: "Ensure we can swap x-token for y-token",
    async fn(chain: Chain, accounts: Map<string, Account>) {
        const deployer = accounts.get("deployer")!;
        const wallet_1 = accounts.get("wallet_1")!;

        chain.mineBlock([
            Tx.contractCall("usda-token", "mint", [types.uint(100000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("susdt-token", "mint", [types.uint(100000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "create-pair", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.ascii("test"), types.uint(10000000000), types.uint(10000000000)], deployer.address)
        ]);

        const block = chain.mineBlock([
            Tx.contractCall("stableswap", "swap-x-for-y", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100000), types.uint(99940)], deployer.address)
        ]);
        // will we always set a lower expectation of min y? if not, change the asserts to >= of "err-min-y-amount"

        block.receipts[0].result.expectOk().expectBool(true)
        console.log(JSON.stringify(block.receipts));
    },
});

// Test swap x for y
Clarinet.test({
    name: "Ensure we can swap x-token for y-token get pair data back",
    async fn(chain: Chain, accounts: Map<string, Account>) {
        const deployer = accounts.get("deployer")!;
        const wallet_1 = accounts.get("wallet_1")!;

        chain.mineBlock([
            Tx.contractCall("usda-token", "mint", [types.uint(100000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("susdt-token", "mint", [types.uint(100000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "create-pair", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.ascii("test"), types.uint(10000000000), types.uint(10000000000)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "swap-x-for-y", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100000), types.uint(99940)], deployer.address)
        ]);

        const call = chain.callReadOnlyFn("stableswap", "get-pair-data", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token")], deployer.address)

        call.result.expectSome().expectTuple()
        console.log(JSON.stringify(call.result));
    },
});

// Test swap x for y 9 times and get the same amount
Clarinet.test({
    name: "Ensure we can swap x-token for y-token 9 times and get the same amount",
    async fn(chain: Chain, accounts: Map<string, Account>) {
        const deployer = accounts.get("deployer")!;
        const wallet_1 = accounts.get("wallet_1")!;

        chain.mineBlock([
            Tx.contractCall("usda-token", "mint", [types.uint(100000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("susdt-token", "mint", [types.uint(100000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "create-pair", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.ascii("test"), types.uint(10000000000), types.uint(10000000000)], deployer.address)
        ]);
        
        for (let i = 0; i < 8; i++) {
            chain.mineBlock([
                Tx.contractCall("stableswap", "swap-x-for-y", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100000), types.uint(99940)], deployer.address)
            ]);
        }

        const block = chain.mineBlock([
            Tx.contractCall("stableswap", "swap-x-for-y", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100000), types.uint(99940)], deployer.address)
        ]);

        block.receipts[0].result.expectOk().expectBool(true)
        console.log(JSON.stringify(block.receipts));
    },
});

// Test swap x for y 9 times and get the same amount
Clarinet.test({
    name: "Ensure we can swap x-token for y-token 9 times and get the same amount get pair data",
    async fn(chain: Chain, accounts: Map<string, Account>) {
        const deployer = accounts.get("deployer")!;
        const wallet_1 = accounts.get("wallet_1")!;

        chain.mineBlock([
            Tx.contractCall("usda-token", "mint", [types.uint(100000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("susdt-token", "mint", [types.uint(100000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "create-pair", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.ascii("test"), types.uint(10000000000), types.uint(10000000000)], deployer.address)
        ]);
        
        for (let i = 0; i < 8; i++) {
            chain.mineBlock([
                Tx.contractCall("stableswap", "swap-x-for-y", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100000), types.uint(99940)], deployer.address)
            ]);
        }

        chain.mineBlock([
            Tx.contractCall("stableswap", "swap-x-for-y", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100000), types.uint(99940)], deployer.address)
        ]);

        const call = chain.callReadOnlyFn("stableswap", "get-pair-data", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token")], deployer.address)

        call.result.expectSome().expectTuple()
        console.log(JSON.stringify(call.result));
    },
});

// Test swap x for y pair not set
Clarinet.test({
    name: "Ensure we can NOT swap x-token for y-token if there is no pair set",
    async fn(chain: Chain, accounts: Map<string, Account>) {
        const deployer = accounts.get("deployer")!;
        const wallet_1 = accounts.get("wallet_1")!;

        const block = chain.mineBlock([
            Tx.contractCall("stableswap", "swap-x-for-y", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100000), types.uint(99940)], deployer.address)
        ]);

        block.receipts[0].result.expectErr()
        console.log(JSON.stringify(block.receipts));
    },
});

// Test swap x for y pair not approved
Clarinet.test({
    name: "Ensure we can NOT swap x-token for y-token if pair is not approved",
    async fn(chain: Chain, accounts: Map<string, Account>) {
        const deployer = accounts.get("deployer")!;
        const wallet_1 = accounts.get("wallet_1")!;

        chain.mineBlock([
            Tx.contractCall("usda-token", "mint", [types.uint(100000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("susdt-token", "mint", [types.uint(100000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "create-pair", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.ascii("test"), types.uint(10000000000), types.uint(10000000000)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "set-pair-approval", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.bool(false)], deployer.address)
        ]);

        const block = chain.mineBlock([
            Tx.contractCall("stableswap", "swap-x-for-y", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100000), types.uint(99940)], deployer.address)
        ]);

        block.receipts[0].result.expectErr()
        console.log(JSON.stringify(block.receipts));
    },
});

// Test swap x for y if x is too high
Clarinet.test({
    name: "Ensure we can NOT swap x-token for y-token if x-token to high",
    async fn(chain: Chain, accounts: Map<string, Account>) {
        const deployer = accounts.get("deployer")!;
        const wallet_1 = accounts.get("wallet_1")!;

        chain.mineBlock([
            Tx.contractCall("usda-token", "mint", [types.uint(100000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("susdt-token", "mint", [types.uint(100000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "create-pair", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.ascii("test"), types.uint(10000000000), types.uint(10000000000)], deployer.address)
        ]);

        const block = chain.mineBlock([
            Tx.contractCall("stableswap", "swap-x-for-y", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100000000000), types.uint(99940)], deployer.address)
        ]);

        block.receipts[0].result.expectErr()
        console.log(JSON.stringify(block.receipts));
    },
});

// Test swap x for y if x empty pool
Clarinet.test({
    name: "Ensure we can NOT swap x-token for y-token and empty pool",
    async fn(chain: Chain, accounts: Map<string, Account>) {
        const deployer = accounts.get("deployer")!;
        const wallet_1 = accounts.get("wallet_1")!;

        chain.mineBlock([
            Tx.contractCall("usda-token", "mint", [types.uint(200000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("susdt-token", "mint", [types.uint(200000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "create-pair", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.ascii("test"), types.uint(10000000000), types.uint(10000000000)], deployer.address)
        ]);

        const block = chain.mineBlock([
            Tx.contractCall("stableswap", "swap-x-for-y", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(10000000000), types.uint(900000000)], deployer.address)
        ]);

        block.receipts[0].result.expectOk()
        console.log(JSON.stringify(block.receipts));
    },
});

// Test swap x for y if x empty pool
Clarinet.test({
    name: "Ensure we can NOT swap x-token for y-token and empty pool get pair data",
    async fn(chain: Chain, accounts: Map<string, Account>) {
        const deployer = accounts.get("deployer")!;
        const wallet_1 = accounts.get("wallet_1")!;

        chain.mineBlock([
            Tx.contractCall("usda-token", "mint", [types.uint(200000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("susdt-token", "mint", [types.uint(200000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "create-pair", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.ascii("test"), types.uint(10000000000), types.uint(10000000000)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "swap-x-for-y", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(10000000000), types.uint(900000000)], deployer.address)
        ]);

        const call = chain.callReadOnlyFn("stableswap", "get-pair-data", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token")], deployer.address)

        call.result.expectSome().expectTuple()
        console.log(JSON.stringify(call.result));
    },
});

// Test swap x for y if x empty pool
Clarinet.test({
    name: "Ensure we can NOT swap x-token for y-token swap again for the remaining amount and empty pool",
    async fn(chain: Chain, accounts: Map<string, Account>) {
        const deployer = accounts.get("deployer")!;
        const wallet_1 = accounts.get("wallet_1")!;

        chain.mineBlock([
            Tx.contractCall("usda-token", "mint", [types.uint(300000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("susdt-token", "mint", [types.uint(300000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "create-pair", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.ascii("test"), types.uint(10000000000), types.uint(10000000000)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "swap-x-for-y", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(10000000000), types.uint(900000000)], deployer.address)
        ]);

        const block = chain.mineBlock([
            Tx.contractCall("stableswap", "swap-x-for-y", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(978800276), types.uint(90000000)], deployer.address)
        ]);

        block.receipts[0].result.expectOk()
        console.log(JSON.stringify(block.receipts));
    },
});

// Test swap x for y if x empty pool
Clarinet.test({
    name: "Ensure we can NOT swap x-token for y-token swap again for the remaining amount and empty pool get pair data",
    async fn(chain: Chain, accounts: Map<string, Account>) {
        const deployer = accounts.get("deployer")!;
        const wallet_1 = accounts.get("wallet_1")!;

        chain.mineBlock([
            Tx.contractCall("usda-token", "mint", [types.uint(300000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("susdt-token", "mint", [types.uint(300000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "create-pair", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.ascii("test"), types.uint(10000000000), types.uint(10000000000)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "swap-x-for-y", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(10000000000), types.uint(900000000)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "swap-x-for-y", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(978800276), types.uint(90000000)], deployer.address)
        ]);

        const call = chain.callReadOnlyFn("stableswap", "get-pair-data", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token")], deployer.address)

        call.result.expectSome().expectTuple()
        console.log(JSON.stringify(call.result));
    },
});

// Test swap x for y if y amount not min
Clarinet.test({
    name: "Ensure we can NOT swap x-token for y-token if min y-token amount not met",
    async fn(chain: Chain, accounts: Map<string, Account>) {
        const deployer = accounts.get("deployer")!;
        const wallet_1 = accounts.get("wallet_1")!;

        chain.mineBlock([
            Tx.contractCall("usda-token", "mint", [types.uint(100000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("susdt-token", "mint", [types.uint(100000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "create-pair", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.ascii("test"), types.uint(10000000000), types.uint(10000000000)], deployer.address)
        ]);

        const block = chain.mineBlock([
            Tx.contractCall("stableswap", "swap-x-for-y", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100000), types.uint(99960)], deployer.address)
        ]);

        block.receipts[0].result.expectErr()
        console.log(JSON.stringify(block.receipts));
    },
});

// Test swap x for y but not enough x-token for transfer
Clarinet.test({
    name: "Ensure we can NOT swap x-token for y-token but not enough x-token for transfer",
    async fn(chain: Chain, accounts: Map<string, Account>) {
        const deployer = accounts.get("deployer")!;
        const wallet_1 = accounts.get("wallet_1")!;

        chain.mineBlock([
            Tx.contractCall("usda-token", "mint", [types.uint(100000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("susdt-token", "mint", [types.uint(100000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "create-pair", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.ascii("test"), types.uint(100000000000), types.uint(100000000000)], deployer.address)
        ]);

        const block = chain.mineBlock([
            Tx.contractCall("stableswap", "swap-x-for-y", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100000), types.uint(99940)], deployer.address)
        ]);

        block.receipts[0].result.expectErr()
        console.log(JSON.stringify(block.receipts));
    },
});

// Test swap x for y but not enough x-token for fee-lps transfer
Clarinet.test({
    name: "Ensure we can NOT swap x-token for y-token but not enough x-token for swap-lps transfer",
    async fn(chain: Chain, accounts: Map<string, Account>) {
        const deployer = accounts.get("deployer")!;
        const wallet_1 = accounts.get("wallet_1")!;

        chain.mineBlock([
            Tx.contractCall("usda-token", "mint", [types.uint(100000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("susdt-token", "mint", [types.uint(100000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "create-pair", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.ascii("test"), types.uint(99999900050), types.uint(99999900050)], deployer.address)
        ]);

        const block = chain.mineBlock([
            Tx.contractCall("stableswap", "swap-x-for-y", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100000), types.uint(99940)], deployer.address)
        ]);

        block.receipts[0].result.expectErr()
        console.log(JSON.stringify(block.receipts));
    },
});

// Test swap x for y but not enough x-token for protocol transfer
Clarinet.test({
    name: "Ensure we can NOT swap x-token for y-token but not enough x-token for protocol transfer",
    async fn(chain: Chain, accounts: Map<string, Account>) {
        const deployer = accounts.get("deployer")!;
        const wallet_1 = accounts.get("wallet_1")!;

        chain.mineBlock([
            Tx.contractCall("usda-token", "mint", [types.uint(100000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("susdt-token", "mint", [types.uint(100000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "create-pair", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.ascii("test"), types.uint(99999900020), types.uint(99999900020)], deployer.address)
        ]);

        const block = chain.mineBlock([
            Tx.contractCall("stableswap", "swap-x-for-y", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100000), types.uint(99940)], deployer.address)
        ]);

        block.receipts[0].result.expectErr()
        console.log(JSON.stringify(block.receipts));
    },
});

////////////////////////////////////////////////
////////////////////////////////////////////////
///////////////// SWAP Y FOR X /////////////////
////////////////////////////////////////////////
////////////////////////////////////////////////

// Test swap y for x
Clarinet.test({
    name: "Ensure we can swap x-token for y-token small amount",
    async fn(chain: Chain, accounts: Map<string, Account>) {
        const deployer = accounts.get("deployer")!;
        const wallet_1 = accounts.get("wallet_1")!;

        chain.mineBlock([
            Tx.contractCall("usda-token", "mint", [types.uint(100000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("susdt-token", "mint", [types.uint(100000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "create-pair", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.ascii("test"), types.uint(10000000000), types.uint(10000000000)], deployer.address)
        ]);

        const block = chain.mineBlock([
            Tx.contractCall("stableswap", "swap-y-for-x", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(10), types.uint(0)], deployer.address)
        ]);

        block.receipts[0].result.expectOk().expectBool(true)
        console.log(JSON.stringify(block.receipts));
    },
});

// Test swap y for x
Clarinet.test({
    name: "Ensure we can swap y-token for x-token",
    async fn(chain: Chain, accounts: Map<string, Account>) {
        const deployer = accounts.get("deployer")!;
        const wallet_1 = accounts.get("wallet_1")!;

        chain.mineBlock([
            Tx.contractCall("usda-token", "mint", [types.uint(100000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("susdt-token", "mint", [types.uint(100000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "create-pair", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.ascii("test"), types.uint(10000000000), types.uint(10000000000)], deployer.address)
        ]);

        const block = chain.mineBlock([
            Tx.contractCall("stableswap", "swap-y-for-x", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100000), types.uint(99940)], deployer.address)
        ]);
        // will we always set a lower expectation of min x? if not, change the asserts to >= of "err-min-x-amount"

        block.receipts[0].result.expectOk().expectBool(true)
        console.log(JSON.stringify(block.receipts));
    },
});

// Test swap y for x pair not set
Clarinet.test({
    name: "Ensure we can NOT swap y-token for x-token if there is no pair set",
    async fn(chain: Chain, accounts: Map<string, Account>) {
        const deployer = accounts.get("deployer")!;
        const wallet_1 = accounts.get("wallet_1")!;

        const block = chain.mineBlock([
            Tx.contractCall("stableswap", "swap-y-for-x", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100000), types.uint(99940)], deployer.address)
        ]);

        block.receipts[0].result.expectErr()
        console.log(JSON.stringify(block.receipts));
    },
});

// Test swap y for x pair not approved
Clarinet.test({
    name: "Ensure we can NOT swap y-token for x-token if pair is not approved",
    async fn(chain: Chain, accounts: Map<string, Account>) {
        const deployer = accounts.get("deployer")!;
        const wallet_1 = accounts.get("wallet_1")!;

        chain.mineBlock([
            Tx.contractCall("usda-token", "mint", [types.uint(100000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("susdt-token", "mint", [types.uint(100000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "create-pair", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.ascii("test"), types.uint(10000000000), types.uint(10000000000)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "set-pair-approval", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.bool(false)], deployer.address)
        ]);

        const block = chain.mineBlock([
            Tx.contractCall("stableswap", "swap-y-for-x", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100000), types.uint(99940)], deployer.address)
        ]);

        block.receipts[0].result.expectErr()
        console.log(JSON.stringify(block.receipts));
    },
});

// Test swap y for x if y is too high
Clarinet.test({
    name: "Ensure we can NOT swap y-token for y-token if y-token to high",
    async fn(chain: Chain, accounts: Map<string, Account>) {
        const deployer = accounts.get("deployer")!;
        const wallet_1 = accounts.get("wallet_1")!;

        chain.mineBlock([
            Tx.contractCall("usda-token", "mint", [types.uint(100000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("susdt-token", "mint", [types.uint(100000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "create-pair", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.ascii("test"), types.uint(10000000000), types.uint(10000000000)], deployer.address)
        ]);

        const block = chain.mineBlock([
            Tx.contractCall("stableswap", "swap-y-for-x", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100000000000), types.uint(99940)], deployer.address)
        ]);

        block.receipts[0].result.expectErr()
        console.log(JSON.stringify(block.receipts));
    },
});

// Test swap y for x if x amount not min
Clarinet.test({
    name: "Ensure we can NOT swap y-token for y-token if min y-token amount not met",
    async fn(chain: Chain, accounts: Map<string, Account>) {
        const deployer = accounts.get("deployer")!;
        const wallet_1 = accounts.get("wallet_1")!;

        chain.mineBlock([
            Tx.contractCall("usda-token", "mint", [types.uint(100000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("susdt-token", "mint", [types.uint(100000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "create-pair", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.ascii("test"), types.uint(10000000000), types.uint(10000000000)], deployer.address)
        ]);

        const block = chain.mineBlock([
            Tx.contractCall("stableswap", "swap-y-for-x", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100000), types.uint(99960)], deployer.address)
        ]);

        block.receipts[0].result.expectErr()
        console.log(JSON.stringify(block.receipts));
    },
});

// Test swap y for x but not enough x-token for transfer
Clarinet.test({
    name: "Ensure we can NOT swap y-token for x-token but not enough x-token for transfer",
    async fn(chain: Chain, accounts: Map<string, Account>) {
        const deployer = accounts.get("deployer")!;
        const wallet_1 = accounts.get("wallet_1")!;

        chain.mineBlock([
            Tx.contractCall("usda-token", "mint", [types.uint(100000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("susdt-token", "mint", [types.uint(100000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "create-pair", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.ascii("test"), types.uint(100000000000), types.uint(100000000000)], deployer.address)
        ]);

        const block = chain.mineBlock([
            Tx.contractCall("stableswap", "swap-y-for-x", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100000), types.uint(99940)], deployer.address)
        ]);

        block.receipts[0].result.expectErr()
        console.log(JSON.stringify(block.receipts));
    },
});

// Test swap x for y but not enough x-token for fee-lps transfer
Clarinet.test({
    name: "Ensure we can NOT swap y-token for x-token but not enough x-token for swap-lps transfer",
    async fn(chain: Chain, accounts: Map<string, Account>) {
        const deployer = accounts.get("deployer")!;
        const wallet_1 = accounts.get("wallet_1")!;

        chain.mineBlock([
            Tx.contractCall("usda-token", "mint", [types.uint(100000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("susdt-token", "mint", [types.uint(100000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "create-pair", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.ascii("test"), types.uint(99999900050), types.uint(99999900050)], deployer.address)
        ]);

        const block = chain.mineBlock([
            Tx.contractCall("stableswap", "swap-y-for-x", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100000), types.uint(99940)], deployer.address)
        ]);

        block.receipts[0].result.expectErr()
        console.log(JSON.stringify(block.receipts));
    },
});

// Test swap x for y but not enough x-token for protocol transfer
Clarinet.test({
    name: "Ensure we can NOT swap y-token for x-token but not enough x-token for protocol transfer",
    async fn(chain: Chain, accounts: Map<string, Account>) {
        const deployer = accounts.get("deployer")!;
        const wallet_1 = accounts.get("wallet_1")!;

        chain.mineBlock([
            Tx.contractCall("usda-token", "mint", [types.uint(100000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("susdt-token", "mint", [types.uint(100000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "create-pair", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.ascii("test"), types.uint(99999900020), types.uint(99999900020)], deployer.address)
        ]);

        const block = chain.mineBlock([
            Tx.contractCall("stableswap", "swap-y-for-x", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100000), types.uint(99940)], deployer.address)
        ]);

        block.receipts[0].result.expectErr()
        console.log(JSON.stringify(block.receipts));
    },
});

/////////////////////////////////////////////////
/////////////////////////////////////////////////
///////////////// ADD-LIQUIDITY /////////////////
/////////////////////////////////////////////////
/////////////////////////////////////////////////


// Test add liquidity 
Clarinet.test({
    name: "Ensure we can add liquidity to a pool with the same previous balance",
    async fn(chain: Chain, accounts: Map<string, Account>) {
        const deployer = accounts.get("deployer")!;
        const wallet_1 = accounts.get("wallet_1")!;

        chain.mineBlock([
            Tx.contractCall("usda-token", "mint", [types.uint(500000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("susdt-token", "mint", [types.uint(500000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "create-pair", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.ascii("test"), types.uint(100000000000), types.uint(100000000000)], deployer.address)
        ]);

        const block = chain.mineBlock([
            Tx.contractCall("stableswap", "add-liquidity", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100000000000), types.uint(100000000000), types.uint(19999999995)], deployer.address)
        ]);

        block.receipts[0].result.expectOk()
        console.log(JSON.stringify(block.receipts));
    },
});

// Test add liquidity 
Clarinet.test({
    name: "Ensure we can add liquidity to a pool small amount with the same previous balance",
    async fn(chain: Chain, accounts: Map<string, Account>) {
        const deployer = accounts.get("deployer")!;
        const wallet_1 = accounts.get("wallet_1")!;

        chain.mineBlock([
            Tx.contractCall("usda-token", "mint", [types.uint(500000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("susdt-token", "mint", [types.uint(500000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "create-pair", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.ascii("test"), types.uint(100000000000), types.uint(100000000000)], deployer.address)
        ]);

        const block = chain.mineBlock([
            Tx.contractCall("stableswap", "add-liquidity", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.uint(100), types.uint(198)], deployer.address)
        ]);

        block.receipts[0].result.expectOk()
        console.log(JSON.stringify(block.receipts));
    },
});

// Test add liquidity 
Clarinet.test({
    name: "Ensure we can add liquidity to a pool with different previous balance",
    async fn(chain: Chain, accounts: Map<string, Account>) {
        const deployer = accounts.get("deployer")!;
        const wallet_1 = accounts.get("wallet_1")!;

        chain.mineBlock([
            Tx.contractCall("usda-token", "mint", [types.uint(500000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("susdt-token", "mint", [types.uint(500000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "create-pair", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.ascii("test"), types.uint(100000000000), types.uint(100000000000)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "swap-y-for-x", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100000), types.uint(99940)], deployer.address)
        ]);

        const block = chain.mineBlock([
            Tx.contractCall("stableswap", "add-liquidity", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(10000000000), types.uint(10000000000), types.uint(19999999995)], deployer.address)
        ]);

        block.receipts[0].result.expectOk()
        console.log(JSON.stringify(block.receipts));
    },
});

// Test add liquidity 
Clarinet.test({
    name: "Ensure we can add liquidity to a pool with different previous balance small amount",
    async fn(chain: Chain, accounts: Map<string, Account>) {
        const deployer = accounts.get("deployer")!;
        const wallet_1 = accounts.get("wallet_1")!;

        chain.mineBlock([
            Tx.contractCall("usda-token", "mint", [types.uint(500000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("susdt-token", "mint", [types.uint(500000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "create-pair", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.ascii("test"), types.uint(100000000000), types.uint(100000000000)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "swap-y-for-x", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100000), types.uint(99940)], deployer.address)
        ]);

        const block = chain.mineBlock([
            Tx.contractCall("stableswap", "add-liquidity", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.uint(100), types.uint(198)], deployer.address)
        ]);

        block.receipts[0].result.expectOk()
        console.log(JSON.stringify(block.receipts));
    },
});

// Test add liquidity 
Clarinet.test({
    name: "Ensure we can add liquidity of one token to a pool with same previous balance",
    async fn(chain: Chain, accounts: Map<string, Account>) {
        const deployer = accounts.get("deployer")!;
        const wallet_1 = accounts.get("wallet_1")!;

        chain.mineBlock([
            Tx.contractCall("usda-token", "mint", [types.uint(500000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("susdt-token", "mint", [types.uint(500000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "create-pair", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.ascii("test"), types.uint(100000000000), types.uint(100000000000)], deployer.address)
        ]);

        const block = chain.mineBlock([
            Tx.contractCall("stableswap", "add-liquidity", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(1000), types.uint(0), types.uint(999)], deployer.address)
        ]);

        block.receipts[0].result.expectOk()
        console.log(JSON.stringify(block.receipts));
    },
});

// Test add liquidity 
Clarinet.test({
    name: "Ensure we can add liquidity of other one token to a pool with same previous balance",
    async fn(chain: Chain, accounts: Map<string, Account>) {
        const deployer = accounts.get("deployer")!;
        const wallet_1 = accounts.get("wallet_1")!;

        chain.mineBlock([
            Tx.contractCall("usda-token", "mint", [types.uint(500000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("susdt-token", "mint", [types.uint(500000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "create-pair", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.ascii("test"), types.uint(100000000000), types.uint(100000000000)], deployer.address)
        ]);

        const block = chain.mineBlock([
            Tx.contractCall("stableswap", "add-liquidity", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(0), types.uint(1000), types.uint(999)], deployer.address)
        ]);

        block.receipts[0].result.expectOk()
        console.log(JSON.stringify(block.receipts));
    },
});

// Test add liquidity 
Clarinet.test({
    name: "Ensure we can add liquidity of other one token to a pool with same previous balance small amount",
    async fn(chain: Chain, accounts: Map<string, Account>) {
        const deployer = accounts.get("deployer")!;
        const wallet_1 = accounts.get("wallet_1")!;

        chain.mineBlock([
            Tx.contractCall("usda-token", "mint", [types.uint(500000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("susdt-token", "mint", [types.uint(500000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "create-pair", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.ascii("test"), types.uint(100000000000), types.uint(100000000000)], deployer.address)
        ]);

        const block = chain.mineBlock([
            Tx.contractCall("stableswap", "add-liquidity", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(0), types.uint(100), types.uint(99)], deployer.address)
        ]);

        block.receipts[0].result.expectOk()
        console.log(JSON.stringify(block.receipts));
    },
});

// Test add liquidity 
Clarinet.test({
    name: "Ensure we can add liquidity of one token to a pool with same previous balance small amount",
    async fn(chain: Chain, accounts: Map<string, Account>) {
        const deployer = accounts.get("deployer")!;
        const wallet_1 = accounts.get("wallet_1")!;

        chain.mineBlock([
            Tx.contractCall("usda-token", "mint", [types.uint(500000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("susdt-token", "mint", [types.uint(500000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "create-pair", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.ascii("test"), types.uint(100000000000), types.uint(100000000000)], deployer.address)
        ]);

        const block = chain.mineBlock([
            Tx.contractCall("stableswap", "add-liquidity", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.uint(0), types.uint(99)], deployer.address)
        ]);

        block.receipts[0].result.expectOk()
        console.log(JSON.stringify(block.receipts));
    },
});

// Test add liquidity 
Clarinet.test({
    name: "Ensure we can add liquidity of one token to a pool with different previous balance",
    async fn(chain: Chain, accounts: Map<string, Account>) {
        const deployer = accounts.get("deployer")!;
        const wallet_1 = accounts.get("wallet_1")!;

        chain.mineBlock([
            Tx.contractCall("usda-token", "mint", [types.uint(500000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("susdt-token", "mint", [types.uint(500000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "create-pair", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.ascii("test"), types.uint(100000000000), types.uint(100000000000)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "swap-y-for-x", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100000), types.uint(99940)], deployer.address)
        ]);

        const block = chain.mineBlock([
            Tx.contractCall("stableswap", "add-liquidity", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(1000), types.uint(0), types.uint(999)], deployer.address)
        ]);

        block.receipts[0].result.expectOk()
        console.log(JSON.stringify(block.receipts));
    },
});

// Test add liquidity 
Clarinet.test({
    name: "Ensure we can add liquidity of other one token to a pool with different previous balance",
    async fn(chain: Chain, accounts: Map<string, Account>) {
        const deployer = accounts.get("deployer")!;
        const wallet_1 = accounts.get("wallet_1")!;

        chain.mineBlock([
            Tx.contractCall("usda-token", "mint", [types.uint(500000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("susdt-token", "mint", [types.uint(500000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "create-pair", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.ascii("test"), types.uint(100000000000), types.uint(100000000000)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "swap-y-for-x", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100000), types.uint(99940)], deployer.address)
        ]);

        const block = chain.mineBlock([
            Tx.contractCall("stableswap", "add-liquidity", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(0), types.uint(1000), types.uint(999)], deployer.address)
        ]);

        block.receipts[0].result.expectOk()
        console.log(JSON.stringify(block.receipts));
    },
});

// Test add liquidity 
Clarinet.test({
    name: "Ensure we can add liquidity of one token to a pool with different previous balance small amount",
    async fn(chain: Chain, accounts: Map<string, Account>) {
        const deployer = accounts.get("deployer")!;
        const wallet_1 = accounts.get("wallet_1")!;

        chain.mineBlock([
            Tx.contractCall("usda-token", "mint", [types.uint(500000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("susdt-token", "mint", [types.uint(500000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "create-pair", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.ascii("test"), types.uint(100000000000), types.uint(100000000000)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "swap-y-for-x", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100000), types.uint(99940)], deployer.address)
        ]);

        const block = chain.mineBlock([
            Tx.contractCall("stableswap", "add-liquidity", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.uint(0), types.uint(99)], deployer.address)
        ]);

        block.receipts[0].result.expectOk()
        console.log(JSON.stringify(block.receipts));
    },
});

// Test add liquidity 
Clarinet.test({
    name: "Ensure we can add liquidity of other one token to a pool with different previous balance small amount",
    async fn(chain: Chain, accounts: Map<string, Account>) {
        const deployer = accounts.get("deployer")!;
        const wallet_1 = accounts.get("wallet_1")!;

        chain.mineBlock([
            Tx.contractCall("usda-token", "mint", [types.uint(500000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("susdt-token", "mint", [types.uint(500000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "create-pair", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.ascii("test"), types.uint(100000000000), types.uint(100000000000)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "swap-y-for-x", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100000), types.uint(99940)], deployer.address)
        ]);

        const block = chain.mineBlock([
            Tx.contractCall("stableswap", "add-liquidity", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(0), types.uint(100), types.uint(99)], deployer.address)
        ]);

        block.receipts[0].result.expectOk()
        console.log(JSON.stringify(block.receipts));
    },
});

// Test add liquidity 
Clarinet.test({
    name: "Ensure we can NOT add liquidity to a none pair",
    async fn(chain: Chain, accounts: Map<string, Account>) {
        const deployer = accounts.get("deployer")!;
        const wallet_1 = accounts.get("wallet_1")!;

        const block = chain.mineBlock([
            Tx.contractCall("stableswap", "add-liquidity", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(0), types.uint(100), types.uint(0)], deployer.address)
        ]);

        block.receipts[0].result.expectErr()
        console.log(JSON.stringify(block.receipts));
    },
});

// Test add liquidity 
Clarinet.test({
    name: "Ensure we can NOT add liquidity to a disapproved pair",
    async fn(chain: Chain, accounts: Map<string, Account>) {
        const deployer = accounts.get("deployer")!;
        const wallet_1 = accounts.get("wallet_1")!;

        chain.mineBlock([
            Tx.contractCall("usda-token", "mint", [types.uint(500000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("susdt-token", "mint", [types.uint(500000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "create-pair", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.ascii("test"), types.uint(100000000000), types.uint(100000000000)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "swap-y-for-x", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100000), types.uint(99940)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "set-pair-approval", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.bool(false)], deployer.address)
        ]);

        const block = chain.mineBlock([
            Tx.contractCall("stableswap", "add-liquidity", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100000), types.uint(100000), types.uint(199998)], deployer.address)
        ]);

        block.receipts[0].result.expectErr()
        console.log(JSON.stringify(block.receipts));
    },
});

// Test add liquidity 
Clarinet.test({
    name: "Ensure we can NOT add Zero liquidity",
    async fn(chain: Chain, accounts: Map<string, Account>) {
        const deployer = accounts.get("deployer")!;
        const wallet_1 = accounts.get("wallet_1")!;

        chain.mineBlock([
            Tx.contractCall("usda-token", "mint", [types.uint(500000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("susdt-token", "mint", [types.uint(500000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "create-pair", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.ascii("test"), types.uint(100000000000), types.uint(100000000000)], deployer.address)
        ]);

        const block = chain.mineBlock([
            Tx.contractCall("stableswap", "add-liquidity", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(0), types.uint(0), types.uint(0)], deployer.address)
        ]);

        block.receipts[0].result.expectErr()
        console.log(JSON.stringify(block.receipts));
    },
});

// Test add liquidity 
Clarinet.test({
    name: "Ensure we can NOT add liquidity if min-lp tokens not met",
    async fn(chain: Chain, accounts: Map<string, Account>) {
        const deployer = accounts.get("deployer")!;
        const wallet_1 = accounts.get("wallet_1")!;

        chain.mineBlock([
            Tx.contractCall("usda-token", "mint", [types.uint(500000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("susdt-token", "mint", [types.uint(500000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "create-pair", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.ascii("test"), types.uint(100000000000), types.uint(100000000000)], deployer.address)
        ]);

        const block = chain.mineBlock([
            Tx.contractCall("stableswap", "add-liquidity", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.uint(100), types.uint(200)], deployer.address)
        ]);

        block.receipts[0].result.expectErr()
        console.log(JSON.stringify(block.receipts));
    },
});

