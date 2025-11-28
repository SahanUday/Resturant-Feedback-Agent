import from react { useState }

import ".styles.css";


def app -> Any {
    let [answer, setAnswer] = useState("");
    let [input, setInput] = useState("");
    let [loading, setLoading] = useState(false); 


    async def computeAnswer() -> None {
        setLoading(true);
        setAnswer("");
        response = root spawn analyzer(feedback=input);
        result = response.reports;
        setAnswer(result);
        setLoading(false);
    }
    

    return <div className="app-container">
        <div className="app-layout">
            <ReviewInputCard input={input} setInput={setInput} computeAnswer={computeAnswer} />
            <AutoReplyCard answer={answer} loading={loading} />
        </div>
    </div>;
}
