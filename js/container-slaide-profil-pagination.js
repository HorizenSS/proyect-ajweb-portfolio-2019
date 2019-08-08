// updated 29.06.19

// feel free to like

class Pagination {
    constructor(postsPerPage) {
      this.posts = document.querySelectorAll(".post");
      this.postsAmount = this.posts.length;
      this.postsPerPage = postsPerPage;
      this.pagesAmount = Math.ceil(this.postsAmount / this.postsPerPage);
      this.numbersNode = document.querySelector(".numbers");
      this.paginationNode = document.querySelector(".pagination");
      this.currentPage = 1;
    }
  
    init() {
      if (this.postsPerPage > 0) {
        this.setPaginationNumbers();
        this.markDefaultNumber();
        this.displayNeccessaryPosts();
        this.handlePagination();
      }
      if (!Number.isInteger(this.postsPerPage) || this.postsPerPage <= 0) {
        this.paginationNode.style.display = 'none';
      }
    }
  
    markDefaultNumber() {
      const firstNumber = document.querySelector(".number");
      firstNumber.classList.add("currentNumber");
    }
  
    setPaginationNumbers() {
      for (let i = 0; i < this.pagesAmount; i += 1) {
        const numberNode = document.createElement("div");
        numberNode.innerHTML = i + 1;
        numberNode.classList.add("number");
        this.numbersNode.appendChild(numberNode);
      }
    }
  
    displayNeccessaryPosts() {
      let convertedCurPage = this.currentPage;
      let postEnding = convertedCurPage * this.postsPerPage;
      let postStart = postEnding - this.postsPerPage;
      if (this.currentPage === 1) {
        postEnding = this.postsPerPage;
        postStart = 0;
      }
  
      const isLastPage = this.currentPage === this.pagesAmount;
      this.hidePosts();
  
      if (this.postsPerPage >= this.postsAmount) {
        this.posts.forEach(post => {
          post.style.display = 'block';
        });
        this.paginationNode.style.display = 'none';
        return;
      }
      if (isLastPage) {
        this.posts.forEach((post, i) => {
          if (i >= postStart) {
            post.style.display = 'block';
          }
        });
        return;
      }
  
      this.posts.forEach((post, i) => {
        if (i >= postStart && i < postEnding) {
          post.style.display = "block";
        }
      });
    }
  
    handlePagination() {
      this.paginationNode.addEventListener("click", event => {
        this.handlePrevClick(event);
        this.handleNumberClick(event);
        this.handleNextClick(event);
        this.handlePaginationButtons();
        this.markCurrentNumber();
        this.displayNeccessaryPosts();
      });
    }
  
    handlePrevClick(event) {
      if (event.target.classList.contains("prev")) {
        if (this.currentPage > 1) {
          this.currentPage -= 1;
        }
      }
    }
  
    handleNumberClick(event) {
      if (event.target.classList.contains("number")) {
        let numberNode = event.target;
        let parsedNumber = numberNode.innerText;
        let number = +parsedNumber;
        this.currentPage = number;
      }
    }
  
    handleNextClick(event) {
      if (event.target.classList.contains("next")) {
        if (this.currentPage < this.pagesAmount) {
          this.currentPage += 1;
        }
      }
    }
  
    hidePosts() {
      this.posts.forEach((post, i) => {
        post.style.display = "none";
      });
    }
  
    markCurrentNumber() {
      this.resetNumbersStyle();
      const numbers = document.querySelectorAll(".number");
      const number = numbers[this.currentPage - 1];
      number.classList.add("currentNumber");
    }
  
    resetNumbersStyle() {
      const numbers = document.querySelectorAll(".number");
      numbers.forEach(number => {
        if (number.classList.contains("currentNumber")) {
          number.classList.remove("currentNumber");
        }
      });
    }
  
    handlePaginationButtons() {
      const prevButton = document.querySelector('.prev');
      const nextButton = document.querySelector('.next');
      if (this.currentPage === 1) {
        prevButton.style.visibility = 'hidden';
        nextButton.style.visibility = 'visible';
        return;
      }
      if (this.currentPage === this.pagesAmount) {
        nextButton.style.visibility = 'hidden';
        prevButton.style.visibility = 'visible';
        return;
      }
      prevButton.style.visibility = 'visible';
      nextButton.style.visibility = 'visible';
    }}
  
  
  // pass a number to define how many posts
  // will appear at once
  
  // what will happen if you pass 5?
  
  const pagination = new Pagination(1);
  
  
  pagination.init();