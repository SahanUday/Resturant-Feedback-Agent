import from byllm.llm { Model }
import os, csv;
import from datetime { date, timedelta, datetime }
import pandas as pd;

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
    
def save_to_csv(feedback: str,sentiment: str,urgency: str,category: str,filename: Any = 'feedback_dataset.csv') {
    let file_exists = os.path.isfile(filename);
    with open(filename, mode='a', newline='', encoding='utf-8') as f {
        let writer = csv.writer(f);
        if not file_exists {
            writer.writerow(['date','feedback','sentiment','urgency','category']);
        }
        writer.writerow(
            [date.today(),feedback,sentiment,urgency,category]
        );
    }
}

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

def filter_feedback(start_date_str: str, end_date_str: str) -> dict {
    let start_date = datetime.strptime(start_date_str, '%m/%d/%Y').date();
    let end_date = datetime.strptime(end_date_str, '%m/%d/%Y').date();
     
    let filename = "feedback_dataset.csv";
    let df = pd.read_csv(filename);

    let df['date'] = pd.to_datetime(df['date']).dt.date;
    let filtered = df[
        ((df['date'] >= start_date) & (df['date'] <= end_date))
    ];

    let positive_feedbacks = filtered[(filtered['sentiment'] == 'positive')]['feedback'].tolist();
    let negative_feedbacks = filtered[(filtered['sentiment'] == 'negative')]['feedback'].tolist();
    let neutral_feedbacks = filtered[(filtered['sentiment'] == 'neutral')]['feedback'].tolist();

    return {
        "positive": positive_feedbacks,
        "negative": negative_feedbacks,
        "neutral": neutral_feedbacks,
    };
}

"""You are an expert summary generator. Your task is to generate a concise and informative summary of customer feedback for a restaurant based on the provided feedbacks(positive, negative, neutral). Get the feedbacks from the given date range using tool.
Highlight key strengths and urgent issues. Summarize the overall customer sentiment trend, notable positives, and areas needing immediate attention.
Generate summery as paragraphs with clear headings for each sentiment category.
Add last paragraph by including overall overveiw of the summarize"""
def generate_summary(start_date_str: str, end_date_str: str) -> str by llm(method="ReAct", tools=([filter_feedback])) ;



