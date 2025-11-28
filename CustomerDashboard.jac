cl import from react { useState }

cl def ReviewInputCard(props: any) -> any {

    return <div className="cardbase-style">
        <h2 className="section-title">Share your experience</h2>
        <p className="section-subtitle">
            Tell us about your visit so we can improve our restaurant service.
        </p>

        <label className="review-label">   
            Your review
        </label>

        <textarea
            type="text"
            value={props.input}
            onChange={lambda e: any -> None { props.setInput(e.target.value); }}
            placeholder="Write your review here…"
            className ="review-textarea"
        />

        <div
            className="review-actions"
        >
            <button
                onClick={props.computeAnswer}
                className="primary-button"
            >
                Post Review
            </button>
        </div>
    </div>;
}

cl def AutoReplyCard(props: any) -> any {
    

    return <div className="cardbase-style">
        <h2 className="section-title">Automatic reply</h2>
        <p className="section-subtitle">
            The system will generate a friendly response to your review here.
        </p>

        <div
            className="auto-reply-box"
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