cl import from react { useState }

cl import from recharts {
    BarChart,
    Bar,
    XAxis,
    YAxis,
    Tooltip,
    CartesianGrid,
    Legend,
    ResponsiveContainer
}


# BarChart
cl def SentimentBarChart(props: any) -> any {
    return (
        <ResponsiveContainer
            width="100%"
            height={400}
        >
            <BarChart
                data={props.chartdata}
                margin={{top: 20, right: 50, left: 20, bottom: 50}}  # increased bottom
            >
                <CartesianGrid strokeDasharray="3 3" />
                <XAxis dataKey="date" />
                <YAxis />
                <Tooltip />
                <Legend />
                <Bar
                    dataKey="Positive"
                    fill="#4CAF50"
                />
                <Bar
                    dataKey="Negative"
                    fill="#F44336"
                />
                <Bar
                    dataKey="Neutral"
                    fill="#FFC107"
                />
            </BarChart>
        </ResponsiveContainer>
    );
}

# Simple stat card
cl def StatCard(props: any) -> any {
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
cl def StatsRow(
    props: any
) -> any {
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
cl def SummaryCard(props: any) -> any {
    # text fallback
    let displayText = props.summary;
    # if displayText == "" {
    #     displayText = "Click the button above to generate a concise summary of your recent feedback across food, delivery, time and other categories.";
    # }
    return <div className="card">
        <h2 className="section-title">
            Summary
        </h2>
        <p className="section-subtitle">
            Click the Generate Summary button to generate summary.
        </p>
        <div className="summary-box">
            {props.loading
            && <div className="flex justify-center items-center my-3">
                <div className="animate-spin rounded-full h-6 w-6 border-2 border-gray-300 border-t-transparent"></div>
                <span className="ml-2 text-sm text-gray-500">
                    Generating summary...
                </span>
            </div>}{displayText}
        </div>
    </div>;
}
