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

    # Row of category stats (Food / Delivery / Time / Others)
    def StatsRow(props: any) -> any {
        # defaults: 1 day
        let foodValue = "23";
        let deliveryValue = "10";
        let timeValue = "5";
        let otherValue = "4";

        if props.range == "3 days" {
            foodValue = "70";
            deliveryValue = "32";
            timeValue = "19";
            otherValue = "12";
        } elif props.range == "30 days" {
            foodValue = "520";
            deliveryValue = "210";
            timeValue = "130";
            otherValue = "88";
        }

        return <div className="sentiment-grid">
            <StatCard
                label="Food"
                value={foodValue}
            />
            <StatCard
                label="Delivery"
                value={deliveryValue}
            />
            <StatCard
                label="Time"
                value={timeValue}
            />
            <StatCard
                label="Others"
                value={otherValue}
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

    # Main admin dashboard (no graph)
    def AdminDashboard() -> any {
        let [range, setRange] = useState("1 day");
        let [summary, setSummary] = useState("");

        def handleGenerate() -> None {
            let base = "Based on recent feedback, most comments are about food quality and delivery experience, with some timing and other issues.";
            let extra = "";

            if range == "1 day" {
                extra = " Today shows a spike in food-related comments with a moderate number of delivery notes.";
            } elif range == "3 days" {
                extra = " Over the last 3 days, food and delivery stay dominant, while timing issues are slowly increasing.";
            } else {
                extra = " Over the last month, food and delivery remain the main focus, with time and other issues appearing more regularly.";
            }

            setSummary(base + extra);
        }

        return <div className="app-page">
            <div className="app-layout">
                <div className="main-column">
                    <div className="header-row">
                        <div>
                            <div className="header-title">
                                Comment Category Dashboard
                            </div>
                            <div className="header-subtitle">
                                Track feedback across food, delivery, time and other issues.
                            </div>
                        </div>
                        <select
                            value={range}
                            onChange={lambda e: any -> None { setRange(e.target.value); }}
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

                    <StatsRow range={range} />

                    <div className="button-row">
                        <button
                            onClick={lambda -> None { handleGenerate(); }}
                            className="btn-primary"
                        >
                            Generate a summary
                        </button>
                    </div>

                    <SummaryCard summary={summary} />
                </div>
            </div>
        </div>;
    }

    # Entry point
    def app() -> any {
        return <AdminDashboard />;
    }
