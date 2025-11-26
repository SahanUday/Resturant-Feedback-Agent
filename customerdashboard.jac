cl import from react { useState }

cl {
    # ----------------------------
    # Shared styles (to reuse)
    # ----------------------------
    def cardBaseStyle() -> any {
        return {
            "backgroundColor": "#ffffff",
            "borderRadius": "16px",
            "padding": "24px",
            "boxShadow": "0 10px 30px rgba(15,23,42,0.08)",
            "boxSizing": "border-box"
        };
    }

    def sectionTitleStyle() -> any {
        return {
            "fontSize": "20px",
            "fontWeight": "700",
            "color": "#111827",
            "marginBottom": "4px"
        };
    }

    def sectionSubtitleStyle() -> any {
        return {
            "fontSize": "13px",
            "color": "#6b7280",
            "marginBottom": "16px"
        };
    }

    def primaryButtonStyle() -> any {
        return {
            "padding": "10px 18px",
            "borderRadius": "8px",
            "border": "none",
            "backgroundColor": "#2563eb",
            "color": "#ffffff",
            "fontSize": "14px",
            "fontWeight": "600",
            "cursor": "pointer"
        };
    }

    def pillButtonBaseStyle() -> any {
        return {
            "padding": "6px 12px",
            "borderRadius": "999px",
            "border": "1px solid #e5e7eb",
            "backgroundColor": "#ffffff",
            "fontSize": "13px",
            "cursor": "pointer"
        };
    }

    # ----------------------------------
    # Component: Review input (top-left)
    # ----------------------------------
    def ReviewInputCard(props: any) -> any {
        let cardStyle = cardBaseStyle();
        let titleStyle = sectionTitleStyle();
        let subtitleStyle = sectionSubtitleStyle();
        let postBtnStyle = primaryButtonStyle();

        return <div style={cardStyle}>
            <h2 style={titleStyle}>Share your experience</h2>
            <p style={subtitleStyle}>
                Tell us about your visit so we can improve our restaurant service.
            </p>

            <label
                style={{
                    "fontSize": "13px",
                    "color": "#4b5563",
                    "display": "block",
                    "marginBottom": "8px"
                }}
            >
                Your review
            </label>

            <textarea
                value={props.input}
                onChange={lambda e: any -> None { props.setInput(e.target.value); }}
                placeholder="Write your review here…"
                style={{
                    "width": "100%",
                    "minHeight": "140px",
                    "resize": "vertical",
                    "padding": "12px",
                    "borderRadius": "8px",
                    "border": "1px solid #e5e7eb",
                    "fontSize": "14px",
                    "outline": "none",
                    "boxSizing": "border-box"
                }}
            />

            <div
                style={{
                    "display": "flex",
                    "justifyContent": "flex-end",
                    "marginTop": "16px"
                }}
            >
                <button
                    onClick={lambda -> None { props.handlePost(); }}
                    style={postBtnStyle}
                >
                    Post Review
                </button>
            </div>
        </div>;
    }

    # --------------------------------------
    # Component: Automatic reply (bottom-left)
    # --------------------------------------
    def AutoReplyCard() -> any {
        let cardStyle = cardBaseStyle();
        let titleStyle = sectionTitleStyle();
        let subtitleStyle = sectionSubtitleStyle();

        return <div style={cardStyle}>
            <h2 style={titleStyle}>Automatic reply</h2>
            <p style={subtitleStyle}>
                The system will generate a friendly response to your review here.
            </p>

            <div
                style={{
                    "borderRadius": "12px",
                    "border": "1px dashed #d1d5db",
                    "padding": "16px",
                    "backgroundColor": "#f9fafb",
                    "fontSize": "14px",
                    "color": "#6b7280",
                    "minHeight": "80px",
                    "display": "flex",
                    "alignItems": "center"
                }}
            >
                Automatic reply preview will appear here…
            </div>
        </div>;
    }

        # ----------------------------------------
    # Component: Filters for right-side section
    # ----------------------------------------
    def ReviewFilters() -> any {
        let [activeFilter, setActiveFilter] = useState("all");

        def pillStyle(name: str) -> any {
            let base = pillButtonBaseStyle();
            if name == activeFilter {
                base["backgroundColor"] = "#2563eb";
                base["color"] = "#ffffff";
                base["border"] = "1px solid #2563eb";
            } else {
                base["backgroundColor"] = "#ffffff";
                base["color"] = "#111827";
                base["border"] = "1px solid #e5e7eb";
            }
            return base;
        }

        return <div
            style={{
                "display": "flex",
                "flexDirection": "column",
                "alignItems": "flex-start",
                "gap": "10px",
                "marginBottom": "16px"
            }}
        >
            <div>
                <h2
                    style={{
                        "fontSize": "18px",
                        "fontWeight": "600",
                        "color": "#111827",
                        "marginBottom": "2px"
                    }}
                >
                    Latest reviews
                </h2>
                <p
                    style={{
                        "fontSize": "12px",
                        "color": "#9ca3af"
                    }}
                >
                    Filter feedback by category.
                </p>
            </div>

            <div
                style={{
                    "display": "flex",
                    "gap": "8px",
                    "flexWrap": "wrap"
                }}
            >
                <button
                    onClick={lambda -> None { setActiveFilter("all"); }}
                    style={pillStyle("all")}
                >
                    All
                </button>
                <button
                    onClick={lambda -> None { setActiveFilter("food"); }}
                    style={pillStyle("food")}
                >
                    Food
                </button>
                <button
                    onClick={lambda -> None { setActiveFilter("delivery"); }}
                    style={pillStyle("delivery")}
                >
                    Delivery
                </button>
                <button
                    onClick={lambda -> None { setActiveFilter("service"); }}
                    style={pillStyle("service")}
                >
                    Service
                </button>
            </div>
        </div>;
    }


    # -----------------------------------
    # Component: Right-side review list
    # (currently empty placeholder, no
    # dummy reviews as requested)
    # -----------------------------------
    def ReviewList() -> any {
        return <div
            style={{
                "borderRadius": "12px",
                "border": "1px dashed #e5e7eb",
                "padding": "20px",
                "backgroundColor": "#f9fafb",
                "color": "#9ca3af",
                "fontSize": "14px",
                "textAlign": "center",
                "minHeight": "160px",
                "display": "flex",
                "alignItems": "center",
                "justifyContent": "center"
            }}
        >
            Reviews will appear here once the system is connected.
        </div>;
    }

    # -----------------------------------
    # Component: CustomerDashboard layout
    # -----------------------------------
    def CustomerDashboard() -> any {
        let [input, setInput] = useState("");

        # When user clicks Post Review
        def handlePost() -> None {
            console.log("USER REVIEW:", input);
            # optional: clear the textarea after posting
            setInput("");
        }

        let pageStyle = {
            "minHeight": "100vh",
            "backgroundColor": "#f3f4f6",
            "display": "flex",
            "justifyContent": "center",
            "alignItems": "flex-start",
            "padding": "32px",
            "fontFamily": "system-ui, sans-serif",
            "boxSizing": "border-box"
        };

        let contentWrapperStyle = {
            "width": "100%",
            "maxWidth": "1120px",
            "display": "flex",
            "gap": "24px"
        };

        let leftColumnStyle = {
            "flex": "2",
            "display": "flex",
            "flexDirection": "column",
            "gap": "20px"
        };

        let rightColumnStyle = {
            "flex": "1.2",
            "display": "flex",
            "flexDirection": "column"
        };

        let rightCardStyle = cardBaseStyle();
        rightCardStyle["height"] = "100%";

        return <div style={pageStyle}>
            <div style={contentWrapperStyle}>
                <div style={leftColumnStyle}>
                    <ReviewInputCard
                        input={input}
                        setInput={setInput}
                        handlePost={handlePost}
                    />
                    <AutoReplyCard />
                </div>

                <div style={rightColumnStyle}>
                    <div style={rightCardStyle}>
                        <ReviewFilters />
                        <ReviewList />
                    </div>
                </div>
            </div>
        </div>;
    }

    # ----------------------------
    # Main entry
    # ----------------------------
    def app() -> any {
        return <CustomerDashboard />;
    }
}
