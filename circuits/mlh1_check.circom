pragma circom 2.0.0;

include "../circomlib2/circuits/poseidon.circom";

// Template for MLH1 Variant Checker
template MLH1VariantChecker() {
    // Inputs
    signal input allele;   // 0 or 1 representing presence/absence
    signal input pos;      // position of variant

    // Output
    signal output hash;

    // Use Poseidon hash with 2 inputs
    component hasher = Poseidon(2);

    // Connect inputs
    hasher.inputs[0] <== allele;
    hasher.inputs[1] <== pos;

    // Output is the Poseidon hash
    hash <== hasher.out;
}

// Instantiate main circuit
component main = MLH1VariantChecker();
