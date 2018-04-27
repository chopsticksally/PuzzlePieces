package com.skilldistillery.puzzlepieces.entities;

import org.hibernate.search.annotations.Field;
import org.hibernate.search.annotations.Indexed;

@Indexed
public enum Condition {
	@Field
	New, Like_New, Used, Worn

}
