import from utils {analyzing,response_generator,get_dates,}
import from byllm.lib { Model }
import from datetime { date, timedelta, datetime }

cl import from .components.AdminDashboard { SentimentBarChart, StatCard, StatsRow, SummaryCard }
cl import from .components.HomePage { Home }
cl import from .components.customerdashboard { ReviewInputCard, AutoReplyCard }

glob llm = Model(model_name="gemini/gemini-2.5-flash");

def filter_feedback(start_date_str: str, end_date_str: str) -> dict {
    let start_date = datetime.strptime(start_date_str, '%m/%d/%Y').date();
    let end_date = datetime.strptime(end_date_str, '%m/%d/%Y').date();
    
    let dates = [ ] ; 
    let current = start_date ;

    while ( current <= end_date ) { 
        dates . append ( current . strftime ( '%m/%d/%Y' ) ) ; 
        let current = current+timedelta(days=1) ; 
    } 

    let positive_list = [];
    let negative_list = [];
    let neutral_list = [];

    for day in dates {

        if [root->:Id: date==day :->(`?Sentiment: sen=="positive")->:Category:->(`?Feedback)] {
            positive_list = [root->:Id: date==day :->(`?Sentiment: sen=="positive")->:Category:->(`?Feedback)];
        }
        if [root->:Id: date==day :->(`?Sentiment: sen=="negative")->:Category:->(`?Feedback)] {
            negative_list = [root->:Id: date==day :->(`?Sentiment: sen=="negative")->:Category:->(`?Feedback)];
        }
        if [root->:Id: date==day :->(`?Sentiment: sen=="neutral")->:Category:->(`?Feedback)] {
            neutral_list = [root->:Id: date==day :->(`?Sentiment: sen=="neutral")->:Category:->(`?Feedback)];
        }
    }

    let positive_feedbacks = [];
    let negative_feedbacks = [];
    let neutral_feedbacks = [];

    for p_feed in positive_list {
        positive_feedbacks.append(p_feed.fed);
    }
    for n_feed in negative_list {
        negative_feedbacks.append(n_feed.fed);
    }
    for ne_feed in neutral_list {
        neutral_feedbacks.append(ne_feed.fed);
    }

    return {
        "positive": positive_feedbacks,
        "negative": negative_feedbacks,
        "neutral": neutral_feedbacks,
    };
}

"""You are an expert summary generator. Your task is to generate a concise and informative summary of customer feedback for a restaurant based on the provided feedbacks(positive, negative, neutral). Get the feedbacks from the given date range using tool.
Highlight key strengths and urgent issues. Summarize the overall customer sentiment trend, notable positives, and areas needing immediate attention.
Generate summery as paragraphs with clear headings for each sentiment category.
Add last paragraph by including overall overveiw of the summarize
I want to show this summary in JS frontend so make sure summary include plain text including paragraphs and highlighting topics."""
def generate_summary(start_date_str: str, end_date_str: str) -> str by llm(method="ReAct", tools=([filter_feedback])) ;

def search_counts (start_date: str, end_date: str) -> None {

    start = datetime.strptime(start_date, "%m/%d/%Y");
    end   = datetime.strptime(end_date, "%m/%d/%Y");

    let dates = [ ] ; 
    let current = start ;

    while ( current <= end ) { 
        dates . append ( current . strftime ( '%m/%d/%Y' ) ) ; 
        let current = current+timedelta(days=1) ; 
    } 

    let positive_counts = [ ] ;
    let negative_counts = [ ] ;
    let neutral_counts = [ ] ;

    
    for day in dates {
        let p_count = 0 ;
        let n_count = 0 ;
        let ne_count = 0 ;
        
        

        if [root->:Id: date==day :->(`?Sentiment: sen=="positive")->:Category:->(`?Feedback)] {
            positive = [root->:Id: date==day :->(`?Sentiment: sen=="positive")->:Category:->(`?Feedback)];
            p_count = len(positive);
        }
        if [root->:Id: date==day :->(`?Sentiment: sen=="negative")->:Category:->(`?Feedback)] {
            negative = [root->:Id: date==day :->(`?Sentiment: sen=="negative")->:Category:->(`?Feedback)];
            n_count = len(negative);
        }
        if [root->:Id: date==day :->(`?Sentiment: sen=="neutral")->:Category:->(`?Feedback)] {
            neutral = [root->:Id: date==day :->(`?Sentiment: sen=="neutral")->:Category:->(`?Feedback)];
            ne_count = len(neutral);
        }

        positive_counts . append ( p_count ) ;
        negative_counts . append ( n_count ) ;
        neutral_counts . append ( ne_count ) ;
    }

    pricing = [root->:Id: date>=start_date :->(`?Sentiment)->:Category: cat=="Pricing":->(`?Feedback)];
    food_quality = [root->:Id: date>=start_date:->(`?Sentiment)->:Category: cat=="Food Quality":->(`?Feedback)];
    delivery = [root->:Id: date>=start_date:->(`?Sentiment)->:Category: cat=="Delivery":->(`?Feedback)];
    other = [root->:Id: date>=start_date:->(`?Sentiment)->:Category: cat=="Other":->(`?Feedback)];

    report {
        "positive_count": positive_counts,
        "negative_count": negative_counts,
        "neutral_count": neutral_counts,

        "pricing_count": len(pricing),
        "food_quality_count": len(food_quality),
        "delivery_count": len(delivery),
        "other_count": len(other),

        "dates": dates,
    };


}

node Sentiment {
    has sen: str;
}

edge Id {
    has date: str;
}

edge Category {
    has cat: str;
}

node Feedback {
    has fed: str;
}

walker analyzer {
    has feedback: str;

    obj __specs__ {
        static has auth: bool = False;
    }

    can start with `root entry {
        analisis = analyzing(self.feedback);
        reply = response_generator(feedback=self.feedback, sentiment=analisis.sentiment, urgency=analisis.urgency, category=analisis.category);
        today = date.today().strftime("%m/%d/%Y");

        # save analysis to graph db
        if [root->:Id:date==today:->(`?Sentiment:sen==analisis.sentiment)] {
            log = [->:Id:date==today:->(`?Sentiment:sen==analisis.sentiment)][0];
            log +>: Category(cat=analisis.category) :+> Feedback(fed=self.feedback);
            print("Existing entry updated.");
        } else {
            new_sen_node = root +>: Id(date=today) :+> Sentiment(sen=analisis.sentiment);
            new_feedback_node = new_sen_node +>: Category(cat=analisis.category) :+> Feedback(fed=self.feedback);
            print("New entry created.");
        }
        report reply ;
    }
}

walker grt_counts {
    has range_option: str;

    can start with `root entry {
        let (start_date, end_date) = get_dates(range_option=self.range_option);
        search_counts(start_date=start_date, end_date=end_date);
    }
}

walker summerize {
    has range_option: str;

    can start with `root entry {
        let (start_date, end_date) = get_dates(range_option=self.range_option);
        summary = generate_summary(start_date_str=start_date, end_date_str=end_date);
        report {"summary": summary,} ;
    }
}
