cl import from react {
useState
}

cl import from recharts {
  BarChart, Bar, XAxis, YAxis, Tooltip, CartesianGrid, Legend, ResponsiveContainer
}
 import ".styles.css";

# ----------------------------
# Shared styles
# ----------------------------
def pageStyle() -> any {
    return {
        "minHeight": "100vh",
        "backgroundColor": "#0f172a",
        "display": "flex",
        "justifyContent": "center",
        "alignItems": "flex-start",
        "padding": "32px",
        "fontFamily": "system-ui, sans-serif",
        "boxSizing": "border-box"
    };
}

def contentStyle() -> any {
    return {
        "width": "100%",
        "maxWidth": "900px",
        "display": "flex",
        "flexDirection": "column",
        "gap": "18px"
    };
}

def cardBaseStyle() -> any {
    return {
        "backgroundColor": "#020617",
        "borderRadius": "16px",
        "padding": "24px",
        "boxShadow": "0 14px 45px rgba(15,23,42,0.65)",
        "boxSizing": "border-box",
        "border": "1px solid #1f2937"
    };
}



# BarChart
def SentimentBarChart(props: any) -> any {

  return (
    <ResponsiveContainer width="100%" height={400}>
      <BarChart data={props.chartdata} margin={{ top: 20, right: 30, left: 20, bottom: 5 }}>
        <CartesianGrid strokeDasharray="3 3" />
        <XAxis dataKey="date" />
        <YAxis />
        <Tooltip />
        <Legend />
        <Bar dataKey="Positive" fill="#4CAF50" />
        <Bar dataKey="Negative" fill="#F44336" />
        <Bar dataKey="Neutral" fill="#FFC107" />
      </BarChart>
    </ResponsiveContainer>
  );


}

# Simple stat card
def StatCard(props: any) -> any {
    return <div className="card stat-card">
        <div className="stat-label">
            {props.label}
        </div>
        <div className="stat-value">
            {props.value}
        </div>
    </div>;
}

# Row of category stats (Food / Delivery / Pricing / Others)
def StatsRow(props: any) -> any {

    return <div className="sentiment-grid">
        <StatCard
            label="Food Quality"
            value={props.foodValue}
        />
        <StatCard
            label="Delivery"
            value={props.deliveryValue}
        />
        <StatCard
            label="Pricing"
            value={props.pricingValue}
        />
        <StatCard
            label="Others"
            value={props.otherValue}
        />
    </div>;
}

# Summary output card
def SummaryCard(props: any) -> any {
    # text fallback
    let displayText = props.summary;
    if displayText == "" {
        displayText = "Click the button above to generate a concise summary of your recent feedback across food, delivery, time and other categories.";
    }

    return <div className="card">
        <h2 className="section-title">
            Summary
        </h2>
        <p className="section-subtitle">
            Short overview generated for the selected time range.
        </p>
        <div className="summary-box">
            {displayText}
        </div>
    </div>;
}

# ----------------------------
# Main minimal interface
# ----------------------------
def app() -> any {
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


    let headerRowStyle = {
        "display": "flex",
        "justifyContent": "space-between",
        "alignItems": "center"
    };

    let titleStyle = {
        "fontSize": "18px",
        "fontWeight": "600",
        "color": "#e5e7eb"
    };

    let subtitleStyle = {
        "fontSize": "12px",
        "color": "#9ca3af"
    };

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
        console.log("lent",lent);
        let num = 0;
        while (num < lent) {
            console.log("num", num);
            console.log("date", result["dates"][num]);
            d = {"date": result["dates"][num], "Positive": result["positive_count"][num], "Negative": result["negative_count"][num], "Neutral": result["neutral_count"][num]};
            data_list.push(d);
            num = num + 1;
        }
        setData(data_list);

    }

    async def gen_summary() -> str {
        summ = root spawn summerize(range_option=range);
        result = summ.reports[0];
        setSummary(result["summary"]);

    }

    return <div style={pageStyle()}>
        <div style={contentStyle()}>

            <div style={headerRowStyle}>
                <div>
                    <div style={titleStyle}>
                        Comment activity graph
                    </div>
                    <div style={subtitleStyle}>
                        Visualise positive, negative and neutral comments over time.
                    </div>
                </div>

                <select
                    value={range}
                    # onChange={lambda e: any -> None { setRange(e.target.value); }}
                    onChange={lambda e: any -> None { get_data(e); }}
                    style={{
                        "padding": "8px 12px",
                        "borderRadius": "8px",
                        "fontSize": "13px",
                        "fontWeight": "500",
                        "backgroundColor": "#020617",
                        "color": "#e5e7eb",
                        "border": "1px solid #374151",
                        "outline": "none",
                        "cursor": "pointer"
                    }}
                >
                    <option value="Last 3 Days">Last 3 Days</option>
                    <option value="Last 7 Days">Last 7 Days</option>
                    <option value="Last 30 Days">Last 30 Days</option>
                </select>
            </div>

            <div style={cardBaseStyle()}>
                <StatsRow range={range} 
                    foodValue={food_quality_count} 
                    deliveryValue={delivery_count} 
                    pricingValue={pricing_count} 
                    otherValue={other_count} 
                />
                <SentimentBarChart chartdata={data} />
            </div>
            <div style={cardBaseStyle()}>
                <SummaryCard summary={summary} />
                <div className="button-row">
                    <button
                        onClick={lambda -> None { gen_summary(); }}
                        className="btn-primary"
                    >
                        Generate a summary
                    </button>
                </div>
            </div>
        </div>
    </div>;
}



