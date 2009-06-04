package fi.hut.soberit.agilefant.util;

import java.util.ArrayList;
import java.util.Collection;

import fi.hut.soberit.agilefant.model.Task;

public class TaskTO extends Task {
   
    // Helper fields
    private Collection<ResponsibleContainer> userData = new ArrayList<ResponsibleContainer>();
    
    public TaskTO(Task task) {
        this.setId(task.getId());
        this.setName(task.getName());
        this.setDescription(task.getDescription());
        this.setIteration(task.getIteration());
        this.setStory(task.getStory());
        this.setState(task.getState());
        this.setPriority(task.getPriority());
        this.setTodos(task.getTodos());
        this.setEffortLeft(task.getEffortLeft());
        this.setOriginalEstimate(task.getOriginalEstimate());
        this.setHistoryEntries(task.getHistoryEntries());
        this.setResponsibles(task.getResponsibles());
    }
    
    public void setUserData(Collection<ResponsibleContainer> userData) {
        this.userData = userData;
    }

    public Collection<ResponsibleContainer> getUserData() {
        return userData;
    }
}