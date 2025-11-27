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
                    "width": "20px",
                    "height": props.height,
                    "borderRadius": "999px",
                    "backgroundImage": "linear-gradient(180deg,#22c55e,#0f766e)",
                    "boxShadow": "0 12px 24px rgba(34,197,94,0.45)"
                }}
            />
            <span
                style={{
                    "fontSize": "11px",
                    "color": "#9ca3af"
                }}
            >
                {props.label}
            </span>
        </div>;
    }

    # ----------------------------
    # Bar chart that reacts to range
    # ----------------------------
    def ActivityChart(props: any) -> any {
        let chartWrapperStyle = {
            "paddingTop": "8px"
        };

        let rowStyle = {
            "display": "flex",
            "alignItems": "flex-end",
            "justifyContent": "space-between",
            "gap": "12px",
            "height": "180px"
        };

        if props.range == "1 day" {
            # 2 columns
            return <div style={chartWrapperStyle}>
                <div style={rowStyle}>
                    <BarColumn label="Lunch" height="50%" />
                    <BarColumn label="Dinner" height="85%" />
                </div>
            </div>;
        } elif props.range == "3 days" {
            # 6 columns
            return <div style={chartWrapperStyle}>
                <div style={rowStyle}>
                    <BarColumn label="D1" height="40%" />
                    <BarColumn label="D1" height="70%" />
                    <BarColumn label="D2" height="55%" />
                    <BarColumn label="D2" height="65%" />
                    <BarColumn label="D3" height="50%" />
                    <BarColumn label="D3" height="78%" />
                </div>
            </div>;
        } else {
            # 30 days – 6 weekly-style bars
            return <div style={chartWrapperStyle}>
                <div style={rowStyle}>
                    <BarColumn label="W1" height="42%" />
                    <BarColumn label="W2" height="55%" />
                    <BarColumn label="W3" height="63%" />
                    <BarColumn label="W4" height="70%" />
                    <BarColumn label="W5" height="58%" />
                    <BarColumn label="W6" height="75%" />
                </div>
            </div>;
        }
    }

    # ----------------------------
    # Main minimal interface
    # ----------------------------
    def GraphOnlyDashboard() -> any {
        let [range, setRange] = useState("1 day");

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
                        onChange={lambda e: any -> None { setRange(e.target.value); }}
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
                        <option value="1 day">1 day</option>
                        <option value="3 days">3 days</option>
                        <option value="30 days">30 days</option>
                    </select>
                </div>

                <div style={cardBaseStyle()}>
                    <ActivityChart range={range} />
                </div>
            </div>
        </div>;
    }

    # ----------------------------
    # Entry point
    # ----------------------------
    def app() -> any {
        return <GraphOnlyDashboard />;
    }
}
