![The Seattle Times](https://github.com/seattletimes/hospital_requests_20200324/blob/master/assets/ST_Logo.png)


# Extracting data on hospital's resources requests from PDF reports

By [Manuel Villa](https://twitter.com/mvilla1859).

This repository shows the methodology used to obtain data for The Seattle Times story published on 5 April 2020, [How the coronavirus overwhelmed Washington state’s early efforts to contain it ](https://www.seattletimes.com/seattle-news/times-watchdog/lost-battle-how-coronavirus-overwhelmed-washington-states-efforts-to-contain-it/).

The results are summarized in the splendid vizualization by [Emily Eng](https://github.com/emilymeng) you can see at the bottom.

Staff reporter [Dan Gilbert](https://www.seattletimes.com/author/daniel-gilbert/) obtained the Washington state Military Department's database of requests from healthcare organizations and government agencies for resources to respond to the coronavirus outbreak. We obtained the 70 PDF files saved down in the folder *source_data/pdf*. The objective was to convert these files into structured data.

Not having time nor the will to reinvent the wheel, we followed the least-resistance approach: to use [Tabula](https://tabula.technology/). This marvelous tool efficiently transforms tables containd inside PDFs into structured data formats, such as CSV or JSON. The tradeoff for such convenience, however, is that those PDF tables need to be in pristine shape for Tabula to efficiently recognize and convert them. That was not the case with the records we obtained. So to use it, we would first need to overhaul the PDFs to Tabula's taste.

There are two scripts in the repository:

### script_01_crop_fest_python.ipynb
The PDFs had a lot of information that we did not need. Not only that, but that information's layout in the PDF kept throwing Tabula off. This script cropped away areas from all pages that constituted nothing but noise. Then we produced new PDFs that did not include those unnecessary areas and fed them to Tabula.

### script_02_data_cleaning_and_analysis.ipynb
After feeding the cropped PDFs to Tabula, it very kindly produced CSV files that contained the data it scraped off from them. This was still very raw data that needed a lot of polishing and standardizing. This script did that.

Both scripts are populated with comments that we hope will make them easy to follow and to understand the rather simple structure of the repository.

[Questions or comments](mailto:mvilla@seattletimes.com) are always welcome.

Cheers,

Manuel Villa





![Undersupplied Vizualization](https://github.com/seattletimes/hospital_requests_20200324/blob/master/assets/Undersupplied_Viz_by_Emily_Eng.png)
