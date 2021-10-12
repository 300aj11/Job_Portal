package com.jobportal.model;

public class ApplyDTO {
    
    private int id, job_id,candidate_id;
    private String msg;

    public ApplyDTO() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getJob_id() {
        return job_id;
    }

    public void setJob_id(int job_id) {
        this.job_id = job_id;
    }

    public int getCandidate_id() {
        return candidate_id;
    }

    public void setCandidate_id(int candidate_id) {
        this.candidate_id = candidate_id;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    @Override
    public String toString() {
        return "ApplyDTO{" + "id=" + id + ", job_id=" + job_id + ", candidate_id=" + candidate_id + ", msg=" + msg + '}';
    }
    
    
}
