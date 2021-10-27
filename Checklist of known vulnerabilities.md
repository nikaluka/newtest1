### Checklist of known vulnerabilities
#### Well known bugs
| Name | description | test cases
| --- | --- | --- |
| Integer overflow and underflow | Integer types have maximum values. Overflow and underflow bugs can occur when you exceed the maximum value (overflow) or when you go below the minimum value (underflow) | [Example](https://consensys.github.io/smart-contract-best-practices/known_attacks/#integer-overflow-and-underflow)
| Reentrancy | Reentrancy is an attack that can occur when a bug in a contract function can allow a function interaction to proceed multiple times when it should otherwise be prohibited |[Example](https://github.com/crytic/slither/wiki/Detector-Documentation#reentrancy-vulnerabilities)
| Unprotected withdrawal | Without adequate access controls, bad actors may be able to withdraw some or all assets from a contract |[Example](https://github.com/mixbytes/AuditKnowledgeBase/blob/main/vulnerabilities/Unprotected_Withdrawal.md)
|  Unchecked low-level calls| The return value of a low-level call is not checked | [Example](https://github.com/crytic/slither/wiki/Detector-Documentation#unchecked-low-level-calls)
| Ownership takeover | Due to the bugs in smart contracts bad actor can grant to himself admin or owner role |[Example](https://hackernoon.com/ownership-and-access-control-in-solidity-nn7g3xo3)
| Impossible withdraw from treasury | Many protocols are using special treasury smart contract to collect fee. Some bugs can lead to block withdraw from it. Always check that `transferFrom(address(this), to, amount)` not used in smart contract code |
| Unauthorized self-destruct | This type of bug can lead to lost all information about users which currently contains in protocol including their assets amount | [Example](https://github.com/crytic/slither/wiki/Detector-Documentation#suicidal)
| Unbounded operations | Just by having too large an array of users to pay can max out the gas limit and prevent the transaction from ever succeeding |[Example](https://docs.soliditylang.org/en/v0.8.6/security-considerations.html#gas-limit-and-loops)
| Front-Running | For example, knowing that a very large purchase of a specific token is going to occur, a bad actor can purchase that token in advance, and sell the token for a profit when the oversized buy order increases the price | [Example](https://consensys.github.io/smart-contract-best-practices/known_attacks/#front-running)
| Timestamp dependence | The timestamp of a block, accessed by now or block.timestamp can be manipulated by a miner |[Example](https://github.com/crytic/slither/wiki/Detector-Documentation#block-timestamp)
| Signature replay attacks | To protect against Signature Replay Attacks, the contract should only be allowing new hashes to be processed |[Example](https://medium.com/cryptronics/signature-replay-vulnerabilities-in-smart-contracts-3b6f7596df57)
| tx.origin | Never use tx.origin for authorization | [Example](https://docs.soliditylang.org/en/v0.6.6/security-considerations.html#tx-origin)
| Unchecked transfer| The return value of an external transfer/transferFrom call is not checked | [Example](https://github.com/crytic/slither/wiki/Detector-Documentation#unchecked-transfer)
| delegatecall | Don't delegatecall to untrusted code | [Example](https://consensys.github.io/smart-contract-best-practices/recommendations/#dont-delegatecall-to-untrusted-code)
| **delegatecall with msg.value** | Delegatecall use same logic as internal contract calls for `msg.sender` and `msg.value` which means that this parameters simply copied for each delegatecall. This can be very dangerous if payable function use delegatecall more than one time | [Example](https://github.com/mixbytes/AuditKnowledgeBase/blob/main/vulnerabilities/Delegatecall.md)
| Beware rounding with integer division | All integer division rounds down to the nearest integer. If you need more precision, consider using a multiplier, or store both the numerator and denominator | [Example](https://consensys.github.io/smart-contract-best-practices/recommendations/#beware-rounding-with-integer-division)
| DoS with Failed Call | External calls can fail accidentally or deliberately, which can cause a DoS condition in the contract | [Example](https://swcregistry.io/docs/SWC-113)
| Transaction Order Dependence | Use SafeApprove function | [Example](https://swcregistry.io/docs/SWC-114)
| Message call with hardcoded gas amount | Avoid the use of transfer() and send() and do not otherwise specify a fixed amount of gas when performing calls. Use .call.value(...)("") instead | [Example](https://swcregistry.io/docs/SWC-134)
| DoS With Block Gas Limit | Caution is advised when you expect to have large arrays that grow over time. Actions that require looping across the entire data structure should be avoided | [Example](https://swcregistry.io/docs/SWC-128)
| The newly created contract has zero balance | Don't assume contracts are created with zero balance | [Example](https://github.com/ConsenSys/smart-contract-best-practices/issues/61)
| Function signature hash attack | Solidity picks which function you're trying to call using only 4 bytes of signature hash | [Example](https://github.com/mixbytes/AuditKnowledgeBase/blob/main/vulnerabilities/Function_signature.md)
| Multicollateral protocol reentrancy | If protocol contains several tokens which can be used as collateral for borrowing some assets (like C.R.E.A.M, Compound, Aave and e.t.c.), then it necessary to check, that reentrancy between two collateral tokens cannot occur | [Example](https://github.com/mixbytes/AuditKnowledgeBase/blob/main/vulnerabilities/Multicollateral_reentrancy.md)
| Dangerous callback in `transfer` function | Some token implementations can have callback inside transfer function, so this can be used to reentrancy attack | [Example](https://github.com/mixbytes/AuditKnowledgeBase/blob/main/vulnerabilities/Transfer_callback.md)
| Flashloan of governance token | If protocol use voting for applying changes via special governance token, make sure that malicious user can't use flashloan to vote in his interest | [Example](https://github.com/mixbytes/AuditKnowledgeBase/blob/main/vulnerabilities/Flashloan_DAO.md)
| Replay attack | Smart contracts on Ethereum share the same way of verifying signatures. Some even share the exact same signature contents.| [Example](https://medium.com/cypher-core/replay-attack-vulnerability-in-ethereum-smart-contracts-introduced-by-transferproxy-124bf3694e25)
| Incorrect logic in the setter function | Sometimes in setters, only setting a new value is done. And there is no check for related changes in other dependent logic.| [Example](https://github.com/mixbytes/AuditKnowledgeBase/blob/main/vulnerabilities/Wrong_setter.md)
| Immutable variables in access modifiers | In the access modifiers, see if there are setters for address variables.| [Example](https://github.com/mixbytes/AuditKnowledgeBase/blob/main/vulnerabilities/Variables_in_access_modifiers.md)
| USDT transferFrom | `transferFrom` function in USDT token charges fees, so receiver receives less tokens, than user sended | [Example](https://github.com/mixbytes/AuditKnowledgeBase/blob/main/vulnerabilities/USDT_transferFrom.md)

#### Business logic analysis
| Name | description | test cases
| --- | --- | --- |
| Business logic review | Auditors team must check conformity between project documentation and realization of smart contracts | [Example](https://compound.finance/documents/Compound.Whitepaper.pdf)
| Access control | All admin or owner functions which give access to change state parameters of smart contract must use special modificators or checks | [Example](https://github.com/mixbytes/AuditKnowledgeBase/blob/main/vulnerabilities/Access_Control.md)
| Oracle security | In case if protocol use on-chain or off-chain price oracle it is very important to check that price would be stable for work period of project. Auditors must double check, that oracle can't be manipulated via flashloan and tx front run attack is impossible |
| Deployment consistency | Usually protocols contains several smart contracts which must be deployed and connected to each other in strict order |
| Unlimited owner rights | Decentralization of administration is a key parameter to create good protocol. If smart contract enables token minting this must be done algorithmically or using multisig wallet |
| Unencrypted secrets | Ethereum smart contract code can always be read. Treat it as such. Even if your code is not verified on Etherscan, attackers can still decompile or even just check transactions to and from it to analyze it |[Example](https://swcregistry.io/docs/SWC-136)
| Poisoned tokens | In case if protocol accept any arbitrary tokens to work (for example Uniswap) auditors team must double check that malicious user cannot create poisoned token and withdraw funds from smart contracts with it | [Example](https://github.com/mixbytes/AuditKnowledgeBase/blob/main/vulnerabilities/Poisoned_tokens.md)

#### Code style best practices
| Name | description | test cases
| --- | --- | --- |
| Redundant fallback function | Sometimes developers leave empty payable fallback function, so users can lose their Ether if interact with contract through blockchain |[Example](https://github.com/crytic/slither/wiki/Detector-Documentation#contracts-that-lock-ether)
| Explicit visibility | It is recommended to explicitly determine function and state variables visibility | [Example](https://consensys.github.io/smart-contract-best-practices/recommendations/#explicitly-mark-visibility-in-functions-and-state-variables)
| Following best practices | In terms of smart contract development, it's important to follow standards. Standards are set to prevent vulnerabilities, and ignoring them can lead to unexpected effects |[Example](https://consensys.github.io/smart-contract-best-practices/)
| Using fixed compile version | It is considered best practice to pick one compiler version and stick with it |[Example](https://github.com/crytic/slither/wiki/Detector-Documentation#different-pragma-directives-are-used)



