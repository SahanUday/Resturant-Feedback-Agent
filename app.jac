import from utils { analyzing, response_generator, save_to_csv, get_dates, generate_summary, filter_feedback }
import from datetime { date }

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
    has feedback: str ;

    obj __specs__ {
        static has auth: bool = False;
    }

    can start with `root entry {

        response = analyzing(self.feedback);
        reply = response_generator(feedback=self.feedback, sentiment=response.sentiment, urgency=response.urgency, category=response.category);

        today = date.today().strftime("%m/%d/%Y") ;

        if [root->:Id: date==today:->(`?Sentiment: sen==response.sentiment)]{
            log = [->:Id: date==today:->(`?Sentiment: sen==response.sentiment)][0];
            log+>:Category(cat=response.category):+> Feedback(fed=self.feedback);
            report "Existing entry updated.";
    
        } else {
            new_sen_node = root +>:Id(date=today):+> Sentiment(sen=response.sentiment);
            new_feedback_node = new_sen_node +>:Category(cat=response.category):+> Feedback(fed=self.feedback);
     
        }
 
        # report {
        #     "sentiment": response.sentiment,
        #     "urgency": response.urgency,
        #     "category": response.category,
        #     "date": str(today),
        # };
        save_to_csv(feedback=self.feedback, sentiment=response.sentiment, urgency=response.urgency, category=response.category);

        report {
            "reply": reply,
        };


    }
}

walker grt_counts {
    has range_option: str;

    can start with `root entry {
        let (start_date, end_date) = get_dates(range_option=self.range_option);
        # report {
        #     "start_date": (start_date),
        #     "end_date": (end_date),
        # };

        positive = [root->:Id: date>=start_date :->(`?Sentiment: sen=="positive")->:Category:->(`?Feedback)];
        negative = [root->:Id: date>=start_date:->(`?Sentiment: sen=="negative")->:Category:->(`?Feedback)];
        neutral = [root->:Id: date>=start_date:->(`?Sentiment: sen=="neutral")->:Category:->(`?Feedback)];

        pricing = [root->:Id: date>=start_date :->(`?Sentiment)->:Category: cat=="Pricing":->(`?Feedback)];
        food_quality = [root->:Id: date>=start_date:->(`?Sentiment)->:Category: cat=="Food Quality":->(`?Feedback)];
        delivery = [root->:Id: date>=start_date:->(`?Sentiment)->:Category: cat=="Delivery":->(`?Feedback)];
        other = [root->:Id: date>=start_date:->(`?Sentiment)->:Category: cat=="Other":->(`?Feedback)];

        report {
            "positive_count": len(positive),
            "negative_count": len(negative),
            "neutral_count": len(neutral),

            "pricing_count": len(pricing),
            "food_quality_count": len(food_quality),
            "delivery_count": len(delivery),
            "other_count": len(other),
        };


        

    }
}

walker summerize {
    has range_option: str;

    can start with `root entry {
        let (start_date, end_date) = get_dates(range_option=self.range_option);

        summary = generate_summary(start_date_str=start_date, end_date_str=end_date);

        report {
            "summary": summary,
        };  
        
    }
}