//
//  FAQsFormViewController.swift
//  ValleyProHealth
//
//  Created by Brice Webster on 9/21/16.
//  Copyright © 2016 Valley Professionals Community Health Center. All rights reserved.
//

import UIKit

class FAQsFormViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Outlets -
    // MARK: Buttons
    @IBOutlet weak var cancelButton: UIButton!
    // MARK: Labels
    @IBOutlet weak var categoryLabel: UILabel!
    // MARK: Table Views
    @IBOutlet weak var faqsTable: UITableView!
   
    // MARK: - Global Variables -
    // MARK: Arrays
    let billQuestions = [
        NSLocalizedString("What types of insurance do you accept?", comment: "A billing question in the faq section"),
        NSLocalizedString("Can I be seen by a provider even if I do not have health insurance?", comment: "A billing question in the faq section"),
        NSLocalizedString("Can Valley Professionals help me enroll in health insurance coverage?", comment: "A billing question in the faq section"),
        NSLocalizedString("What do I need to bring to apply for sliding fee scale?", comment: "A billing question in the faq section"),
        NSLocalizedString("What if I am unable to pay my bill?", comment: "A billing question in the faq section"),
        NSLocalizedString("What if I have other questions about billing?", comment: "A billing question in the faq section")]
    let billAnswers = [
        NSLocalizedString("We accept all commercial insurance carriers, Medicare, and Medicaid.", comment: "A billing answer in the faq section"),
        NSLocalizedString("Yes, Valley Professionals accepts self-pay, and also has a sliding-fee scale for eligible individuals.", comment: "A billing answer in the faq section"),
        NSLocalizedString("Yes, our Community Health Workers are specially trained to help individuals find affordable health coverage. To make an appointment, contact the Valley Professionals Community Health Center nearest you.", comment: "A billing answer in the faq section"),
        NSLocalizedString("To apply for sliding fee scale, patients and their families must provide the following documents to verify gross income: Most recent tax filing with the IRS and/or W2\'s from employer(s), A copy of Social Security or Disability Award Letter(s) or unemployment statement(s),Pay stubs from all employerers for the last 30-day period, If unemployed, no income, and living with others, we require a signed and dated letter from the person providing support of the patient, Driver\'s license, Any other income that is direct deposited. For more information on sliding fee scale, visit the patient resources section of this app.", comment: "A billing answer in the faq section"),
        NSLocalizedString("If you unable to pay your bill, feel free to contact our Billing Department at (765) 828–1000 to set up a payment plan that works for you.", comment: "A billing answer in the faq section"),
        NSLocalizedString("For all inquiries regarding billing, please contact our Billing Department at (765) 828–1000.", comment: "A billing answer in the faq section")]
    let miscQuestions = [
        NSLocalizedString("Is Valley Professionals hiring?", comment: "A misc question in the faq section")]
    let miscAnswers = [
        NSLocalizedString("Visit valleyprohealth.org to view current job openings at Valley Professionals. You can get to the site by tapping the website button on the home screen.", comment: "A misc answer in the faq section")]
    let newpatQuestions = [
        NSLocalizedString("Are you accepting new patients?", comment: "A new patient question in the faq section"),
        NSLocalizedString("How soon will I be able to schedule my first appointment?", comment: "A new patient question in the faq section"),
        NSLocalizedString("What do I need to bring to my first appointment?", comment: "A new patient question in the faq section"),
        NSLocalizedString("Can I make an appointment with a Behavioral Health counselor?", comment: "A new patient question in the faq section"),
        NSLocalizedString("Do you offer prenatal services?", comment: "A new patient question in the faq section"),
        NSLocalizedString("Can I call and get information about my spouse/parent/adult/child (18+) or their medical records?", comment: "A new patient question in the faq section"),
        NSLocalizedString("Can anyone else (i.e. grandparent, family friend, or childcare provider) bring my child to his or her appointment?", comment: "A new patient question in the faq section")]
    let newpatAnswers = [
        NSLocalizedString("To find out if one of our locations is accepting new patients please give us a call and we will be glad to assist you. The contact information for all of our clinics is available in the locations section of this app.", comment: "A new patient answer in the faq section"),
        NSLocalizedString("New patient appointments can be scheduled as soon as two weeks. In the mean time we will send you paperwork to be completed and brought in on the day of your appointment.", comment: "A new patient answer in the faq section"),
        NSLocalizedString("For your first appointment, you should bring your completed new patient paperwork, along with your driver\'s license and insurance information. When you arrive, the front office will make a copy of your medical insurance card and verify that your account information is up-to-date. A nurse will complete your medical history after you have been checked in, but please bring any relevant medical information, including all names and dosages of prescriptions and over-the-counter medications that you are currently taking.", comment: "A new patient answer in the faq section"),
        NSLocalizedString("If you are an established patient, speak with your Primary Care Provider about referring you to a Valley Professionals Behavioral Health counselor.", comment: "A new patient answer in the faq section"),
        NSLocalizedString("Prenatal services, as well as, Labor and Delivery are available at our Terre Haute clinic by referral. For more information, or to make an appointment, contact the Valley Professionals Community Health Center nearest you.", comment: "A new patient answer in the faq section"),
        NSLocalizedString("The Health Insurance Portability and Accountability Act (HIPAA) prohibits us from sharing confidential patient health information without written authorization from the patient. If a patient would like to grant you permission to make an appointment for them or to access their medical records they must complete a Release of Information form, available in the forms section of this app.", comment: "A new patient answer in the faq section"),
        NSLocalizedString("Yes, you may grant permission for another person to bring your child to his or her appointment after you have completed and submitted a consent form available in the forms section of this app.", comment: "A new patient answer in the faq section")]
    let servicesQuestion = [
        NSLocalizedString("What can I do if I am unable to pay for my prescription?", comment: "A services question in the faq section"),
        NSLocalizedString("How long will it take for me to receive my prescription refill after I have submitted a request?", comment: "A services question in the faq section"),
        NSLocalizedString("Do I have to be a patient to use the After-Hours Clinic?", comment: "A services question in the faq section"),
        NSLocalizedString("Do I need an appointment for the After-Hours clinic?", comment: "A services question in the faq section"),
        NSLocalizedString("What can I be seen for at the After-Hours clinic?", comment: "A services question in the faq section"),
        NSLocalizedString("When is After-Hours clinic?", comment: "A services question in the faq section"),
        NSLocalizedString("Does the Mobile School-Based Health Center offer school physical examinations?", comment: "A services question in the faq section"),
        NSLocalizedString("What types of services are available on the Mobile School-Based Health Center?", comment: "A services question in the faq section"),
        NSLocalizedString("Who can be seen on the Mobile Health Center?", comment: "A services question in the faq section"),
        NSLocalizedString("What do I need to do for my child to be seen by the MSBHC?", comment: "A services question in the faq section"),
        NSLocalizedString("Does it count against my child\'s attendance when he or she is seen by the MSBHC?", comment: "A services question in the faq section"),
        NSLocalizedString("Does the MSBHC visit my school?", comment: "A services question in the faq section"),
        NSLocalizedString("How do I know when the MSBHC will be at my school?", comment: "A services question in the faq section"),
        NSLocalizedString("Do I have to be a patient to take part in the Diabetic Support Group?", comment: "A services question in the faq section")]
    let servicesAnswers = [
        NSLocalizedString("Valley Professionals has a 403(b) Prescription Assistance Program that can help eligible individuals to afford their medication.", comment: "A services answer in the faq section"),
        NSLocalizedString("Prescription refill requests can take up to 48 hours once submitted.", comment: "A services answer in the faq section"),
        NSLocalizedString("No, you are not required to be a current Valley Professionals patient to utilize the After-Hours services.", comment: "A services answer in the faq section"),
        NSLocalizedString("No, After-Hours office visits are on a first-come, first-served basis.", comment: "A services answer in the faq section"),
        NSLocalizedString("The After-Hours clinic is for acute conditions, such as, fever, vomiting, congestion, sore throat, flu symptoms, cough, rash, earache, or other similar symptoms.", comment: "A services answer in the faq section"),
        NSLocalizedString("The After-Hours clinic takes place Monday through Thursday from 5:00pm to 8:00pm at our Clinton location only.", comment: "A services answer in the faq section"),
        NSLocalizedString("Yes.", comment: "A services answer in the faq section"),
        NSLocalizedString("Visit the MSBHC for: immunizations, school physicals, well child visits, cold, fever, vomiting, congestion, sore throat, flu symptoms, cough, rash, ear ache, and similar symptoms.", comment: "A services answer in the faq section"),
        NSLocalizedString("Students and Employees of a school hosting the Mobile Health Center may be seen. There are certain occasions during school breaks when the Mobile Health Center is open to the community. For more information, or to view the MSBHC\'s schedule, go to the tracker section of the app.", comment: "A services answer in the faq section"),
        NSLocalizedString("To enroll your child in MSBHC services, you must complete and submit the enrollment form found in the forms section. After you have done this, you may call the mobile unit and make an appointment, or your child can simply go to the school nurse and be referred.", comment: "A services answer in the faq section"),
        NSLocalizedString("No, your child\'s visit to the MSBHC will not count against his or her attendance; moreover, if your child is sent home due to illness by an MSBHC provider, this absence would be certified excused.", comment: "A services answer in the faq section"),
        NSLocalizedString("The MSBHC visits schools in the North Vermillion, South Vermillion, Southwest Parke, and North Central Parke school corporations.", comment: "A services answer in the faq section"),
        NSLocalizedString("You can find a schedule for the MSBHC in the tracker section of this app.", comment: "A services answer in the faq section"),
        NSLocalizedString("No, you do not have to register, make an appointment, or even be a patient of Valley Professionals to take part in the Diabetic Support Group.", comment: "A services answer in the faq section")]
    var answersList = [String]()
    var dataSegue = ["", ""]
    var questionsList = [String]()
    //MARK: Strings
    let cellReuseIdentifier = "cell"

    //MARK: - View Lifecyle -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionAnswerSetup()
        
        //Set category label text
        categoryLabel.text = dataSegue[0]
        
        //Setup Table
        faqsTable.delegate = self
        faqsTable.dataSource = self
        self.faqsTable.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        //Used for variable height table rows
        faqsTable.estimatedRowHeight = 44.0
        faqsTable.rowHeight = UITableViewAutomaticDimension
    }
    override func viewWillAppear(_ animated: Bool) {
        // Used to make status bar text black so that it is legible
        UIApplication.shared.statusBarStyle = .default
    }
    override func viewWillDisappear(_ animated: Bool) {
        // Used to make status bar text back to white
        UIApplication.shared.statusBarStyle = .lightContent
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - Navigation Buttons -
    @IBAction func cancelButtonTap(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    
    //MARK: - Table Setup -
    func questionAnswerSetup(){
    /*
      Arguements: None
      Description: Setup Question and Answer Lists
      Returns: None
    */
        if(dataSegue[1] == "1"){
            questionsList = billQuestions
            answersList = billAnswers
        }else if(dataSegue[1] == "2"){
            questionsList = miscQuestions
            answersList = miscAnswers
        }else if(dataSegue[1] == "3"){
            questionsList = newpatQuestions
            answersList = newpatAnswers
        }else if(dataSegue[1] == "4"){
            questionsList = servicesQuestion
            answersList = servicesAnswers
        }
    }
    // Number of sections
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.questionsList.count * 2
    }
    // Row selection
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = self.faqsTable.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as UITableViewCell!
      
        // Formula is used to get the same index so that rows are not skipped
        let rowFormula = (indexPath as NSIndexPath).row - (((indexPath as NSIndexPath).row + 1) / 2)
        
        if((indexPath as NSIndexPath).row % 2 == 0){// Even row
            if((indexPath as NSIndexPath).row == 0){
                cell.textLabel?.text = self.questionsList[0]
            }else{
                cell.textLabel?.text = self.questionsList[rowFormula]
            }
           cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 20.0)
        }else{// Odd row
            cell.textLabel?.text = self.answersList[rowFormula]
            cell.textLabel?.font = UIFont.systemFont(ofSize: 20.0)
        }
        
        // Used to wrap the words
        cell.textLabel?.numberOfLines = 0
        
        return cell
    }
}
