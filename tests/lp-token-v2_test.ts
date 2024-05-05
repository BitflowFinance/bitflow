// tests for lp-token-v2 contract
import { Clarinet, Tx, Chain, Account, types, EmptyBlock } from 'https://deno.land/x/clarinet@v1.6.0/index.ts';
import { assertEquals } from 'https://deno.land/std@0.90.0/testing/asserts.ts';

// Test get-token-uri
Clarinet.test({
  name: "Ensure we can read the Token URI",
  async fn(chain: Chain, accounts: Map<string, Account>) {
    const deployer = accounts.get("deployer")!;
    const wallet_1 = accounts.get("wallet_1")!;

    const call = chain.callReadOnlyFn("lp-token-v2", "get-token-uri", [], deployer.address)
    
    call.result.expectOk().expectSome()
    console.log(JSON.stringify(call.result));
  },
});

// Test contract owner setting set-token-uri
Clarinet.test({
  name: "Ensure the contract owner can set the Token URI",
  async fn(chain: Chain, accounts: Map<string, Account>) {
    const deployer = accounts.get("deployer")!;
    const wallet_1 = accounts.get("wallet_1")!;

    const block = chain.mineBlock([
      Tx.contractCall("lp-token-v2", "set-token-uri", [types.utf8("https://bitflow.finance/lp-token.json")], deployer.address)
    ]);

    block.receipts[0].result.expectOk()
    console.log(JSON.stringify(block.receipts));
  },
});

// Test get-token-uri after set-token-uri is called
Clarinet.test({
  name: "Ensure get-token-uri returns Token URI after it's set by contract owner",
  async fn(chain: Chain, accounts: Map<string, Account>) {
    const deployer = accounts.get("deployer")!;
    const wallet_1 = accounts.get("wallet_1")!;

    chain.mineBlock([
      Tx.contractCall("lp-token-v2", "set-token-uri", [types.utf8("https://bitflow.finance/lp-token.json")], deployer.address)
    ]);

    const call = chain.callReadOnlyFn("lp-token-v2", "get-token-uri", [], deployer.address)

    call.result.expectOk().expectSome()
    console.log(JSON.stringify(call.result));
  },
});

// Test user setting set-token-uri that isn't contract owner
Clarinet.test({
  name: "Ensure nobody else can set the Token URI except for contract owner",
  async fn(chain: Chain, accounts: Map<string, Account>) {
    const deployer = accounts.get("deployer")!;
    const wallet_1 = accounts.get("wallet_1")!;

    const block = chain.mineBlock([
      Tx.contractCall("lp-token-v2", "set-token-uri", [types.utf8("https://bitflow.finance/lp-token.json")], wallet_1.address)
    ]);

    block.receipts[0].result.expectErr()
    console.log(JSON.stringify(block.receipts));
  },
});