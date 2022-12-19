# CONTRIBUTING

Firstly, Thanks for consideration contributing to the project. Here is where we keep film cameras alive by empowering everyone with the power to process film themselves.  

We are mainly looking for the following contribution: 
1.	Working on the issue tracker 
2.	Testing and reporting of a derived setup 
3.	Optimization  
4.	improve documentation

## Basic Rules: 

We have a few basic rules that every contributor should follow in order to keep the progress observable and reduce confusion.

Firstly, always check the issue tracker first. 

For any new version, changes and reports, please include the hardware and software environment you are testing with. Because this project has both hardware and software component, the quality of component could also affect the performance or cause unintended bug that is unique to your setup. Reporting your hardware setup allow other contributor with the same hardware archetype to check your works and verify if the bugs is due to the resources shared here or due to a mistake in your implementation. 

If your work is purely software, you should fork the repository in the hardware setup you are using, make changes in your own fork, and then submit a pull request.  All new code should have been tested with the entire system and make sure it doesn’t cause malfunction to existing codes.  

If your work required a change in the hardware, please detail the process and you take to modify the hardware setup, so other contributors could reproduce your setup. Think of it like a scientific experiment report, you should include all the details that allow somebody with no knowledge to reproduce your system. 

### Coding style:
Include a description of your code in the beginning. The description should describe what is the purpose of your code and what you are trying to do, not how you are doing it. This may also help other to improve your code by submitting an optimised method to do your objective.  It is important to solve the actual problem and avoid the XY problem. 

List the inputs and outputs of your codes, your codes should be a like a black box, you feed in some inputs, then it does something and, give an output that is different from the inputs. It is ideal that you write down what you are doing in your codes may it be a new feature or a new improvement, you should mark down what your code do. Think of commenting your codes as if it is a pseudo-code, so people can observe what you are thinking, and what your code does, and then how your code work.

For hardware designs, please follow the filename and coding convention for the CAD model. If your part replaces a previous part, you should use the same name as the original, and only append a variation code at the end of the file. 

### Quality assurance: 
Our project is like the Arduino project. You can make modification to the hardware or make your own library for the software. However, we can only official approved a hardware setup if it has been stressed tested with processing film rolls by our facility. Any self-made system using the information found on this repository doesn’t guarantee the quality of the setup thus FND is not responsible for any issue occurred in a system that is not official approved by us.  You are free to get your own design/modification to be certified by your local authority regarding the products. If you had gotten your configuration certificated according to the relevant standards, you can share the relevant documents and let people knows about it. 


### Rules of thumb:
*	Check issue tracker for any task to do
*	provided information enough for other to reproduce and test your setup or changes. 
*	Make sure your progress is readable and accessible for others 
*	Quality assurance is the self-responsible of the marker and not a collective whole of all contributor in this community 

## Working on the issue tracker 
It is important that you check the issue tracker for the past, current and planned development. You can also suggest new features to be added for both the hardware and software.

The issue tracker also allows you to viewer who are the other contributors working on the issue that interested you, or you are planning to do. You could also begin a planned feature that somehow nobody is working on now.  Think of the issue tracker is the quest board for adventurers, not only you can get a good view of what jobs are out there, you could also use it to form group of likeminded people to work on the same problem. 

The past development listed are mainly for contributor that found a bug or want to make a improvement to existing feature such as code optimization or expand the hardware/software compatibility with a derived setup. Details of derived setup and optimization will be provided in a later section. Here, we just want to let you know that any changes to an existing feature required a reopening of the original tasks and then the new progress to be appended.  This process will turn the past development into either a current or planned development. 

## Derived Setup
Derived setup are system that setup differently from the original branch which had been tested and verified with film developing process. Derived system could occur when one want to replace their valves or electronics with a locally sorted one, or a cheper alterntives that should be within the absolute specification. Dervied system could also be the WIP/modified system that contributors are intended to further develop an aspect of the system.

## Optimsation


## documentation

We are still very early in our project, so we haven't really put our the words together neatly. Also, we are not very expereienced in using the github documentation, so It would be useful if somebody could start linking the pages to different part of the repository or making the format more readable. If you are fixing somebody else documentation, please verify the original intention of the original contributor, because if you are not clear about the instruction, it is a proof that the documentaion need imrpovement for more people to understand. the general procedure would be as follow:
1. mark down what are the areas of the documentation you think could be improve or incorrect
2. contact the original contributor and verify the intention
3. submit an editied version of the message and let the original contributor + another one for review
4. if everyone happy with the changes, publish the new version 

I think we should follow the a similar approach as wikipedia. 
