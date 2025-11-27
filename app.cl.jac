import from react {useState}


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

##################################

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
            type="text"
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
                onClick={props.computeAnswer}
                style={postBtnStyle}
            >
                Post Review
            </button>
        </div>
    </div>;
}

def AutoReplyCard(props: any) -> any {
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
            { props.loading &&
            <div className="flex justify-center items-center my-3">
                <div className="animate-spin rounded-full h-6 w-6 border-2 border-gray-300 border-t-transparent"></div>
                <span className="ml-2 text-sm text-gray-500">Generating reply...</span>
            </div>
            }
            <p>{props.answer}</p>
        </div>
    </div>;
}



def app -> Any {
    let [answer, setAnswer] = useState("");
    let [input, setInput] = useState("");
    let [loading, setLoading] = useState(false); 


    async def computeAnswer() -> None {
        setLoading(true);
        setAnswer("");
        response = root spawn analyzer(feedback={input});
        result = response.reports;
        setAnswer(result);
        setLoading(false);
    }
    return <div>
        <ReviewInputCard input={input} setInput={setInput} computeAnswer={computeAnswer} />
        <div>
            # <p>Response: {answer.reply}</p>
            # { loading &&
            # <div className="flex justify-center items-center my-3">
            #     <div className="animate-spin rounded-full h-6 w-6 border-2 border-gray-300 border-t-transparent"></div>
            #     <span className="ml-2 text-sm text-gray-500">Generating reply...</span>
            # </div>
            # }
            <AutoReplyCard answer={answer} loading={loading} />
        </div>
    </div>;
}