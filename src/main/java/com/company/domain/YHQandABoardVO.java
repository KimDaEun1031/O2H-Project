package com.company.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class YHQandABoardVO {
 int bno;
 String writer_id;
 String title;
 String content;
 String reply;
 String replyer;
 Date regdate;
 Date replyDate;
 String userId;
}
