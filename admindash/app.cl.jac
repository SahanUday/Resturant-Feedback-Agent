import from react { useState }

import ".styles.css";

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

# Row of sentiment stats
def StatsRow(props: any) -> any {
    # defaults: 1 day
    let posValue = "42";
    let negValue = "6";
    let neuValue = "12";

    if props.range == "3 days" {
        posValue = "118";
        negValue = "19";
        neuValue = "31";
    } elif props.range == "30 days" {
        posValue = "864";
        negValue = "142";
        neuValue = "238";
    }

    return <div className="sentiment-grid">
        <StatCard
            label="Positive comments"
            value={posValue}
        />
        <StatCard
            label="Negative comments"
            value={negValue}
        />
        <StatCard
            label="Neutral comments"
            value={neuValue}
        />
    </div>;
}

# Summary output card
def SummaryCard(props: any) -> any {
    #let card = cardBaseStyle();

    # text fallback
    let displayText = props.summary;
    if displayText == "" {
        displayText = "Click the button above to generate a concise summary of your recent comments.";
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

# Main admin dashboard (no graph)
def AdminDashboard()  -> any {
    let [range, setRange] = useState("1 day");
    let [summary, setSummary] = useState("");

    # let mainColumnStyle = {
    #     "flex": "1",
    #     "display": "flex",
    #     "flexDirection": "column",
    #     "gap": "18px"
    # };
    def handleGenerate()  -> None {
        let base = "Based on recent comments, sentiment is mostly positive with some negative and neutral feedback.";
        let extra = "";

        if range == "1 day" {
            extra = " Today shows a small spike in positive comments after dinner service.";
        } elif range == "3 days" {
            extra = " Over the last 3 days, feedback has been consistent with a slight increase in negative comments.";
        } else {
            extra = " Over the last month, overall satisfaction trends upward, but there are recurring issues to review.";
        }

        setSummary(base + extra);
    }

    return <div className="app-page">
        <div className="app-layout">
            <div className="main-column">
                <div className="header-row">
                    <div>
                        <div className="header-title">
                            Comment Sentiment Dashboard
                        </div>
                        <div className="header-subtitle">
                            Monitor positive, negative and neutral comments from your users.
                        </div>
                    </div>
                    <select
                        value={range}
                        onChange={lambda  e: any  -> None{ setRange(e.target.value);} }
                        className="range-select"
                    >
                        <option value="1 day">
                            1 day
                        </option>
                        <option value="3 days">
                            3 days
                        </option>
                        <option value="30 days">
                            30 days
                        </option>
                    </select>
                </div>
                <StatsRow
                    range={range}
                />
                <div className="button-row">
                    <button
                        onClick={lambda   -> None{ handleGenerate();} }
                        className="btn-primary"
                    >
                        Generate a summary
                    </button>
                </div>
                <SummaryCard
                    summary={summary}
                />
            </div>
        </div>
    </div>;
}

# Entry point
def app()  -> any {
    return <AdminDashboard />;
}
# Header

# Sentiment cards

# Generate summary + output
