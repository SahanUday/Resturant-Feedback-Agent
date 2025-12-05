# Restaurant Feedback Agent

An intelligent restaurant feedback management system built with Jac-Lang that automatically analyzes customer reviews, generates automated responses, and provides actionable insights for restaurant management.

## Features

### Customer Portal
- **Submit Feedback**: Customers can share their dining or delivery experience
- **Automated AI Responses**: Generate instant, personalized responses generated using AI based on:
- **Multi-language Support**: Responds in the same language as the feedback (Sinhala/Tamil)

### Admin Dashboard
- **Time Range Filtering**: View data for Last 3 Days, Last 7 Days, or Last 30 Days
- **Sentiment Tracking**: Bar charts showing positive, negative, and neutral feedback distribution
- **Category Statistics**: Track feedback counts across Food Quality, Delivery, Pricing, and Other
- **AI-Generated Summaries**: Automatic summary generation of customer feedback with key insights
- **Actionable Suggestions**: AI-powered recommendations for improving customer satisfaction

### Technical Features
- **Graph Database**: Jac-Scale: Stores feedback with relationships between dates, sentiments, categories, and feedback text
- **LLM Integration**: byLLM: Uses Gemini 2.5 Flash for intelligent analysis and response generation
- **React Frontend**: Jac-Client: Modern, responsive UI with real-time data visualization using Recharts

## File/Folder Structure

```
Resturant-Feedback-Agent/
├── app.jac                      # Main application logic (walkers, nodes, edges)
├── app.cl.jac                   # Client-side Jac code (React components logic)
├── utils.jac                    # Utility functions (LLM analysis, date handling)
├── components/
│   ├── AdminDashboard.jac      # Admin dashboard React components
│   ├── customerdashboard.jac   # Customer portal React components
│   └── HomePage.jac            # Home page component with portal selection
├── adstyles.css               # Admin dashboard styles
├── cstyles.css                # Customer portal styles
├── homestyle.css              # Home page styles
└── README.md                 # Project documentation
```

## Getting Started

### Prerequisites
- Python 3.10 or higher
- Node.js 18+ and npm

### 1. Clone the Jaseci Repository

First, clone the repository:
```bash
git clone https://github.com/SahanUday/Resturant-Feedback-Agent.git
cd Resturant-Feedback-Agent
```

### 2. Create Virtual Environment

```bash
# Create a virtual environment
python -m venv venv

# Activate virtual environment
# On Linux/Mac:
source venv/bin/activate

# On Windows:
venv\Scripts\activate
```

### 3. Install Jac-Lang and Dependencies

```bash
# Install Jac-Lang
pip install jaclang

# Install Jac-Client for client-side functionality
pip install jac-client

# Install ByLLM for LLM integration
pip install byllm
```


### 4. Install Node.js Dependencies

```bash
# Install all npm packages (React, Recharts, React Router, etc.)
npm install
```
```
npm install recharts
```

### 5. Set Up Environment Variables

Create a `.env` file in the root directory and add your API keys:

```bash
# Google Gemini API Key
GEMINI_API_KEY=your_gemini_api_key_here
```

### 6. Run the Application

```bash
# Start the Jac server
jac serve app.jac
```

The application will be available at `http://localhost:8000/page/app`


## Usage

### Customer Flow
1. Click "Go to customer portal"
2. Enter your feedback in the text area
3. Submit and receive an automated, personalized response

### Admin Flow
1. Navigate to the home page
2. Click "Go to admin portal"
3. Select a time range (Last 3/7/30 Days)
4. View sentiment trends and category statistics
5. Click "Generate Summary" for AI-generated insights
6. Click "Generate Suggestions" for actionable recommendations

---

Happy coding with Jac!
