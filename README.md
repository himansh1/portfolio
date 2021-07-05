# **Himansh's super awesome portfolio**


| Category  | Objective | Project Name | Project File |
| ------------- | ------------- | ------------- |  
| Finance  | Optimisation  | Global Minium Variance Portflio for Stocks  | [Global_MVP_Portfolio.R](https://github.com/himansh1/portfolio/blob/main/R/Global_MVP_Portfolio.R)
| Supply Chain/Operations  | Forecasting  | SKU level Forecasting (RShiny)  | [SKU Forecasting RShiny App](https://github.com/himansh1/portfolio/tree/main/R/SKU_Forecast_Rshiny)
| Music  | Recommendation  | Spotify Playlist using ML  | [Spotify Playlist Using ML](https://github.com/himansh1/portfolio/tree/main/Python/Spotify_Playlist_ML)

___________________________________________________________________________________________________________________________________________________

## Project: Global Minimum Variance Portflio for Shares/Stocks

**Objective**: 
>Optimise a portfolio of selected stocks to minimise risk

Functionality: 
1. User selects N stocks they may be interested in making a portfolio of. User inputs the Yahoo Finance Tickrs of selected stocks (for ex. APPL,MSFT, etc). 
2. Running the script will result in vector 'weights' which defines the optimal investment as a % of total in each stock of the portfolio.
3. The weights are optimally theoretically minimizing the variance or risk of the portfolio of entered stocks;

Requirements: 
1. Correct Tckrs from Yahoo Finance
 
___________________________________________________________________________________________________________________________________________________

## Project: SKU Level Forecasting APP

**Objective**: 
>Shiny Application that helps forecast at SKU level

Functionality: 
1. User inputs file in the sample data.csv format that contains SKU, Brand, Sub-Category, Category, Region and Actuals data. 
2. User selects what SKU/Brand/Sub-Cat/Cate/Region wants to be investigated - application builds dataset
3. Various forecasting methods can be explored and differences in values investigated. Model performance on holdout sets also available at the bottom ;
4. Batch forecasts and best models/recommended models output
5. Decomposition & Seasonality plots for selected SKU/Brand available 

Requirements: 
1. Data in csv file
2. Data Format is important - Wrong format will lead to crashes
3. Date column needs to be named Date 

___________________________________________________________________________________________________________________________________________________

## Project: Using Spotfiy API and Machine Learning to create a personalized playlist  

**Objective**: 
>Create a personalized playlist using Machine Learning

Functionality: 
1. User inputs all developers.spotify credentials - client id, client secret, username and callback to start investigation/analysis/creation of playlist. 
2. User can investigate their top playlists, top songs, and the attributes of those songs - ALL specific to user.
3. Attributes include 
Mood
>Danceability: Danceability describes how suitable a track is for dancing based on a combination of musical elements including tempo, rhythm stability, beat strength, and overall regularity. A value of 0.0 is least danceable and 1.0 is most danceable.
>>Energy: Measure from 0.0 to 1.0 and represents a perceptual measure of intensity and activity. Typically, energetic tracks feel fast, loud, and noisy. For example, death metal has high energy, while a Bach prelude scores low on the scale. Perceptual features for energy include dynamic range, perceived loudness, timbre, onset rate, and general entropy.
>>>Valence: A measure from 0.0 to 1.0 describing the musical positiveness conveyed by a track. Tracks with high valence sound more positive (e.g. happy, cheerful, euphoric), while tracks with low valence sound more negative (e.g. sad, depressed, angry).
>>>>Tempo: The overall estimated tempo of a track in beats per minute (BPM). In musical terminology, tempo is the speed or pace of a given piece and derives directly from the average beat duration.

Properties
>Loudness: Loudness values are averaged across the entire track and are useful for comparing relative loudness of tracks. Loudness is the quality of a sound that is the primary psychological correlate of physical strength (amplitude). Values typical range between -60 and 0 db.
>>Speechiness: Detects the presence of spoken words in a track. The more exclusively speech-like the recording (e.g. talk show, audiobook, poetry), the closer to 1.0 the attribute value. Values above 0.66 describe tracks that are probably made entirely of spoken words. Values between 0.33 and 0.66 describe tracks that may contain both music and speech, either in sections or layered, including such cases as rap music.
>>>Instrumentalness: Predicts whether a track contains no vocals. “Ooh” and “aah” sounds are treated as instrumental in this context. Rap or spoken word tracks are clearly “vocal”. The closer the instrumentalness value is to 1.0, the greater likelihood the track contains no vocal content. Values above 0.5 are intended to represent instrumental tracks, but confidence is higher as the value approaches 1.0.
>>>>Mode: Indicates the modality (major or minor) of a track, the type of scale from which its melodic content is derived. Major is represented by 1 and minor is 0.

Context
>Acousticness: A confidence measure from 0.0 to 1.0 of whether the track is acoustic. 1.0 represents high confidence the track is acoustic.
>>Liveness: Detects the presence of an audience in the recording. Higher liveness values represent an increased probability that the track was performed live. A value above 0.8 provides a strong likelihood that the track is live

Requirements: 
1. Spotfiy API requirements - Use the correct global scopes found @ [developers.spotify](https://developer.spotify.com) 
2. Initial Investigation not required for Machine learning - more to illustrate  
