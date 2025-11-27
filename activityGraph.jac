cl import from react {
    useState
}

cl {
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

    def layoutStyle() -> any {
        return {
            "width": "100%",
            "maxWidth": "1200px",
            "display": "flex",
            "gap": "24px"
        };
    }

    def cardBaseStyle() -> any {
        return {
            "backgroundColor": "#020617",
            "borderRadius": "16px",
            "padding": "20px",
            "boxShadow": "0 14px 45px rgba(15,23,42,0.65)",
            "boxSizing": "border-box",
            "border": "1px solid #1f2937"
        };
    }

    def sectionTitleStyle() -> any {
        return {
            "fontSize": "18px",
            "fontWeight": "600",
            "color": "#e5e7eb",
            "marginBottom": "4px"
        };
    }

    def sectionSubtitleStyle() -> any {
        return {
            "fontSize": "12px",
            "color": "#6b7280",
            "marginBottom": "16px"
        };
    }

    def primaryButtonStyle() -> any {
        return {
            "padding": "8px 16px",
            "borderRadius": "999px",
            "border": "none",
            "backgroundImage": "linear-gradient(135deg,#22c55e,#059669)",
            "color": "#f9fafb",
            "fontSize": "13px",
            "fontWeight": "600",
            "cursor": "pointer",
            "boxShadow": "0 10px 25px rgba(34,197,94,0.35)"
        };
    }

    # ----------------------------
    # Stat cards row
    # ----------------------------
    def StatCard(props: any) -> any {
    let card = cardBaseStyle();
    card["padding"] = "16px";

    return <div style={card}>
        <div
            style={{
                "fontSize": "11px",
                "textTransform": "uppercase",
                "letterSpacing": "0.08em",
                "color": "#6b7280",
                "marginBottom": "6px"
            }}
        >
            {props.label}
        </div>

        <div
            style={{
                "fontSize": "26px",
                "fontWeight": "700",
                "color": "#e5e7eb",
                "marginBottom": "4px"
            }}
        >
            {props.value}
        </div>
    </div>;
}


    # ----------------------------
    # Stat cards row – sentiment counts
    # ----------------------------
    def StatsRow(props: any) -> any {
        # default values (1 day)
        let posValue = "42";
        let negValue = "6";
        let neuValue = "12";

        let posCaption = "Positive comments in the last 24 hours";
        let negCaption = "Negative comments in the last 24 hours";
        let neuCaption = "Neutral comments in the last 24 hours";

        let posTrend = "+8 vs previous day";
        let negTrend = "-2 vs previous day";
        let neuTrend = "+1 vs previous day";

        if props.range == "3 days" {
            posValue = "118";
            negValue = "19";
            neuValue = "31";

            posCaption = "Positive comments across the last 3 days";
            negCaption = "Negative comments across the last 3 days";
            neuCaption = "Neutral comments across the last 3 days";

            posTrend = "+14 vs prior 3 days";
            negTrend = "+3 vs prior 3 days";
            neuTrend = "+5 vs prior 3 days";
        } elif props.range == "30 days" {
            posValue = "864";
            negValue = "142";
            neuValue = "238";

            posCaption = "Positive comments over the last 30 days";
            negCaption = "Negative comments over the last 30 days";
            neuCaption = "Neutral comments over the last 30 days";

            posTrend = "+12% vs previous month";
            negTrend = "-4% vs previous month";
            neuTrend = "+3% vs previous month";
        }

        return <div
            style={{
                "display": "grid",
                "gridTemplateColumns": "repeat(3, minmax(0, 1fr))",
                "gap": "16px",
                "marginBottom": "20px"
            }}
        >
            <StatCard
                label="Positive comments"
                value={posValue}
                trend={posTrend}
                trendColor="#4ade80"        # green
                caption={posCaption}
            />
            <StatCard
                label="Negative comments"
                value={negValue}
                trend={negTrend}
                trendColor="#f87171"        # red
                caption={negCaption}
            />
            <StatCard
                label="Neutral comments"
                value={neuValue}
                trend={neuTrend}
                trendColor="#e5e7eb"        # light grey
                caption={neuCaption}
            />
        </div>;
    }


    # ----------------------------
    # Single bar column component
    # ----------------------------
    def BarColumn(props: any) -> any {
        return <div
            style={{
                "display": "flex",
                "flexDirection": "column",
                "alignItems": "center",
                "gap": "6px",
                "flex": "1"
            }}
        >
            <div
                style={{
                    "width": "18px",
                    "height": props.height,
                    "borderRadius": "999px",
                    "backgroundImage": "linear-gradient(180deg,#22c55e,#0f766e)",
                    "boxShadow": "0 12px 24px rgba(34,197,94,0.45)"
                }}
            />
            <span
                style={{
                    "fontSize": "10px",
                    "color": "#9ca3af"
                }}
            >
                {props.label}
            </span>
        </div>;
    }

    # ----------------------------
    # Mini bar chart (uses BarColumn)
    # ----------------------------
    def ActivityChart(props: any) -> any {
        let chartWrapperStyle = {
            "marginTop": "18px",
            "paddingTop": "12px",
            "borderTop": "1px solid #111827"
        };

        let rowStyle = {
            "display": "flex",
            "alignItems": "flex-end",
            "justifyContent": "space-between",
            "gap": "10px",
            "height": "140px"
        };

        if props.range == "1 day" {
            # 2 columns
            return <div style={chartWrapperStyle}>
                <div style={rowStyle}>
                    <BarColumn label="Lunch" height="45%" />
                    <BarColumn label="Dinner" height="80%" />
                </div>
            </div>;
        } elif props.range == "3 days" {
            # 6 columns
            return <div style={chartWrapperStyle}>
                <div style={rowStyle}>
                    <BarColumn label="D1" height="40%" />
                    <BarColumn label="D1" height="70%" />
                    <BarColumn label="D2" height="50%" />
                    <BarColumn label="D2" height="65%" />
                    <BarColumn label="D3" height="55%" />
                    <BarColumn label="D3" height="75%" />
                </div>
            </div>;
        } else {
            # 30 days – 6 weekly-style bars
            return <div style={chartWrapperStyle}>
                <div style={rowStyle}>
                    <BarColumn label="W1" height="40%" />
                    <BarColumn label="W2" height="52%" />
                    <BarColumn label="W3" height="60%" />
                    <BarColumn label="W4" height="68%" />
                    <BarColumn label="W5" height="55%" />
                    <BarColumn label="W6" height="72%" />
                </div>
            </div>;
        }
    }

    # ----------------------------
    # Recent activity card + chart
    # ----------------------------
    def ActivityList(props: any) -> any {
    let card = cardBaseStyle();
    card["paddingTop"] = "28px";  # small top padding for clean spacing

    return <div style={card}>
        <ActivityChart range={props.range} />
    </div>;
}



    # ----------------------------
    # Summary output card
    # ----------------------------
    def SummaryCard(props: any) -> any {
        let card = cardBaseStyle();

        # Decide what text to show
        let displayText = props.summary;
        if displayText == "" {
            displayText = "Click the button above to generate a concise summary of your recent activity.";
        }

        return <div style={card}>
            <h2 style={sectionTitleStyle()}>Summary</h2>
            <p style={sectionSubtitleStyle()}>
                A short overview generated from today's activity.
            </p>

            <div
                style={{
                    "borderRadius": "12px",
                    "border": "1px solid #1f2937",
                    "padding": "16px",
                    "backgroundImage": "linear-gradient(135deg,rgba(15,23,42,1),rgba(15,23,42,0.9))",
                    "fontSize": "14px",
                    "color": "#e5e7eb",
                    "minHeight": "80px",
                    "display": "flex",
                    "alignItems": "center"
                }}
            >
                {displayText}
            </div>
        </div>;
    }

    # ----------------------------
    # Main dashboard layout
    # ----------------------------
    def AdminDashboard() -> any {
        let [range, setRange] = useState("1 day");
        let [summary, setSummary] = useState("");

        let mainColumnStyle = {
            "flex": "1",
            "display": "flex",
            "flexDirection": "column",
            "gap": "18px"
        };

        def handleGenerate() -> None {
            let text = "Today looks steady: revenue is healthy, active orders are flowing, " +
                       "evening reservations are filling up, and one inventory item needs attention.";
            setSummary(text);
        }

        return <div style={pageStyle()}>
            <div style={layoutStyle()}>
                <div style={mainColumnStyle}>

                    # HEADER
                    <div
                        style={{
                            "display": "flex",
                            "justifyContent": "space-between",
                            "alignItems": "center"
                        }}
                    >
                        <div>
                            <div
                                style={{
                                    "fontSize": "22px",
                                    "fontWeight": "700",
                                    "color": "#f9fafb",
                                    "marginBottom": "4px"
                                }}
                            >
                                Restaurant Admin
                            </div>
                            <div
                                style={{
                                    "fontSize": "12px",
                                    "color": "#9ca3af"
                                }}
                            >
                                Control center for your restaurant.
                            </div>
                        </div>

                        <select
                            value={range}
                            onChange={lambda e: any -> None { setRange(e.target.value); }}
                            style={{
                                "padding": "8px 12px",
                                "borderRadius": "8px",
                                "fontSize": "13px",
                                "fontWeight": "500",
                                "backgroundColor": "#1f2937",
                                "color": "#e5e7eb",
                                "border": "1px solid #374151",
                                "outline": "none",
                                "cursor": "pointer"
                            }}
                        >
                            <option value="1 day">1 day</option>
                            <option value="3 days">3 days</option>
                            <option value="30 days">30 days</option>
                        </select>
                    </div>

                    # CONTENT
                    <StatsRow />

                    <ActivityList range={range} />

                    <div
                        style={{
                            "display": "flex",
                            "justifyContent": "center",
                            "marginTop": "8px",
                            "marginBottom": "8px"
                        }}
                    >
                        <button
                            onClick={lambda -> None { handleGenerate(); }}
                            style={primaryButtonStyle()}
                        >
                            Generate a summary
                        </button>
                    </div>

                    <SummaryCard summary={summary} />
                </div>
            </div>
        </div>;
    }

    # ----------------------------
    # Entry point
    # ----------------------------
    def app() -> any {
        return <AdminDashboard />;
    }
}
