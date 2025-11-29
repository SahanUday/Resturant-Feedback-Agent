import {__jacJsx, __jacSpawn} from "@jac-client/utils";
import { useState } from "react";
function ReviewInputCard(props) {
  return __jacJsx("div", {"className": "cardbase-style"}, [__jacJsx("h2", {"className": "section-title"}, ["Share your experience"]), __jacJsx("p", {"className": "section-subtitle"}, ["Tell us about your visit so we can improve our restaurant service."]), __jacJsx("label", {"className": "review-label"}, ["   ", "Your review"]), __jacJsx("textarea", {"type": "text", "value": props.input, "onChange": e => {
    props.setInput(e.target.value);
  }, "placeholder": "Write your review here…", "className": "review-textarea"}, []), __jacJsx("div", {"className": "review-actions"}, [__jacJsx("button", {"onClick": props.computeAnswer, "className": "primary-button"}, ["Post Review"])])]);
}
function AutoReplyCard(props) {
  return __jacJsx("div", {"className": "cardbase-style"}, [__jacJsx("h2", {"className": "section-title"}, ["Automatic reply"]), __jacJsx("p", {"className": "section-subtitle"}, ["The system will generate a friendly response to your review here."]), __jacJsx("div", {"className": "auto-reply-box"}, [props.loading && __jacJsx("div", {"className": "flex justify-center items-center my-3"}, [__jacJsx("div", {"className": "animate-spin rounded-full h-6 w-6 border-2 border-gray-300 border-t-transparent"}, []), __jacJsx("span", {"className": "ml-2 text-sm text-gray-500"}, ["Generating reply..."])]), __jacJsx("p", {}, [props.answer])])]);
}
export { AutoReplyCard, ReviewInputCard };
