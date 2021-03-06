package com.example.sweater.domain;

import javax.persistence.*;

@Entity
public class Message {
    // Поля
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private Long id;

    private String text;
    private String tag;
    private String filename;


    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User author;

    // Конструкторы
    public Message() {
    }

    public Message(String text, String tag, User user) {
        this.author = user;
        this.text = text;
        this.tag = tag;
    }

    // Методы
    public String getAuthorName(){
        return author != null ? author.getUsername() : "None" ;
    }

    // Геттеры сеттеры
    public User getAuthor() {
        return author;
    }

    public void setAuthor(User author) {
        this.author = author;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getText() { return text; }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTag() {
        return tag;
    }

    public void setTag(String tag) {
        this.tag = tag;
    }

    public String getFilename() { return filename; }

    public void setFilename(String filename) { this.filename = filename; }

}
