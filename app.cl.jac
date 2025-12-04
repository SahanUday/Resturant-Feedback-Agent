cl import from react { useState, useEffect }

cl import from "@jac-client/utils" { Router, Routes, Route, Link, Navigate, useNavigate, jacLogin, jacLogout, jacIsLoggedIn}

import ".cstyles.css";
import ".adstyles.css";
import ".homestyle.css";

def Customer -> any {
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

    return <div className="customer-page">
        <div className="customer-column">
            <ReviewInputCard
                input={input}
                setInput={setInput}
                computeAnswer={computeAnswer}
            />
            <AutoReplyCard
                answer={answer}
                loading={loading}
            />
        </div>
    </div>;
}

def Admin()  -> any {
    let [range, setRange] = useState("Last 3 Days");
    let [positive_count, setPositiveCount] = useState([]);
    let [negative_count, setNegativeCount] = useState([]);
    let [neutral_count, setNeutralCount] = useState([]);
    let [pricing_count, setPricingCount] = useState(None);
    let [food_quality_count, setFoodQualityCount] = useState(None);
    let [delivery_count, setDeliveryCount] = useState(None);
    let [other_count, setOtherCount] = useState(None);
    let [dates, setDates] = useState([]);
    let [data, setData] = useState([]);

    let [summary, setSummary] = useState("");
    let [loading, setLoading] = useState(false);

    async def get_data(e: str) -> any {
        setRange(e.target.value);
        response = root spawn grt_counts(range_option=e.target.value);
        console.log(response);
        result = response.reports[0];
        setPositiveCount(result["positive_count"]);
        setNegativeCount(result["negative_count"]);
        setNeutralCount(result["neutral_count"]);
        setPricingCount(result["pricing_count"]);
        setFoodQualityCount(result["food_quality_count"]);
        setDeliveryCount(result["delivery_count"]);
        setOtherCount(result["other_count"]);
        setDates(result["dates"]);

        let data_list = [];
        let lent = result["dates"].length;
        console.log("lent", lent);
        let num = 0;
        while (num < lent) {
            console.log("num", num);
            console.log("date", result["dates"][num]);
            d = {
                "date": result["dates"][num],
                "Positive": result["positive_count"][num],
                "Negative": result["negative_count"][num],
                "Neutral": result["neutral_count"][num]
            };
            data_list.push(d);
            num = num + 1;
        }
        setData(data_list);
    }

    async def gen_summary()  -> str {
        setLoading(true);
        setSummary("");

        summ = root spawn summerize(range_option=range);
        result = summ.reports[0];

        setSummary(result["summary"]);
        setLoading(false);
    }

    return <div className="pageC">
        <div className="contentC">
            <div className="header-rowNew"
            style={{"marginBottom": "16px"}}
            >
                <div>
                    <div className="header-titleNew">
                        Comment activity graph
                    </div>
                    <div className="header-subtitleNew">
                        Visualise positive, negative and neutral comments over time.
                    </div>
                </div>
                <select
                    value={range}
                    onChange={lambda  e: any  -> None{ get_data(e);} }
                    className="range-select"
                >
                    <option value="Last 3 Days">
                        Last 3 Days
                    </option>
                    <option value="Last 7 Days">
                        Last 7 Days
                    </option>
                    <option value="Last 30 Days">
                        Last 30 Days
                    </option>
                </select>
            </div>
            <div className="card-base">
                <StatsRow
                    range={range}
                    foodValue={food_quality_count}
                    deliveryValue={delivery_count}
                    pricingValue={pricing_count}
                    otherValue={other_count}
                />
                <SentimentBarChart
                    chartdata={data}
                />
            </div>
            <div className="card-base">
                <SummaryCard
                    summary={summary}
                    loading={loading}
                />
                <div className="button-row">
                    <button
                        onClick={lambda   -> None{ gen_summary();} }
                        className="btn-primary"
                    >
                        Generate Summary
                    </button>
                </div>
            </div>
        </div>
    </div>;
}

def app()  -> any {
    return <Router>
        <div
            style={{"fontFamily": "system-ui, sans-serif"}}
        >
            <Routes>
                <Route
                    path="/"
                    element={<Home />}
                />
                <Route
                    path="/Customer"
                    element={<Customer />}
                />
                <Route
                    path="/Admin"
                    element={<Admin />}
                />
            </Routes>
        </div>
    </Router>;
}
