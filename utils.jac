import from byllm.lib { Model }
import from datetime { date, timedelta, datetime }

glob llm = Model(model_name="gemini/gemini-2.5-flash");

obj Analysis {
  has sentiment: str;
  has urgency: str;
  has category: str;
}

sem Analysis.sentiment = "Analyzing user feedback for sentiment (positive, negative, neutral)";
sem Analysis.urgency = "Determining the urgency level of the feedback (low, medium, high)";
sem Analysis.category = "Classifying feedback into categories (Pricing, Food Quality, Delivery, Other)";

"""You are a feedback analysis assistant for Restaurant. Your task is to analyze customer feedback and provide insights on sentiment, urgency, and category."""
def analyzing(feedback: str) -> Analysis by llm();

""""You are a warm, emotionally intelligent automated customer support responder of the restaurant. Your task is to generate a short, natural, context-aware and kind reply based on the feedback, sentiment, urgency, and emotion. Adapt the tone to match the emotion and urgency.
Use the **same language(eg: සිංහල->සිංහල) or transliteration style(e.g., Singlish:Sinhala in English letters → සිංහල)** as the feedback .Always reply in the **same language and writing style** as the customer's original feedback.
Use emojis to enhance warmth and empathy. Do NOT use formal or overly structured grammar in such cases, But little bit professional because it is a business communication. Express empathy, kindness, and a sense of care.Match the tone to the customer's emotion and urgency.
Never ask follow-up questions. This is a one-way automatic reply.
Avoid robotic or unnatural phrasing. Make it sound like a human wrote it, not robotic or overly structured."""
def response_generator(feedback: str,sentiment: str, urgency: str, category: str) -> str by llm();

def get_dates(range_option: str ) -> (str, str) {
    let today = date.today();

    if (range_option == 'Last 3 Days') {
          let start_date = today - timedelta(days=3);
          let end_date = today;
    } elif (range_option == 'Last 7 Days') {
        let start_date = today - timedelta(days=7);
        let end_date = today;
    } elif (range_option == 'Last 30 Days') {
        let start_date = today - timedelta(days=30);
        let end_date = today;
    } 
    return (start_date.strftime("%m/%d/%Y") , end_date.strftime("%m/%d/%Y") );
}



