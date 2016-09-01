package org.expert.database.entities;

import java.util.ArrayList;

import com.fasterxml.jackson.annotation.JsonProperty;

public class ModelWhere {

	@JsonProperty("SKILL_ID")
	private ArrayList<Integer>skills;
	
	@JsonProperty("POSITION_ID")
	private ArrayList<Integer>positions;
	
	@JsonProperty("GENDERS")
	private ArrayList<String>genders;
	
	@JsonProperty("AGES")
	private ArrayList<Integer>ages;
	
	@JsonProperty("LOCATION_ID")
	private ArrayList<Integer>locations;
	
	@JsonProperty("LANGUAGE_ID")
	private ArrayList<Integer>languages;
	
	@JsonProperty("EXPERIENCE_ID")
	private ArrayList<Integer>experiences;
	
	@JsonProperty("SALARIES")
	private ArrayList<Integer>salaries;

	public ArrayList<Integer> getSkills() {
		return skills;
	}

	public void setSkills(ArrayList<Integer> skills) {
		this.skills = skills;
	}

	public ArrayList<Integer> getPositions() {
		return positions;
	}

	public void setPositions(ArrayList<Integer> positions) {
		this.positions = positions;
	}

	public ArrayList<String> getGenders() {
		return genders;
	}

	public void setGenders(ArrayList<String> genders) {
		this.genders = genders;
	}

	public ArrayList<Integer> getAges() {
		return ages;
	}

	public void setAges(ArrayList<Integer> ages) {
		this.ages = ages;
	}

	public ArrayList<Integer> getLocations() {
		return locations;
	}

	public void setLocations(ArrayList<Integer> locations) {
		this.locations = locations;
	}

	public ArrayList<Integer> getLanguages() {
		return languages;
	}

	public void setLanguages(ArrayList<Integer> languages) {
		this.languages = languages;
	}

	public ArrayList<Integer> getExperiences() {
		return experiences;
	}

	public void setExperiences(ArrayList<Integer> experiences) {
		this.experiences = experiences;
	}

	public ArrayList<Integer> getSalaries() {
		return salaries;
	}

	public void setSalaries(ArrayList<Integer> salaries) {
		this.salaries = salaries;
	}
		
}
