require_relative '../lib/dark_trader'

describe "the crypto_symbols method" do
  it "should return an array containing cryptocurrency symbols" do
    expect(crypto_symbols).to include("BTC") # Vérifie si "BTC" est dans le tableau de symboles
    expect(crypto_symbols).to include("MATIC")
    expect(crypto_symbols).to include("SHIB")
  end
end