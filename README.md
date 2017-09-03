#  Agile Model Driven Development (AMDD) approach

http://agiledata.org/essays/agileDataModeling.html

#### Critical Lessons in Agile Data Modeling
1. Agile data modelers travel light and create agile models which are just barely good enough.
2. Agile data models are just barely good enough. Agile developers solve today's problem today and trust that they can solve tomorrow's problem tomorrow.
3. Agile data modeling is both evolutionary and collaborative.
4. You can be agile yet still support the needs of the enterprise.  You can think about the future, and act on it, in a very agile manner if you choose to. 
5. Agile data models can and should follow your corporate standards.  In fact, following modeling standards is an AM practice. Your standards should be straightforward, simple, and sufficiently described so that the team can learn and then follow them. Critical data modeling standards focus on naming conventions and conventions for writing stored procedures.
6. Trying to define all the requirements up front is a risky proposition.  Requirements change over time, so embrace this concept and adopt techniques which allow you to react effectively. 
7. Shared whiteboard space which is owned by the team can significant enhance communication and productivity. The DDJ 2008 Modeling and Documentation survey found that sketching was the most common primary approach to modeling (see Figure 9).
8. You can always learn new skills from someone else. This is one of the many benefits of collaborative development.
9. It isn't enough to specialize in one aspect of technology. Become a generalizing specialist.
10. Embrace "hard" tasks. Many traditionalists think that data migration is hard, and it is, but if you choose to get good at it you'll soon discover that it's not so bad after all. Data migration is an important part of implement most structural database refactorings, and database refactoring is a critical activity which supports evolutionary database development, so you'd better get good at it.


## Iteration 1

There are four user stories to fulfill in this iteration: Maintain student contact information, Enroll student, Drop student, and Record payment. Therefore we need to do the work to implement those four, and only those four requirements. The first iteration of the KSMS physical data model (PDM) supports the critical functionality required to run the dojo - the management of basic student data and collection of money from them. When you take a look at the data model you see that we're not tracking the state/province that a person lives in.  Because we're building for a single dojo, which is nowhere near the border, we can safely assume that everyone lives in the same province.

- Change person to user due to rails ActiveModel behaviour
- Change payment to transactions to be clearer
- **Decimal** data type default scale=0, you need to specific the scale, "rails g [migration/model] TABLE 'column:decimal{precision,scale}'"

```ruby
rails g model Student enroll_date:datetime drop_date:datetime

rails g model User first_name:string last_name:string street:string town:string phone:string

rails g migration AddUserRefToStudents user:references

rails g model Transaction 'amount:decimal{15,5}' payment_date:datetime

rails g migration AddUserRefToTransactions user:references

rails g model TransactionType description:text

rails g migration AddTransactionTypeRefToTransactions transaction_type:references
```


## Iteration 2
There are four user stories to implement during this iteration: Promote student to higher belt, Invite student to grading, Email membership to student, and Print membership for student. This functionality has no significant overlap with the existing data model and as you can see in Figure 3 the changes were fairly straightforward. The Belt table and the Student.BeltOID column were added to support the ability to track which belt a student currently has. We also added the Person.EmailAddress column so we can email membership information to students and the Student.GradingDate column to track the last/next time a student grades for a new belt. 

```ruby
rails g migration AddEmailToUsers email:string

rails g model Belt description:text

rails g migration AddDetailsToStudents grading_date:datetime belt:references
```


## Iteration 3
For this iteration we have three user stories to implement: Schedule gradings, Print certificate, and Put membership on hold. Sometimes students will stop training for awhile, it's quite common for people to go away on vacation during the summer, and the dojo will put their membership on hold so that they're not charged when they're not there. To support this functionality I added the MembershipHold table to keep track of when the membership was on hold, allowing the system to track the number of weeks used from a given membership (memberships are either 3, 6, or 12 months in length). To manage gradings we needed to add two new tables, BeltAttempt which tracks the belt a student is attempting during a given grading and Grading which tracks basic information about the grading. These tables were straight additions to the database schema.

```ruby
rails g model MembershipHold start_date:datetime end_date:datetime

rails g migration AddStudentRefToMembershipHolds student:references

rails g model BeltAttempt pass:boolean

rails g model Grading date:datetime time:time 'cost:decimal{15,5}'

rails g migration AddDetailsToBeltAttempts student:references belt:references grading:references
```


## Iteration 4
For this iteration we have three user stories to implement: Enroll child student, Offer family membership plan, and Support child belt system. Adding support for child memberships was bit of work. Children have a different set of belts than adults do. Children also have striped belts (white with stripe, yellow with stripe, …) in addition to the normal adult colors and two additional colors: red and purple. Kids have more belts in order to keep them engaged. Most adults understand that it could take six to twelve months to earn their next belt but try explaining that to a four year old.  In addition to the application code changes we added an IsChild column to the Belt table as well as new rows for the child belts. We also needed an IsChild column to the Student table as well. People progress from the children to the adult classes when they've reached an appropriate level of maturity and skill, not just because of their age, so a birthdate column wasn't appropriate. To support family memberships we added the Family table to keep track of who was in a given family. We added a corresponding FamilyPOID column in Student to act as a foreign key to the new table. Most students are not on a family membership so this column will often have a null value.

```ruby
```