#gonna probe the leaderboard, did this last comp, but im gonna do it again and
#use this to verify the relationship between validation and test sets

#start with 0.2 and 0.3

const_sol <- function(const) {
    sample_sub <- read.csv('original_data/sample_submission.csv.gz')
    sample_sub$item_cnt_month <- const
    print('Submission sample:')
    print(head(sample_sub))
    file_loc <- paste0('gen_data/constant_submission_',const,'.csv')
    print(paste('Saving to',file_loc))
    write.csv(sample_sub,file=file_loc,row.names = FALSE)
    #write.csv()
}