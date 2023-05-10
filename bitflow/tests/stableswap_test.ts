
import { Clarinet, Tx, Chain, Account, types, EmptyBlock } from 'https://deno.land/x/clarinet@v1.5.3/index.ts';
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
            Tx.contractCall("usda-token", "mint", [types.uint(100000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("susdt-token", "mint", [types.uint(10000000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "create-pair", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.ascii("test"), types.uint(1000000000000000), types.uint(10000000000000)], deployer.address)
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
            Tx.contractCall("usda-token", "mint", [types.uint(100000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("susdt-token", "mint", [types.uint(10000000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "create-pair", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.ascii("test"), types.uint(1000000000000000), types.uint(10000000000000)], deployer.address)
        ]);

        const block = chain.mineBlock([
            Tx.contractCall("stableswap", "swap-x-for-y", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(10000), types.uint(0)], deployer.address)
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
            Tx.contractCall("usda-token", "mint", [types.uint(100000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("susdt-token", "mint", [types.uint(10000000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "create-pair", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.ascii("test"), types.uint(1000000000000000), types.uint(10000000000000)], deployer.address)
        ]);

        const block = chain.mineBlock([
            Tx.contractCall("stableswap", "swap-x-for-y", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(10000000000), types.uint(99940000)], deployer.address)
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
            Tx.contractCall("usda-token", "mint", [types.uint(100000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("susdt-token", "mint", [types.uint(10000000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "create-pair", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.ascii("test"), types.uint(1000000000000000), types.uint(10000000000000)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "swap-x-for-y", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(10000000000), types.uint(99940000)], deployer.address)
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
            Tx.contractCall("usda-token", "mint", [types.uint(100000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("susdt-token", "mint", [types.uint(10000000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "create-pair", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.ascii("test"), types.uint(1000000000000000), types.uint(10000000000000)], deployer.address)
        ]);
        
        for (let i = 0; i < 8; i++) {
            chain.mineBlock([
                Tx.contractCall("stableswap", "swap-x-for-y", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(10000000000), types.uint(99940000)], deployer.address)
            ]);
        }

        const block = chain.mineBlock([
            Tx.contractCall("stableswap", "swap-x-for-y", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(10000000000), types.uint(99940000)], deployer.address)
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
            Tx.contractCall("usda-token", "mint", [types.uint(100000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("susdt-token", "mint", [types.uint(10000000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "create-pair", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.ascii("test"), types.uint(1000000000000000), types.uint(10000000000000)], deployer.address)
        ]);
        
        for (let i = 0; i < 8; i++) {
            chain.mineBlock([
                Tx.contractCall("stableswap", "swap-x-for-y", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(10000000000), types.uint(99940000)], deployer.address)
            ]);
        }

        chain.mineBlock([
            Tx.contractCall("stableswap", "swap-x-for-y", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(10000000000), types.uint(99940000)], deployer.address)
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
            Tx.contractCall("stableswap", "swap-x-for-y", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100000000), types.uint(99994000)], deployer.address)
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
            Tx.contractCall("usda-token", "mint", [types.uint(100000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("susdt-token", "mint", [types.uint(10000000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "create-pair", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.ascii("test"), types.uint(1000000000000000), types.uint(10000000000000)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "set-pair-approval", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.bool(false)], deployer.address)
        ]);

        const block = chain.mineBlock([
            Tx.contractCall("stableswap", "swap-x-for-y", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100000000), types.uint(99994000)], deployer.address)
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
            Tx.contractCall("usda-token", "mint", [types.uint(100000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("susdt-token", "mint", [types.uint(10000000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "create-pair", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.ascii("test"), types.uint(1000000000000000), types.uint(10000000000000)], deployer.address)
        ]);

        const block = chain.mineBlock([
            Tx.contractCall("stableswap", "swap-x-for-y", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(10000000000000000), types.uint(95000000000000)], deployer.address)
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
            Tx.contractCall("usda-token", "mint", [types.uint(200000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("susdt-token", "mint", [types.uint(10000000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "create-pair", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.ascii("test"), types.uint(1000000000000000), types.uint(10000000000000)], deployer.address)
        ]);

        const block = chain.mineBlock([
            Tx.contractCall("stableswap", "swap-x-for-y", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(1000000000000000), types.uint(9000000000000)], deployer.address)
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
            Tx.contractCall("usda-token", "mint", [types.uint(200000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("susdt-token", "mint", [types.uint(10000000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "create-pair", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.ascii("test"), types.uint(1000000000000000), types.uint(10000000000000)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "swap-x-for-y", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(1000000000000000), types.uint(9000000000000)], deployer.address)
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
            Tx.contractCall("usda-token", "mint", [types.uint(300000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("susdt-token", "mint", [types.uint(10000000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "create-pair", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.ascii("test"), types.uint(1000000000000000), types.uint(10000000000000)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "swap-x-for-y", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(10000000000000), types.uint(900000000000)], deployer.address)
        ]);

        const block = chain.mineBlock([
            Tx.contractCall("stableswap", "swap-x-for-y", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(98103715600000), types.uint(90000000000)], deployer.address)
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
            Tx.contractCall("usda-token", "mint", [types.uint(300000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("susdt-token", "mint", [types.uint(30000000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "create-pair", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.ascii("test"), types.uint(1000000000000000), types.uint(10000000000000)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "swap-x-for-y", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(10000000000000), types.uint(900000000000)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "swap-x-for-y", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(98103715600000), types.uint(90000000000)], deployer.address)
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
            Tx.contractCall("usda-token", "mint", [types.uint(100000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("susdt-token", "mint", [types.uint(30000000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "create-pair", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.ascii("test"), types.uint(1000000000000000), types.uint(10000000000000)], deployer.address)
        ]);

        const block = chain.mineBlock([
            Tx.contractCall("stableswap", "swap-x-for-y", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100000000), types.uint(9999996)], deployer.address)
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
            Tx.contractCall("usda-token", "mint", [types.uint(1000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("susdt-token", "mint", [types.uint(10000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "create-pair", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.ascii("test"), types.uint(10000000000000000), types.uint(100000000000000)], deployer.address)
        ]);

        const block = chain.mineBlock([
            Tx.contractCall("stableswap", "swap-x-for-y", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(10000000000), types.uint(9994000)], deployer.address)
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
            Tx.contractCall("usda-token", "mint", [types.uint(1000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("susdt-token", "mint", [types.uint(10000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "create-pair", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.ascii("test"), types.uint(9999990005000), types.uint(99999900050)], deployer.address)
        ]);

        const block = chain.mineBlock([
            Tx.contractCall("stableswap", "swap-x-for-y", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(10000000), types.uint(9994)], deployer.address)
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
            Tx.contractCall("usda-token", "mint", [types.uint(1000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("susdt-token", "mint", [types.uint(10000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "create-pair", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.ascii("test"), types.uint(9999990002000), types.uint(99999900020)], deployer.address)
        ]);

        const block = chain.mineBlock([
            Tx.contractCall("stableswap", "swap-x-for-y", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(10000000), types.uint(9994)], deployer.address)
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
    name: "Ensure we can swap y-token for x-token small amount",
    async fn(chain: Chain, accounts: Map<string, Account>) {
        const deployer = accounts.get("deployer")!;
        const wallet_1 = accounts.get("wallet_1")!;

        chain.mineBlock([
            Tx.contractCall("usda-token", "mint", [types.uint(100000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("susdt-token", "mint", [types.uint(10000000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "create-pair", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.ascii("test"), types.uint(1000000000000000), types.uint(10000000000000)], deployer.address)
        ]);

        const block = chain.mineBlock([
            Tx.contractCall("stableswap", "swap-y-for-x", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(10000), types.uint(0)], deployer.address)
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
            Tx.contractCall("usda-token", "mint", [types.uint(100000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("susdt-token", "mint", [types.uint(10000000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "create-pair", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.ascii("test"), types.uint(1000000000000000), types.uint(10000000000000)], deployer.address)
        ]);

        const block = chain.mineBlock([
            Tx.contractCall("stableswap", "swap-y-for-x", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100000000), types.uint(9993998000)], deployer.address)
        ]);
        // will we always set a lower expectation of min y? if not, change the asserts to >= of "err-min-y-amount"

        block.receipts[0].result.expectOk().expectBool(true)
        console.log(JSON.stringify(block.receipts));
    },
});

// Test swap y for x
Clarinet.test({
    name: "Ensure we can swap y-token for x-token get pair data back",
    async fn(chain: Chain, accounts: Map<string, Account>) {
        const deployer = accounts.get("deployer")!;
        const wallet_1 = accounts.get("wallet_1")!;

        chain.mineBlock([
            Tx.contractCall("usda-token", "mint", [types.uint(100000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("susdt-token", "mint", [types.uint(10000000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "create-pair", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.ascii("test"), types.uint(1000000000000000), types.uint(10000000000000)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "swap-y-for-x", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100000000), types.uint(9993998000)], deployer.address)
        ]);

        const call = chain.callReadOnlyFn("stableswap", "get-pair-data", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token")], deployer.address)

        call.result.expectSome().expectTuple()
        console.log(JSON.stringify(call.result));
    },
});

// Test swap y for x 9 times and get the same amount
Clarinet.test({
    name: "Ensure we can swap y-token for x-token 9 times and get the same amount",
    async fn(chain: Chain, accounts: Map<string, Account>) {
        const deployer = accounts.get("deployer")!;
        const wallet_1 = accounts.get("wallet_1")!;

        chain.mineBlock([
            Tx.contractCall("usda-token", "mint", [types.uint(100000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("susdt-token", "mint", [types.uint(10000000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "create-pair", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.ascii("test"), types.uint(1000000000000000), types.uint(10000000000000)], deployer.address)
        ]);
        
        for (let i = 0; i < 8; i++) {
            chain.mineBlock([
                Tx.contractCall("stableswap", "swap-y-for-x", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100000000), types.uint(999998000)], deployer.address)
            ]);
        }

        const block = chain.mineBlock([
            Tx.contractCall("stableswap", "swap-y-for-x", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100000000), types.uint(999998000)], deployer.address)
        ]);

        block.receipts[0].result.expectOk().expectBool(true)
        console.log(JSON.stringify(block.receipts));
    },
});

// Test swap y for x 9 times and get the same amount
Clarinet.test({
    name: "Ensure we can swap y-token for x-token 9 times and get the same amount get pair data",
    async fn(chain: Chain, accounts: Map<string, Account>) {
        const deployer = accounts.get("deployer")!;
        const wallet_1 = accounts.get("wallet_1")!;

        chain.mineBlock([
            Tx.contractCall("usda-token", "mint", [types.uint(100000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("susdt-token", "mint", [types.uint(10000000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "create-pair", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.ascii("test"), types.uint(1000000000000000), types.uint(10000000000000)], deployer.address)
        ]);
        
        for (let i = 0; i < 8; i++) {
            chain.mineBlock([
                Tx.contractCall("stableswap", "swap-y-for-x", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100000000), types.uint(999998000)], deployer.address)
            ]);
        }

        chain.mineBlock([
            Tx.contractCall("stableswap", "swap-y-for-x", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100000000), types.uint(999998000)], deployer.address)
        ]);

        const call = chain.callReadOnlyFn("stableswap", "get-pair-data", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token")], deployer.address)

        call.result.expectSome().expectTuple()
        console.log(JSON.stringify(call.result));
    },
});

// Test swap y for x pair not set
Clarinet.test({
    name: "Ensure we can NOT swap y-token for x-token if there is no pair set",
    async fn(chain: Chain, accounts: Map<string, Account>) {
        const deployer = accounts.get("deployer")!;
        const wallet_1 = accounts.get("wallet_1")!;

        const block = chain.mineBlock([
            Tx.contractCall("stableswap", "swap-y-for-x", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(1000000), types.uint(9993998)], deployer.address)
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
            Tx.contractCall("usda-token", "mint", [types.uint(100000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("susdt-token", "mint", [types.uint(10000000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "create-pair", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.ascii("test"), types.uint(1000000000000000), types.uint(10000000000000)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "set-pair-approval", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.bool(false)], deployer.address)
        ]);

        const block = chain.mineBlock([
            Tx.contractCall("stableswap", "swap-y-for-x", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100000000), types.uint(99939000)], deployer.address)
        ]);

        block.receipts[0].result.expectErr()
        console.log(JSON.stringify(block.receipts));
    },
});

// Test swap y for x if x is too high
Clarinet.test({
    name: "Ensure we can NOT swap y-token for x-token if y-token to high",
    async fn(chain: Chain, accounts: Map<string, Account>) {
        const deployer = accounts.get("deployer")!;
        const wallet_1 = accounts.get("wallet_1")!;

        chain.mineBlock([
            Tx.contractCall("usda-token", "mint", [types.uint(100000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("susdt-token", "mint", [types.uint(10000000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "create-pair", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.ascii("test"), types.uint(1000000000000000), types.uint(10000000000000)], deployer.address)
        ]);

        const block = chain.mineBlock([
            Tx.contractCall("stableswap", "swap-y-for-x", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100000000000000), types.uint(9500000000000000)], deployer.address)
        ]);

        block.receipts[0].result.expectErr()
        console.log(JSON.stringify(block.receipts));
    },
});

// Test swap y for x if x empty pool
Clarinet.test({
    name: "Ensure we can NOT swap y-token for x-token and empty pool",
    async fn(chain: Chain, accounts: Map<string, Account>) {
        const deployer = accounts.get("deployer")!;
        const wallet_1 = accounts.get("wallet_1")!;

        chain.mineBlock([
            Tx.contractCall("usda-token", "mint", [types.uint(200000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("susdt-token", "mint", [types.uint(10000000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "create-pair", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.ascii("test"), types.uint(1000000000000000), types.uint(10000000000000)], deployer.address)
        ]);

        const block = chain.mineBlock([
            Tx.contractCall("stableswap", "swap-y-for-x", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(10000000000000), types.uint(900000000000000)], deployer.address)
        ]);

        block.receipts[0].result.expectOk()
        console.log(JSON.stringify(block.receipts));
    },
});

// Test swap y for x if x empty pool
Clarinet.test({
    name: "Ensure we can NOT swap y-token for x-token and empty pool get pair data",
    async fn(chain: Chain, accounts: Map<string, Account>) {
        const deployer = accounts.get("deployer")!;
        const wallet_1 = accounts.get("wallet_1")!;

        chain.mineBlock([
            Tx.contractCall("usda-token", "mint", [types.uint(200000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("susdt-token", "mint", [types.uint(10000000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "create-pair", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.ascii("test"), types.uint(1000000000000000), types.uint(10000000000000)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "swap-y-for-x", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(10000000000000), types.uint(900000000000000)], deployer.address)
        ]);

        const call = chain.callReadOnlyFn("stableswap", "get-pair-data", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token")], deployer.address)

        call.result.expectSome().expectTuple()
        console.log(JSON.stringify(call.result));
    },
});

// Test swap y for x if x empty pool
Clarinet.test({
    name: "Ensure we can NOT swap y-token for x-token swap again for the remaining amount and empty pool",
    async fn(chain: Chain, accounts: Map<string, Account>) {
        const deployer = accounts.get("deployer")!;
        const wallet_1 = accounts.get("wallet_1")!;

        chain.mineBlock([
            Tx.contractCall("usda-token", "mint", [types.uint(300000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("susdt-token", "mint", [types.uint(10000000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "create-pair", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.ascii("test"), types.uint(1000000000000000), types.uint(10000000000000)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "swap-y-for-x", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100000000000), types.uint(90000000000000)], deployer.address)
        ]);

        const block = chain.mineBlock([
            Tx.contractCall("stableswap", "swap-y-for-x", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(9018962843000), types.uint(900000000000)], deployer.address)
        ]);

        block.receipts[0].result.expectOk()
        console.log(JSON.stringify(block.receipts));
    },
});

// Test swap y for x if x empty pool
Clarinet.test({
    name: "Ensure we can NOT swap y-token for x-token swap again for the remaining amount and empty pool get pair data",
    async fn(chain: Chain, accounts: Map<string, Account>) {
        const deployer = accounts.get("deployer")!;
        const wallet_1 = accounts.get("wallet_1")!;

        chain.mineBlock([
            Tx.contractCall("usda-token", "mint", [types.uint(300000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("susdt-token", "mint", [types.uint(30000000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "create-pair", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.ascii("test"), types.uint(1000000000000000), types.uint(10000000000000)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "swap-y-for-x", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(10000000000000), types.uint(900000000000)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "swap-y-for-x", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(981037156000), types.uint(9000000000000)], deployer.address)
        ]);

        const call = chain.callReadOnlyFn("stableswap", "get-pair-data", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token")], deployer.address)

        call.result.expectSome().expectTuple()
        console.log(JSON.stringify(call.result));
    },
});

// Test swap y for x if y amount not min
Clarinet.test({
    name: "Ensure we can NOT swap y-token for x-token if min x-token amount not met",
    async fn(chain: Chain, accounts: Map<string, Account>) {
        const deployer = accounts.get("deployer")!;
        const wallet_1 = accounts.get("wallet_1")!;

        chain.mineBlock([
            Tx.contractCall("usda-token", "mint", [types.uint(100000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("susdt-token", "mint", [types.uint(30000000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "create-pair", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.ascii("test"), types.uint(1000000000000000), types.uint(10000000000000)], deployer.address)
        ]);

        const block = chain.mineBlock([
            Tx.contractCall("stableswap", "swap-y-for-x", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(1000000), types.uint(999600000)], deployer.address)
        ]);

        block.receipts[0].result.expectErr()
        console.log(JSON.stringify(block.receipts));
    },
});

// Test swap y for x but not enough y-token for transfer
Clarinet.test({
    name: "Ensure we can NOT swap y-token for x-token but not enough y-token for transfer",
    async fn(chain: Chain, accounts: Map<string, Account>) {
        const deployer = accounts.get("deployer")!;
        const wallet_1 = accounts.get("wallet_1")!;

        chain.mineBlock([
            Tx.contractCall("usda-token", "mint", [types.uint(1000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("susdt-token", "mint", [types.uint(100000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "create-pair", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.ascii("test"), types.uint(100000000000000), types.uint(1000000000000)], deployer.address)
        ]);

        const block = chain.mineBlock([
            Tx.contractCall("stableswap", "swap-y-for-x", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100000), types.uint(999400)], deployer.address)
        ]);

        block.receipts[0].result.expectErr()
        console.log(JSON.stringify(block.receipts));
    },
});

// Test swap y for x but not enough y-token for fee-lps transfer
Clarinet.test({
    name: "Ensure we can NOT swap y-token for x-token but not enough y-token for swap-lps transfer",
    async fn(chain: Chain, accounts: Map<string, Account>) {
        const deployer = accounts.get("deployer")!;
        const wallet_1 = accounts.get("wallet_1")!;

        chain.mineBlock([
            Tx.contractCall("usda-token", "mint", [types.uint(1000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("susdt-token", "mint", [types.uint(100000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "create-pair", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.ascii("test"), types.uint(99999990005000), types.uint(999999900050)], deployer.address)
        ]);

        const block = chain.mineBlock([
            Tx.contractCall("stableswap", "swap-y-for-x", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100000), types.uint(999400)], deployer.address)
        ]);

        block.receipts[0].result.expectErr()
        console.log(JSON.stringify(block.receipts));
    },
});

// Test swap y for x but not enough y-token for protocol transfer
Clarinet.test({
    name: "Ensure we can NOT swap y-token for x-token but not enough y-token for protocol transfer",
    async fn(chain: Chain, accounts: Map<string, Account>) {
        const deployer = accounts.get("deployer")!;
        const wallet_1 = accounts.get("wallet_1")!;

        chain.mineBlock([
            Tx.contractCall("usda-token", "mint", [types.uint(1000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("susdt-token", "mint", [types.uint(100000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "create-pair", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.ascii("test"), types.uint(99999990002000), types.uint(999999900020)], deployer.address)
        ]);

        const block = chain.mineBlock([
            Tx.contractCall("stableswap", "swap-y-for-x", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100000), types.uint(999400)], deployer.address)
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
            Tx.contractCall("usda-token", "mint", [types.uint(500000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("susdt-token", "mint", [types.uint(50000000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "create-pair", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.ascii("test"), types.uint(10000000000000000), types.uint(100000000000000)], deployer.address)
        ]);

        const block = chain.mineBlock([
            Tx.contractCall("stableswap", "add-liquidity", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(10000000000000000), types.uint(100000000000000), types.uint(0)], deployer.address)
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
            Tx.contractCall("usda-token", "mint", [types.uint(500000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("susdt-token", "mint", [types.uint(50000000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "create-pair", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.ascii("test"), types.uint(10000000000000000), types.uint(100000000000000)], deployer.address)
        ]);

        const block = chain.mineBlock([
            Tx.contractCall("stableswap", "add-liquidity", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(10000000), types.uint(100000), types.uint(0)], deployer.address)
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
            Tx.contractCall("usda-token", "mint", [types.uint(500000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("susdt-token", "mint", [types.uint(50000000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "create-pair", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.ascii("test"), types.uint(10000000000000000), types.uint(100000000000000)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "swap-y-for-x", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100000000), types.uint(99994000)], deployer.address)
        ]);

        const block = chain.mineBlock([
            Tx.contractCall("stableswap", "add-liquidity", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(1000000000000000), types.uint(10000000000000), types.uint(0)], deployer.address)
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
            Tx.contractCall("usda-token", "mint", [types.uint(500000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("susdt-token", "mint", [types.uint(50000000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "create-pair", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.ascii("test"), types.uint(10000000000000000), types.uint(100000000000000)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "swap-y-for-x", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100000000), types.uint(99994000)], deployer.address)
        ]);

        const block = chain.mineBlock([
            Tx.contractCall("stableswap", "add-liquidity", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(10000000), types.uint(100000), types.uint(0)], deployer.address)
        ]);

        block.receipts[0].result.expectOk()
        console.log(JSON.stringify(block.receipts));
    },
});

////Finished up to here////

// Test add liquidity 
Clarinet.test({
    name: "Ensure we can add liquidity of one token to a pool with same previous balance",
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
            Tx.contractCall("stableswap", "add-liquidity", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100000000), types.uint(0), types.uint(900000)], deployer.address)
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
            Tx.contractCall("usda-token", "mint", [types.uint(500000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("susdt-token", "mint", [types.uint(50000000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "create-pair", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.ascii("test"), types.uint(10000000000000000), types.uint(100000000000000)], deployer.address)
        ]);

        const block = chain.mineBlock([
            Tx.contractCall("stableswap", "add-liquidity", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(0), types.uint(1000000), types.uint(900000)], deployer.address)
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
            Tx.contractCall("usda-token", "mint", [types.uint(500000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("susdt-token", "mint", [types.uint(50000000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "create-pair", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.ascii("test"), types.uint(10000000000000000), types.uint(100000000000000)], deployer.address)
        ]);

        const block = chain.mineBlock([
            Tx.contractCall("stableswap", "add-liquidity", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(0), types.uint(100000), types.uint(90000)], deployer.address)
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
            Tx.contractCall("usda-token", "mint", [types.uint(500000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("susdt-token", "mint", [types.uint(50000000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "create-pair", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.ascii("test"), types.uint(10000000000000000), types.uint(100000000000000)], deployer.address)
        ]);

        const block = chain.mineBlock([
            Tx.contractCall("stableswap", "add-liquidity", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(10000000), types.uint(0), types.uint(90000)], deployer.address)
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
            Tx.contractCall("usda-token", "mint", [types.uint(500000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("susdt-token", "mint", [types.uint(50000000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "create-pair", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.ascii("test"), types.uint(10000000000000000), types.uint(100000000000000)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "swap-y-for-x", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100000000), types.uint(99940000)], deployer.address)
        ]);

        const block = chain.mineBlock([
            Tx.contractCall("stableswap", "add-liquidity", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100000000), types.uint(0), types.uint(900000)], deployer.address)
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
            Tx.contractCall("usda-token", "mint", [types.uint(500000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("susdt-token", "mint", [types.uint(50000000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "create-pair", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.ascii("test"), types.uint(10000000000000000), types.uint(100000000000000)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "swap-y-for-x", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100000000), types.uint(99940000)], deployer.address)
        ]);

        const block = chain.mineBlock([
            Tx.contractCall("stableswap", "add-liquidity", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(0), types.uint(1000000), types.uint(900000)], deployer.address)
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
            Tx.contractCall("usda-token", "mint", [types.uint(500000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("susdt-token", "mint", [types.uint(50000000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "create-pair", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.ascii("test"), types.uint(10000000000000000), types.uint(100000000000000)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "swap-y-for-x", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100000000), types.uint(99940000)], deployer.address)
        ]);

        const block = chain.mineBlock([
            Tx.contractCall("stableswap", "add-liquidity", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(10000000), types.uint(0), types.uint(99000)], deployer.address)
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
            Tx.contractCall("usda-token", "mint", [types.uint(500000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("susdt-token", "mint", [types.uint(50000000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "create-pair", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.ascii("test"), types.uint(10000000000000000), types.uint(100000000000000)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "swap-y-for-x", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100000000), types.uint(99940000)], deployer.address)
        ]);

        const block = chain.mineBlock([
            Tx.contractCall("stableswap", "add-liquidity", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(0), types.uint(100000), types.uint(90000)], deployer.address)
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
            Tx.contractCall("usda-token", "mint", [types.uint(500000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("susdt-token", "mint", [types.uint(50000000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "create-pair", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.ascii("test"), types.uint(10000000000000000), types.uint(100000000000000)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "swap-y-for-x", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(10000000), types.uint(99940000)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "set-pair-approval", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.bool(false)], deployer.address)
        ]);

        const block = chain.mineBlock([
            Tx.contractCall("stableswap", "add-liquidity", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(10000000000), types.uint(100000000), types.uint(199998000)], deployer.address)
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
            Tx.contractCall("usda-token", "mint", [types.uint(500000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("susdt-token", "mint", [types.uint(50000000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "create-pair", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.ascii("test"), types.uint(10000000000000000), types.uint(100000000000000)], deployer.address)
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
            Tx.contractCall("usda-token", "mint", [types.uint(500000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("susdt-token", "mint", [types.uint(50000000000000000), types.principal(deployer.address)], deployer.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "create-pair", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100), types.ascii("test"), types.uint(10000000000000000), types.uint(100000000000000)], deployer.address)
        ]);

        const block = chain.mineBlock([
            Tx.contractCall("stableswap", "add-liquidity", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(100000), types.uint(100000), types.uint(20000000)], deployer.address)
        ]);

        block.receipts[0].result.expectErr()
        console.log(JSON.stringify(block.receipts));
    },
});

////////////////////////////////////////////////////
////////////////////////////////////////////////////
///////////////// REMOVE-LIQUIDITY /////////////////
////////////////////////////////////////////////////
////////////////////////////////////////////////////


// Test remove liquidity 
Clarinet.test({
    name: "Ensure we can withdraw liquidity from a pool with the same previous balance",
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
            Tx.contractCall("stableswap", "add-liquidity", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(10000000000000000), types.uint(100000000000000), types.uint(0)], deployer.address)
        ]);

        const block = chain.mineBlock([
            Tx.contractCall("stableswap", "withdraw-liquidity", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(10000000000000), types.uint(900000000000), types.uint(9000000000)], deployer.address)
        ]);

        block.receipts[0].result.expectOk()
        console.log(JSON.stringify(block.receipts));
    },
});

// Test remove liquidity 
Clarinet.test({
    name: "Ensure we can NOT withdraw liquidity from a pool if not min x tokens met",
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
            Tx.contractCall("stableswap", "add-liquidity", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(10000000000000000), types.uint(100000000000000), types.uint(0)], deployer.address)
        ]);

        const block = chain.mineBlock([
            Tx.contractCall("stableswap", "withdraw-liquidity", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(10000000000000), types.uint(5000000000000), types.uint(50000000000)], deployer.address)
        ]);

        block.receipts[0].result.expectErr()
        console.log(JSON.stringify(block.receipts));
    },
});

// Test remove liquidity 
Clarinet.test({
    name: "Ensure we can NOT withdraw liquidity from a pool if not min y tokens met",
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
            Tx.contractCall("stableswap", "add-liquidity", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(10000000000000000), types.uint(100000000000000), types.uint(0)], deployer.address)
        ]);

        const block = chain.mineBlock([
            Tx.contractCall("stableswap", "withdraw-liquidity", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(10000000000000), types.uint(5000000000000), types.uint(50000000000)], deployer.address)
        ]);

        block.receipts[0].result.expectErr()
        console.log(JSON.stringify(block.receipts));
    },
});

// Test remove liquidity 
Clarinet.test({
    name: "Ensure we can NOT withdraw liquidity from a pool if not enough LP to burn",
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
            Tx.contractCall("usda-token", "mint", [types.uint(500000000000000), types.principal(wallet_1.address)], wallet_1.address)
        ]);

        chain.mineBlock([
            Tx.contractCall("stableswap", "add-liquidity", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(0), types.uint(1000000), types.uint(0)], wallet_1.address)
        ]);

        const block = chain.mineBlock([
            Tx.contractCall("stableswap", "withdraw-liquidity", [types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.susdt-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-token"), types.principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.usda-susdt-lp-token"), types.uint(10000000000000), types.uint(500000000000), types.uint(5000000000)], wallet_1.address)
        ]);

        block.receipts[0].result.expectErr()
        console.log(JSON.stringify(block.receipts));
    },
});