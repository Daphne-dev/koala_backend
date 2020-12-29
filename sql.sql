-- 테이블 순서는 관계를 고려하여 한 번에 실행해도 에러가 발생하지 않게 정렬되었습니다.

-- companies Table Create SQL
CREATE TABLE companies
(
    `id`          INT             NOT NULL    AUTO_INCREMENT, 
    `name`        VARCHAR(45)     NULL, 
    `image_url`   VARCHAR(200)    NULL, 
    `created_at`  TIMESTAMP       NULL, 
    PRIMARY KEY (id)
);


-- companies Table Create SQL
CREATE TABLE users
(
    `id`          INT            NOT NULL    AUTO_INCREMENT, 
    `email`       VARCHAR(30)    NULL, 
    `password`    VARCHAR(60)    NULL, 
    `nickname`    VARCHAR(20)    NULL, 
    `created_at`  TIMESTAMP      NULL, 
    PRIMARY KEY (id)
);


-- companies Table Create SQL
CREATE TABLE company_reviews
(
    `id`                  INT              NOT NULL    AUTO_INCREMENT, 
    `title`               VARCHAR(45)      NULL, 
    `rating`              DECIMAL(2, 0)    NULL, 
    `advantages_content`  VARCHAR(500)     NULL, 
    `weakness_content`    VARCHAR(500)     NULL, 
    `created_at`          TIMESTAMP        NULL, 
    `user_id`             INT              NULL, 
    `company_id`          INT              NULL, 
    PRIMARY KEY (id)
);

ALTER TABLE company_reviews
    ADD CONSTRAINT FK_company_reviews_user_id_users_id FOREIGN KEY (user_id)
        REFERENCES users (id) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE company_reviews
    ADD CONSTRAINT FK_company_reviews_company_id_companies_id FOREIGN KEY (company_id)
        REFERENCES companies (id) ON DELETE RESTRICT ON UPDATE RESTRICT;


-- companies Table Create SQL
CREATE TABLE itemized_rating
(
    `id`                 INT              NOT NULL    AUTO_INCREMENT, 
    `a_rating`           DECIMAL(2, 0)    NULL, 
    `b_rating`           DECIMAL(2, 0)    NULL, 
    `c_rating`           DECIMAL(2, 0)    NULL, 
    `d_rating`           DECIMAL(2, 0)    NULL, 
    `e_rating`           DECIMAL(2, 0)    NULL, 
    `company_review_id`  INT              NULL, 
    PRIMARY KEY (id)
);

ALTER TABLE itemized_rating
    ADD CONSTRAINT FK_itemized_rating_company_review_id_company_reviews_id FOREIGN KEY (company_review_id)
        REFERENCES company_reviews (id) ON DELETE RESTRICT ON UPDATE RESTRICT;


-- companies Table Create SQL
CREATE TABLE company_detail
(
    `id`           INT             NOT NULL    AUTO_INCREMENT, 
    `site_url`     VARCHAR(200)    NULL, 
    `location`     VARCHAR(45)     NULL, 
    `curriculum`   VARCHAR(50)     NULL, 
    `description`  VARCHAR(500)    NULL, 
    `cost`         VARCHAR(45)     NULL, 
    `period`       VARCHAR(45)     NULL, 
    `week`         VARCHAR(45)     NULL, 
    `company_id`   INT             NULL, 
    `created_at`   TIMESTAMP       NULL, 
    PRIMARY KEY (id)
);

ALTER TABLE company_detail
    ADD CONSTRAINT FK_company_detail_company_id_companies_id FOREIGN KEY (company_id)
        REFERENCES companies (id) ON DELETE RESTRICT ON UPDATE RESTRICT;


