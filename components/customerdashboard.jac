cl import from react { useState }

cl def CustomerHeaderSection() -> any {
    return <div className="customer-header-container">
        <h2 className="customer-hero-title">
            Customer Feedback Portal
        </h2>
        <p className="customer-hero-subtitle">
            Tell us about your dining or delivery experience so we can keep improving our food, service, and overall experience for you.
        </p>
    </div>;
}


cl def ReviewInputCard(props: any) -> any {
    return <div className="cardbase-style">
        <h2 className="section-title">
            Share your experience
        </h2>
        <p className="section-subtitle">
            Tell us about your visit so we can improve our restaurant service.
        </p>
        <label className="review-label">
               Your feedback
        </label>
        <textarea
            type="text"
            value={props.input}
            onChange={lambda  e: any  -> None{ props.setInput(e.target.value);} }
            placeholder="Write your feedback here…"
            className="review-textarea"
        />
        <div className="review-actions">
            <button
                onClick={props.computeAnswer}
                className="primary-button"
            >
                Submit
            </button>
        </div>
    </div>;
}

cl def AutoReplyCard(props: any) -> any {
    return <div className="cardbase-style">
        <h2 className="section-title">
            Restaurant Response
        </h2>
        <p className="section-subtitle">
            We will give response to your review here.
        </p>
        <div className="auto-reply-box">
            {props.loading
            && <div className="flex justify-center items-center my-3">
                <div className="animate-spin rounded-full h-6 w-6 border-2 border-gray-300 border-t-transparent"></div>
                <span className="ml-2 text-sm text-gray-500">
                    Typing...
                </span>
            </div>}
            <p>
                {props.answer}
            </p>
        </div>
    </div>;
}

