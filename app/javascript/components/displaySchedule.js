



const displayScheduler = () => {

function displaySchedule() {
    const mondaySquares = document.getElementById("monday-squares").querySelectorAll("button");
    const tuesdaySquares = document.getElementById("tuesday-squares").querySelectorAll("button");
    const wednesdaySquares = document.getElementById("wednesday-squares").querySelectorAll("button");
    const thursdaySquares = document.getElementById("thursday-squares").querySelectorAll("button");
    const fridaySquares = document.getElementById("friday-squares").querySelectorAll("button");
    const saturdaySquares = document.getElementById("saturday-squares").querySelectorAll("button");
    const sundaySquares = document.getElementById("sunday-squares").querySelectorAll("button");
    
      
      function grayMondaySquareMaker(number) {
         mondaySquares[number-1].classList.remove("view-only-green")
      }
    
      function grayTuesdaySquareMaker(number) {
         tuesdaySquares[number-1].classList.remove("view-only-green")
      }
    
      function grayWednesdaySquareMaker(number) {
         wednesdaySquares[number-1].classList.remove("view-only-green")
      }
    
      function grayThursdaySquareMaker(number) {
         thursdaySquares[number-1].classList.remove("view-only-green")
      }
    
      function grayFridaySquareMaker(number) {
         fridaySquares[number-1].classList.remove("view-only-green")
      }
    
      function graySaturdaySquareMaker(number) {
         saturdaySquares[number-1].classList.remove("view-only-green")
      }
    
      function graySundaySquareMaker(number) {
         sundaySquares[number-1].classList.remove("view-only-green")
      }


//reformats monday data for iteration


  if (monday_start_show == "2000-01-01 08:00:00 UTC") {
    monday_start_show = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
  } else if (monday_start_show == "2000-01-01 09:00:00 UTC") {
    monday_start_show = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
  } else if (monday_start_show == "2000-01-01 10:00:00 UTC") {
    monday_start_show = [3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
  } else if (monday_start_show == "2000-01-01 11:00:00 UTC") {
    monday_start_show = [4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
  } else if (monday_start_show == "2000-01-01 12:00:00 UTC") {
    monday_start_show = [5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
  } else if (monday_start_show == "2000-01-01 13:00:00 UTC") {
    monday_start_show = [6, 7, 8, 9, 10, 11, 12, 13, 14]
  } else if (monday_start_show == "2000-01-01 14:00:00 UTC") {
    monday_start_show = [7, 8, 9, 10, 11, 12, 13, 14]
  } else if (monday_start_show == "2000-01-01 15:00:00 UTC") {
    monday_start_show = [8, 9, 10, 11, 12, 13, 14]
  } else if (monday_start_show == "2000-01-01 16:00:00 UTC") {
    monday_start_show = [9, 10, 11, 12, 13, 14]
  } else if (monday_start_show == "2000-01-01 17:00:00 UTC") {
    monday_start_show = [10, 11, 12, 13, 14]
  } else if (monday_start_show == "2000-01-01 18:00:00 UTC") {
    monday_start_show = [11, 12, 13, 14]
  } else if (monday_start_show == "2000-01-01 19:00:00 UTC") {
    monday_start_show = [12, 13, 14]
  } else if (monday_start_show == "2000-01-01 20:00:00 UTC") {
    monday_start_show = [13, 14]
  } else if (monday_start_show == "2000-01-01 21:00:00 UTC") {
    monday_start_show = [14]
  }

  if (monday_end_show == "2000-01-01 21:00:00 UTC") {
      monday_end_show = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
    } else if (monday_end_show == "2000-01-01 20:00:00 UTC") {
      monday_end_show = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
    } else if (monday_end_show == "2000-01-01 19:00:00 UTC") {
      monday_end_show = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
    } else if (monday_end_show == "2000-01-01 18:00:00 UTC") {
      monday_end_show = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
    } else if (monday_end_show == "2000-01-01 17:00:00 UTC") {
      monday_end_show = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    } else if (monday_end_show == "2000-01-01 16:00:00 UTC") {
      monday_end_show = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    } else if (monday_end_show == "2000-01-01 15:00:00 UTC") {
      monday_end_show = [1, 2, 3, 4, 5, 6, 7, 8]
    } else if (monday_end_show == "2000-01-01 14:00:00 UTC") {
      monday_end_show = [1, 2, 3, 4, 5, 6, 7]
    } else if (monday_end_show == "2000-01-01 13:00:00 UTC") {
      monday_end_show = [1, 2, 3, 4, 5, 6]
    } else if (monday_end_show == "2000-01-01 12:00:00 UTC") {
      monday_end_show = [1, 2, 3, 4, 5]
    } else if (monday_end_show == "2000-01-01 11:00:00 UTC") {
      monday_end_show = [1, 2, 3, 4]
    } else if (monday_end_show == "2000-01-01 10:00:00 UTC") {
      monday_end_show = [1, 2, 3]
    } else if (monday_end_show == "2000-01-01 09:00:00 UTC") {
      monday_end_show = [1, 2]
    } else if (monday_end_show == "2000-01-01 08:00:00 UTC") {
      monday_end_show = [1]
    }
    

//reformats tuesday data for iteration
 if (tuesday_start_show == "2000-01-01 08:00:00 UTC") {
    tuesday_start_show = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
  } else if (tuesday_start_show == "2000-01-01 09:00:00 UTC") {
    tuesday_start_show = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
  } else if (tuesday_start_show == "2000-01-01 10:00:00 UTC") {
    tuesday_start_show = [3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
  } else if (tuesday_start_show == "2000-01-01 11:00:00 UTC") {
    tuesday_start_show = [4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
  } else if (tuesday_start_show == "2000-01-01 12:00:00 UTC") {
    tuesday_start_show = [5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
  } else if (tuesday_start_show == "2000-01-01 13:00:00 UTC") {
    tuesday_start_show = [6, 7, 8, 9, 10, 11, 12, 13, 14]
  } else if (tuesday_start_show == "2000-01-01 14:00:00 UTC") {
    tuesday_start_show = [7, 8, 9, 10, 11, 12, 13, 14]
  } else if (tuesday_start_show == "2000-01-01 15:00:00 UTC") {
    tuesday_start_show = [8, 9, 10, 11, 12, 13, 14]
  } else if (tuesday_start_show == "2000-01-01 16:00:00 UTC") {
    tuesday_start_show = [9, 10, 11, 12, 13, 14]
  } else if (tuesday_start_show == "2000-01-01 17:00:00 UTC") {
    tuesday_start_show = [10, 11, 12, 13, 14]
  } else if (tuesday_start_show == "2000-01-01 18:00:00 UTC") {
    tuesday_start_show = [11, 12, 13, 14]
  } else if (tuesday_start_show == "2000-01-01 19:00:00 UTC") {
    tuesday_start_show = [12, 13, 14]
  } else if (tuesday_start_show == "2000-01-01 20:00:00 UTC") {
    tuesday_start_show = [13, 14]
  } else if (tuesday_start_show == "2000-01-01 21:00:00 UTC") {
    tuesday_start_show = [14]
  }

  if (tuesday_end_show == "2000-01-01 21:00:00 UTC") {
    tuesday_end_show = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
  } else if (tuesday_end_show == "2000-01-01 20:00:00 UTC") {
    tuesday_end_show = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
  } else if (tuesday_end_show == "2000-01-01 19:00:00 UTC") {
    tuesday_end_show = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
  } else if (tuesday_end_show == "2000-01-01 18:00:00 UTC") {
    tuesday_end_show = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
  } else if (tuesday_end_show == "2000-01-01 17:00:00 UTC") {
    tuesday_end_show = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  } else if (tuesday_end_show == "2000-01-01 16:00:00 UTC") {
    tuesday_end_show = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  } else if (tuesday_end_show == "2000-01-01 15:00:00 UTC") {
    tuesday_end_show = [1, 2, 3, 4, 5, 6, 7, 8]
  } else if (tuesday_end_show == "2000-01-01 14:00:00 UTC") {
    tuesday_end_show = [1, 2, 3, 4, 5, 6, 7]
  } else if (tuesday_end_show == "2000-01-01 13:00:00 UTC") {
    tuesday_end_show = [1, 2, 3, 4, 5, 6]
  } else if (tuesday_end_show == "2000-01-01 12:00:00 UTC") {
    tuesday_end_show = [1, 2, 3, 4, 5]
  } else if (tuesday_end_show == "2000-01-01 11:00:00 UTC") {
    tuesday_end_show = [1, 2, 3, 4]
  } else if (tuesday_end_show == "2000-01-01 10:00:00 UTC") {
    tuesday_end_show = [1, 2, 3]
  } else if (tuesday_end_show == "2000-01-01 09:00:00 UTC") {
    tuesday_end_show = [1, 2]
  } else if (tuesday_end_show == "2000-01-01 08:00:00 UTC") {
    tuesday_end_show = [1]
  }

  //reformats wednesday data for iteration
  if (wednesday_start_show == "2000-01-01 08:00:00 UTC") {
    wednesday_start_show = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
  } else if (wednesday_start_show == "2000-01-01 09:00:00 UTC") {
    wednesday_start_show = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
  } else if (wednesday_start_show == "2000-01-01 10:00:00 UTC") {
    wednesday_start_show = [3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
  } else if (wednesday_start_show == "2000-01-01 11:00:00 UTC") {
    wednesday_start_show = [4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
  } else if (wednesday_start_show == "2000-01-01 12:00:00 UTC") {
    wednesday_start_show = [5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
  } else if (wednesday_start_show == "2000-01-01 13:00:00 UTC") {
    wednesday_start_show = [6, 7, 8, 9, 10, 11, 12, 13, 14]
  } else if (wednesday_start_show == "2000-01-01 14:00:00 UTC") {
    wednesday_start_show = [7, 8, 9, 10, 11, 12, 13, 14]
  } else if (wednesday_start_show == "2000-01-01 15:00:00 UTC") {
    wednesday_start_show = [8, 9, 10, 11, 12, 13, 14]
  } else if (wednesday_start_show == "2000-01-01 16:00:00 UTC") {
    wednesday_start_show = [9, 10, 11, 12, 13, 14]
  } else if (wednesday_start_show == "2000-01-01 17:00:00 UTC") {
    wednesday_start_show = [10, 11, 12, 13, 14]
  } else if (wednesday_start_show == "2000-01-01 18:00:00 UTC") {
    wednesday_start_show = [11, 12, 13, 14]
  } else if (wednesday_start_show == "2000-01-01 19:00:00 UTC") {
    wednesday_start_show = [12, 13, 14]
  } else if (wednesday_start_show == "2000-01-01 20:00:00 UTC") {
    wednesday_start_show = [13, 14]
  } else if (wednesday_start_show == "2000-01-01 21:00:00 UTC") {
    wednesday_start_show = [14]
  }

  if (wednesday_end_show == "2000-01-01 21:00:00 UTC") {
    wednesday_end_show = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
  } else if (wednesday_end_show == "2000-01-01 20:00:00 UTC") {
    wednesday_end_show = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
  } else if (wednesday_end_show == "2000-01-01 19:00:00 UTC") {
    wednesday_end_show = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
  } else if (wednesday_end_show == "2000-01-01 18:00:00 UTC") {
    wednesday_end_show = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
  } else if (wednesday_end_show == "2000-01-01 17:00:00 UTC") {
    wednesday_end_show = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  } else if (wednesday_end_show == "2000-01-01 16:00:00 UTC") {
    wednesday_end_show = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  } else if (wednesday_end_show == "2000-01-01 15:00:00 UTC") {
    wednesday_end_show = [1, 2, 3, 4, 5, 6, 7, 8]
  } else if (wednesday_end_show == "2000-01-01 14:00:00 UTC") {
    wednesday_end_show = [1, 2, 3, 4, 5, 6, 7]
  } else if (wednesday_end_show == "2000-01-01 13:00:00 UTC") {
    wednesday_end_show = [1, 2, 3, 4, 5, 6]
  } else if (wednesday_end_show == "2000-01-01 12:00:00 UTC") {
    wednesday_end_show = [1, 2, 3, 4, 5]
  } else if (wednesday_end_show == "2000-01-01 11:00:00 UTC") {
    wednesday_end_show = [1, 2, 3, 4]
  } else if (wednesday_end_show == "2000-01-01 10:00:00 UTC") {
    wednesday_end_show = [1, 2, 3]
  } else if (wednesday_end_show == "2000-01-01 09:00:00 UTC") {
    wednesday_end_show = [1, 2]
  } else if (wednesday_end_show == "2000-01-01 08:00:00 UTC") {
    wednesday_end_show = [1]
  }
  

  //reformats thursday data for iteration
  if (thursday_start_show == "2000-01-01 08:00:00 UTC") {
    thursday_start_show = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
  } else if (thursday_start_show == "2000-01-01 09:00:00 UTC") {
    thursday_start_show = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
  } else if (thursday_start_show == "2000-01-01 10:00:00 UTC") {
    thursday_start_show = [3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
  } else if (thursday_start_show == "2000-01-01 11:00:00 UTC") {
    thursday_start_show = [4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
  } else if (thursday_start_show == "2000-01-01 12:00:00 UTC") {
    thursday_start_show = [5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
  } else if (thursday_start_show == "2000-01-01 13:00:00 UTC") {
    thursday_start_show = [6, 7, 8, 9, 10, 11, 12, 13, 14]
  } else if (thursday_start_show == "2000-01-01 14:00:00 UTC") {
    thursday_start_show = [7, 8, 9, 10, 11, 12, 13, 14]
  } else if (thursday_start_show == "2000-01-01 15:00:00 UTC") {
    thursday_start_show = [8, 9, 10, 11, 12, 13, 14]
  } else if (thursday_start_show == "2000-01-01 16:00:00 UTC") {
    thursday_start_show = [9, 10, 11, 12, 13, 14]
  } else if (thursday_start_show == "2000-01-01 17:00:00 UTC") {
    thursday_start_show = [10, 11, 12, 13, 14]
  } else if (thursday_start_show == "2000-01-01 18:00:00 UTC") {
    thursday_start_show = [11, 12, 13, 14]
  } else if (thursday_start_show == "2000-01-01 19:00:00 UTC") {
    thursday_start_show = [12, 13, 14]
  } else if (thursday_start_show == "2000-01-01 20:00:00 UTC") {
    thursday_start_show = [13, 14]
  } else if (thursday_start_show == "2000-01-01 21:00:00 UTC") {
    thursday_start_show = [14]
  }

  if (thursday_end_show == "2000-01-01 21:00:00 UTC") {
    thursday_end_show = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
  } else if (thursday_end_show == "2000-01-01 20:00:00 UTC") {
    thursday_end_show = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
  } else if (thursday_end_show == "2000-01-01 19:00:00 UTC") {
    thursday_end_show = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
  } else if (thursday_end_show == "2000-01-01 18:00:00 UTC") {
    thursday_end_show = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
  } else if (thursday_end_show == "2000-01-01 17:00:00 UTC") {
    thursday_end_show = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  } else if (thursday_end_show == "2000-01-01 16:00:00 UTC") {
    thursday_end_show = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  } else if (thursday_end_show == "2000-01-01 15:00:00 UTC") {
    thursday_end_show = [1, 2, 3, 4, 5, 6, 7, 8]
  } else if (thursday_end_show == "2000-01-01 14:00:00 UTC") {
    thursday_end_show = [1, 2, 3, 4, 5, 6, 7]
  } else if (thursday_end_show == "2000-01-01 13:00:00 UTC") {
    thursday_end_show = [1, 2, 3, 4, 5, 6]
  } else if (thursday_end_show == "2000-01-01 12:00:00 UTC") {
    thursday_end_show = [1, 2, 3, 4, 5]
  } else if (thursday_end_show == "2000-01-01 11:00:00 UTC") {
    thursday_end_show = [1, 2, 3, 4]
  } else if (thursday_end_show == "2000-01-01 10:00:00 UTC") {
    thursday_end_show = [1, 2, 3]
  } else if (thursday_end_show == "2000-01-01 09:00:00 UTC") {
    thursday_end_show = [1, 2]
  } else if (thursday_end_show == "2000-01-01 08:00:00 UTC") {
    thursday_end_show = [1]
  }

  //reformats friday data for iteration
  if (friday_start_show == "2000-01-01 08:00:00 UTC") {
    friday_start_show = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
  } else if (friday_start_show == "2000-01-01 09:00:00 UTC") {
    friday_start_show = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
  } else if (friday_start_show == "2000-01-01 10:00:00 UTC") {
    friday_start_show = [3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
  } else if (friday_start_show == "2000-01-01 11:00:00 UTC") {
    friday_start_show = [4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
  } else if (friday_start_show == "2000-01-01 12:00:00 UTC") {
    friday_start_show = [5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
  } else if (friday_start_show == "2000-01-01 13:00:00 UTC") {
    friday_start_show = [6, 7, 8, 9, 10, 11, 12, 13, 14]
  } else if (friday_start_show == "2000-01-01 14:00:00 UTC") {
    friday_start_show = [7, 8, 9, 10, 11, 12, 13, 14]
  } else if (friday_start_show == "2000-01-01 15:00:00 UTC") {
    friday_start_show = [8, 9, 10, 11, 12, 13, 14]
  } else if (friday_start_show == "2000-01-01 16:00:00 UTC") {
    friday_start_show = [9, 10, 11, 12, 13, 14]
  } else if (friday_start_show == "2000-01-01 17:00:00 UTC") {
    friday_start_show = [10, 11, 12, 13, 14]
  } else if (friday_start_show == "2000-01-01 18:00:00 UTC") {
    friday_start_show = [11, 12, 13, 14]
  } else if (friday_start_show == "2000-01-01 19:00:00 UTC") {
    friday_start_show = [12, 13, 14]
  } else if (friday_start_show == "2000-01-01 20:00:00 UTC") {
    friday_start_show = [13, 14]
  } else if (friday_start_show == "2000-01-01 21:00:00 UTC") {
    friday_start_show = [14]
  }

  if (friday_end_show == "2000-01-01 21:00:00 UTC") {
    friday_end_show = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
  } else if (friday_end_show == "2000-01-01 20:00:00 UTC") {
    friday_end_show = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
  } else if (friday_end_show == "2000-01-01 19:00:00 UTC") {
    friday_end_show = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
  } else if (friday_end_show == "2000-01-01 18:00:00 UTC") {
    friday_end_show = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
  } else if (friday_end_show == "2000-01-01 17:00:00 UTC") {
    friday_end_show = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  } else if (friday_end_show == "2000-01-01 16:00:00 UTC") {
    friday_end_show = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  } else if (friday_end_show == "2000-01-01 15:00:00 UTC") {
    friday_end_show = [1, 2, 3, 4, 5, 6, 7, 8]
  } else if (friday_end_show == "2000-01-01 14:00:00 UTC") {
    friday_end_show = [1, 2, 3, 4, 5, 6, 7]
  } else if (friday_end_show == "2000-01-01 13:00:00 UTC") {
    friday_end_show = [1, 2, 3, 4, 5, 6]
  } else if (friday_end_show == "2000-01-01 12:00:00 UTC") {
    friday_end_show = [1, 2, 3, 4, 5]
  } else if (friday_end_show == "2000-01-01 11:00:00 UTC") {
    friday_end_show = [1, 2, 3, 4]
  } else if (friday_end_show == "2000-01-01 10:00:00 UTC") {
    friday_end_show = [1, 2, 3]
  } else if (friday_end_show == "2000-01-01 09:00:00 UTC") {
    friday_end_show = [1, 2]
  } else if (friday_end_show == "2000-01-01 08:00:00 UTC") {
    friday_end_show = [1]
  }

  //reformats saturday data for iteration
  if (saturday_start_show == "2000-01-01 08:00:00 UTC") {
    saturday_start_show = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
  } else if (saturday_start_show == "2000-01-01 09:00:00 UTC") {
    saturday_start_show = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
  } else if (saturday_start_show == "2000-01-01 10:00:00 UTC") {
    saturday_start_show = [3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
  } else if (saturday_start_show == "2000-01-01 11:00:00 UTC") {
    saturday_start_show = [4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
  } else if (saturday_start_show == "2000-01-01 12:00:00 UTC") {
    saturday_start_show = [5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
  } else if (saturday_start_show == "2000-01-01 13:00:00 UTC") {
    saturday_start_show = [6, 7, 8, 9, 10, 11, 12, 13, 14]
  } else if (saturday_start_show == "2000-01-01 14:00:00 UTC") {
    saturday_start_show = [7, 8, 9, 10, 11, 12, 13, 14]
  } else if (saturday_start_show == "2000-01-01 15:00:00 UTC") {
    saturday_start_show = [8, 9, 10, 11, 12, 13, 14]
  } else if (saturday_start_show == "2000-01-01 16:00:00 UTC") {
    saturday_start_show = [9, 10, 11, 12, 13, 14]
  } else if (saturday_start_show == "2000-01-01 17:00:00 UTC") {
    saturday_start_show = [10, 11, 12, 13, 14]
  } else if (saturday_start_show == "2000-01-01 18:00:00 UTC") {
    saturday_start_show = [11, 12, 13, 14]
  } else if (saturday_start_show == "2000-01-01 19:00:00 UTC") {
    saturday_start_show = [12, 13, 14]
  } else if (saturday_start_show == "2000-01-01 20:00:00 UTC") {
    saturday_start_show = [13, 14]
  } else if (saturday_start_show == "2000-01-01 21:00:00 UTC") {
    saturday_start_show = [14]
  }

  if (saturday_end_show == "2000-01-01 21:00:00 UTC") {
    saturday_end_show = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
  } else if (saturday_end_show == "2000-01-01 20:00:00 UTC") {
    saturday_end_show = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
  } else if (saturday_end_show == "2000-01-01 19:00:00 UTC") {
    saturday_end_show = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
  } else if (saturday_end_show == "2000-01-01 18:00:00 UTC") {
    saturday_end_show = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
  } else if (saturday_end_show == "2000-01-01 17:00:00 UTC") {
    saturday_end_show = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  } else if (saturday_end_show == "2000-01-01 16:00:00 UTC") {
    saturday_end_show = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  } else if (saturday_end_show == "2000-01-01 15:00:00 UTC") {
    saturday_end_show = [1, 2, 3, 4, 5, 6, 7, 8]
  } else if (saturday_end_show == "2000-01-01 14:00:00 UTC") {
    saturday_end_show = [1, 2, 3, 4, 5, 6, 7]
  } else if (saturday_end_show == "2000-01-01 13:00:00 UTC") {
    saturday_end_show = [1, 2, 3, 4, 5, 6]
  } else if (saturday_end_show == "2000-01-01 12:00:00 UTC") {
    saturday_end_show = [1, 2, 3, 4, 5]
  } else if (saturday_end_show == "2000-01-01 11:00:00 UTC") {
    saturday_end_show = [1, 2, 3, 4]
  } else if (saturday_end_show == "2000-01-01 10:00:00 UTC") {
    saturday_end_show = [1, 2, 3]
  } else if (saturday_end_show == "2000-01-01 09:00:00 UTC") {
    saturday_end_show = [1, 2]
  } else if (saturday_end_show == "2000-01-01 08:00:00 UTC") {
    saturday_end_show = [1]
  }

  //reformats sunday data for iteration
  if (sunday_start_show == "2000-01-01 08:00:00 UTC") {
    sunday_start_show = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
  } else if (sunday_start_show == "2000-01-01 09:00:00 UTC") {
    sunday_start_show = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
  } else if (sunday_start_show == "2000-01-01 10:00:00 UTC") {
    sunday_start_show = [3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
  } else if (sunday_start_show == "2000-01-01 11:00:00 UTC") {
    sunday_start_show = [4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
  } else if (sunday_start_show == "2000-01-01 12:00:00 UTC") {
    sunday_start_show = [5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
  } else if (sunday_start_show == "2000-01-01 13:00:00 UTC") {
    sunday_start_show = [6, 7, 8, 9, 10, 11, 12, 13, 14]
  } else if (sunday_start_show == "2000-01-01 14:00:00 UTC") {
    sunday_start_show = [7, 8, 9, 10, 11, 12, 13, 14]
  } else if (sunday_start_show == "2000-01-01 15:00:00 UTC") {
    sunday_start_show = [8, 9, 10, 11, 12, 13, 14]
  } else if (sunday_start_show == "2000-01-01 16:00:00 UTC") {
    sunday_start_show = [9, 10, 11, 12, 13, 14]
  } else if (sunday_start_show == "2000-01-01 17:00:00 UTC") {
    sunday_start_show = [10, 11, 12, 13, 14]
  } else if (sunday_start_show == "2000-01-01 18:00:00 UTC") {
    sunday_start_show = [11, 12, 13, 14]
  } else if (sunday_start_show == "2000-01-01 19:00:00 UTC") {
    sunday_start_show = [12, 13, 14]
  } else if (sunday_start_show == "2000-01-01 20:00:00 UTC") {
    sunday_start_show = [13, 14]
  } else if (sunday_start_show == "2000-01-01 21:00:00 UTC") {
    sunday_start_show = [14]
  }

  if (sunday_end_show == "2000-01-01 21:00:00 UTC") {
    sunday_end_show = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
  } else if (sunday_end_show == "2000-01-01 20:00:00 UTC") {
    sunday_end_show = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
  } else if (sunday_end_show == "2000-01-01 19:00:00 UTC") {
    sunday_end_show = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
  } else if (sunday_end_show == "2000-01-01 18:00:00 UTC") {
    sunday_end_show = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
  } else if (sunday_end_show == "2000-01-01 17:00:00 UTC") {
    sunday_end_show = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  } else if (sunday_end_show == "2000-01-01 16:00:00 UTC") {
    sunday_end_show = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  } else if (sunday_end_show == "2000-01-01 15:00:00 UTC") {
    sunday_end_show = [1, 2, 3, 4, 5, 6, 7, 8]
  } else if (sunday_end_show == "2000-01-01 14:00:00 UTC") {
    sunday_end_show = [1, 2, 3, 4, 5, 6, 7]
  } else if (sunday_end_show == "2000-01-01 13:00:00 UTC") {
    sunday_end_show = [1, 2, 3, 4, 5, 6]
  } else if (sunday_end_show == "2000-01-01 12:00:00 UTC") {
    sunday_end_show = [1, 2, 3, 4, 5]
  } else if (sunday_end_show == "2000-01-01 11:00:00 UTC") {
    sunday_end_show = [1, 2, 3, 4]
  } else if (sunday_end_show == "2000-01-01 10:00:00 UTC") {
    sunday_end_show = [1, 2, 3]
  } else if (sunday_end_show == "2000-01-01 09:00:00 UTC") {
    sunday_end_show = [1, 2]
  } else if (sunday_end_show == "2000-01-01 08:00:00 UTC") {
    sunday_end_show = [1]
  }

  const grayMonday1 = monday_start_show.filter(val => !monday_end_show.includes(val));
  const grayMonday2 = monday_end_show.filter(val => !monday_start_show.includes(val));
  const grayMonday = grayMonday2.concat(grayMonday1);

  const grayTuesday1 = tuesday_start_show.filter(val => !tuesday_end_show.includes(val));
  const grayTuesday2 = tuesday_end_show.filter(val => !tuesday_start_show.includes(val));
  const grayTuesday = grayTuesday2.concat(grayTuesday1);

  const grayWednesday1 = wednesday_start_show.filter(val => !wednesday_end_show.includes(val));
  const grayWednesday2 = wednesday_end_show.filter(val => !wednesday_start_show.includes(val));
  const grayWednesday = grayWednesday2.concat(grayWednesday1);

  const grayThursday1 = thursday_start_show.filter(val => !thursday_end_show.includes(val));
  const grayThursday2 = thursday_end_show.filter(val => !thursday_start_show.includes(val));
  const grayThursday = grayThursday2.concat(grayThursday1);

  const grayFriday1 = friday_start_show.filter(val => !friday_end_show.includes(val));
  const grayFriday2 = friday_end_show.filter(val => !friday_start_show.includes(val));
  const grayFriday = grayFriday2.concat(grayFriday1);

  const graySaturday1 = saturday_start_show.filter(val => !saturday_end_show.includes(val));
  const graySaturday2 = saturday_end_show.filter(val => !saturday_start_show.includes(val));
  const graySaturday = graySaturday2.concat(graySaturday1);

  const graySunday1 = sunday_start_show.filter(val => !sunday_end_show.includes(val));
  const graySunday2 = sunday_end_show.filter(val => !sunday_start_show.includes(val));
  const graySunday = graySunday2.concat(graySunday1);


  grayMonday.forEach(grayMondaySquareMaker);
  grayTuesday.forEach(grayTuesdaySquareMaker);
  grayWednesday.forEach(grayWednesdaySquareMaker);
  grayThursday.forEach(grayThursdaySquareMaker);
  grayFriday.forEach(grayFridaySquareMaker);
  graySaturday.forEach(graySaturdaySquareMaker);
  graySunday.forEach(graySundaySquareMaker);


}

}


export {displayScheduler};