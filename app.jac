import from utils {
    analyzing,
    response_generator,
    save_to_csv,
    get_dates,
    generate_summary,
    filter_feedback
}

import from datetime { date, timedelta, datetime }

cl import from .CustomerDashboard { ReviewInputCard, AutoReplyCard }
cl import from .AdminDashboard { SentimentBarChart, StatCard, StatsRow, SummaryCard }
cl import from .HomePage { Home }




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
        print(analisis);
        reply = response_generator(
            feedback=self.feedback,
            sentiment=analisis.sentiment,
            urgency=analisis.urgency,
            category=analisis.category
        );
        print(reply);

        today = date.today().strftime("%m/%d/%Y");

        if [root->:Id:date==today:->(`?Sentiment:sen==analisis.sentiment)] {
            log = [->:Id:date==today:->(`?Sentiment:sen==analisis.sentiment)][0];
            log +>: Category(cat=analisis.category) :+> Feedback(fed=self.feedback);# report "Existing entry updated.";

        } else {
            new_sen_node = root +>: Id(date=today) :+> Sentiment(
                sen=analisis.sentiment
            );
            new_feedback_node = new_sen_node +>: Category(cat=analisis.category) :+> Feedback(
                fed=self.feedback
            );
        }

        save_to_csv(
            feedback=self.feedback,
            sentiment=analisis.sentiment,
            urgency=analisis.urgency,
            category=analisis.category
        );

        report reply ;
    }
}

walker grt_counts {
    has range_option: str;

    can start with `root entry {
        let (start_date, end_date) = get_dates(range_option=self.range_option);

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
}

walker summerize {
    has range_option: str;

    can start with `root entry {
        let (start_date, end_date) = get_dates(range_option=self.range_option);

        summary = generate_summary(start_date_str=start_date, end_date_str=end_date);

        report {"summary": summary,} ;
    }
}
