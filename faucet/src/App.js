import { useEffect, useState } from "react";
import "./App.css";
import web3 from "web3";
function App() {
  const [web3Api, setWeb3Api] = useState({ provider: null, web3: null });
  useEffect(() => {
    const loadProvider = async () => {
      let provider = null;
      if (window.ethereum) {
        provider = window.ethereum;
        try {
          await provider.enable();
        } catch {
          console.error("User denied access");
        }
      } else if (window.web3) {
        provider = window.web3.currentProvider;
      } else if (!process.env.production) {
        provider = new web3.providers.HttpProvider("http://localhost:7545");
      }
      setWeb3Api({ web3: new web3(provider), provider });
    };
    loadProvider();
  }, []);
  return (
    <>
      <div className="faucet-wrapper">
        <div className="faucet">
          <div className="balance-view is-size-2">
            Current balance: <strong>10</strong> ETH
          </div>

          <button className="btn mr-2">Donate</button>
          <button className="btn">Withdraw</button>
        </div>
      </div>
    </>
  );
}

export default App;
