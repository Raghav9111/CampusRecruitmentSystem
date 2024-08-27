class Question{
	constructor(question,option1,option2,option3,option4,correctAnswer){
		this.question = question;
		this.option1 = option1;
		this.option2 = option2;
		this.option3 = option3;
		this.option4 = option4;
		this.correctAnswer = correctAnswer;
	}
}
var question = [];

function generateQuestion(event){
	var ques;
	var opt1;
	var opt2;
	var opt3;
	var opt4;
	var corrAns;

	var parentDiv = document.getElementById("parentDiv");
	
//	var div = parentDiv.querySelectorAll('*');
	for (let j = 0; j < parentDiv.children.length; j++) {
		var c = parentDiv.children[j];
		for(let k=0; k<c.children.length; k++){
			var childDiv = c.children[k];
    		for(let i=0; i<childDiv.children.length; i++){
				var child = childDiv.children[i];
    			// Fetch the value of the child element
    			if(child.className == 'question form-control'){
			 		ques = child.value;
				}
				else if(child.className == 'option1 form-control'){
					opt1 = child.value;
				}
				else if(child.className == 'option2 form-control'){
					opt2 = child.value;
				}
				else if(child.className == 'option3 form-control'){
					opt3 = child.value;
				}
				else if(child.className == 'option4 form-control'){
					opt4 = child.value;
				}
				else if(child.className == 'corrAns form-control'){
					if(child.value == 'Option 1'){
						corrAns = opt1;
					}
					else if(child.value == 'Option 2'){
						corrAns = opt2;
					}
					else if(child.value == 'Option 3'){
						corrAns = opt3;
					}	
					else if(child.value == 'Option 4'){
						corrAns = opt4;
					}	
				}
			}
			var quest = new Question(ques,opt1,opt2,opt3,opt4,corrAns)
			question.push(quest);
		}
		
    }
    console.log(question)
    //event.preventDefault();
    var qData = JSON.stringify(question)
    
    document.getElementById('storeData').value = qData
}
