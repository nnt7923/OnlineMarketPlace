/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author admin
 */
public class FeedbackReply {
       private int replyId;
    private int feedbackId;
    private int sellerId;
    private String replyContent;
    private Date replyDate;

    public FeedbackReply(int replyId, int feedbackId, int sellerId, String replyContent, Date replyDate) {
        this.replyId = replyId;
        this.feedbackId = feedbackId;
        this.sellerId = sellerId;
        this.replyContent = replyContent;
        this.replyDate = replyDate;
    }

    public FeedbackReply() {
    }

    public int getReplyId() {
        return replyId;
    }

    public void setReplyId(int replyId) {
        this.replyId = replyId;
    }

    public int getFeedbackId() {
        return feedbackId;
    }

    public void setFeedbackId(int feedbackId) {
        this.feedbackId = feedbackId;
    }

    public int getSellerId() {
        return sellerId;
    }

    public void setSellerId(int sellerId) {
        this.sellerId = sellerId;
    }

    public String getReplyContent() {
        return replyContent;
    }

    public void setReplyContent(String replyContent) {
        this.replyContent = replyContent;
    }

    public Date getReplyDate() {
        return replyDate;
    }

    public void setReplyDate(Date replyDate) {
        this.replyDate = replyDate;
    }
    
    
    
}
