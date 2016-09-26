//
//  FAQsFormViewController.swift
//  ValleyProHealth
//
//  Created by Brice Local Account on 9/21/16.
//  Copyright © 2016 Valley Professionals Community Health Center. All rights reserved.
//

import UIKit

class FAQsFormViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var faqsTable: UITableView!
    @IBOutlet weak var cancelButton: UIButton!
    
    let billQuestions = ["What types of insurance do you accept?","Can I be seen by a provider even if I do not have health insurance?","Can Valley Professionals help me enroll in health insurance coverage?","What do I need to bring to apply for sliding fee scale?","What if I am unable to pay my bill?","What if I have other questions about billing?"]
    let billAnswers = ["We accept all commercial insurance carriers, Medicare, and Medicaid.","Yes, Valley Professionals accepts self-pay, and also has a sliding-fee scale for eligible individuals.","Yes, our Community Health Workers are specially trained to help individuals find affordable health coverage. To make an appointment, contact the Valley Professionals Community Health Center nearest you.","To apply for sliding fee scale, patients and their families must provide the following documents to verify gross income: Most recent tax filing with the IRS and/or W2\'s from employer(s), A copy of Social Security or Disability Award Letter(s) or unemployment statement(s),Pay stubs from all employerers for the last 30-day period, If unemployed, no income, and living with others, we require a signed and dated letter from the person providing support of the patient, Driver\'s license, Any other income that is direct deposited. For more information on sliding fee scale, visit the patient resources section of this app.","If you unable to pay your bill, feel free to contact our Billing Department at (765) 828–1000 to set up a payment plan that works for you.","For all inquiries regarding billing, please contact our Billing Department at (765) 828–1000."]
    let miscQuestions = ["Is Valley Professionals hiring?"]
    let miscAnswers = ["Visit valleyprohealth.org to view current job openings at Valley Professionals. You can get to the site by tapping the website button on the home screen."]
    let newpatQuestions = ["Are you accepting new patients?","How soon will I be able to schedule my first appointment?","What do I need to bring to my first appointment?","Can I make an appointment with a Behavioral Health counselor?","Do you offer prenatal services?","Can I call and get information about my spouse/parent/adult/child (18+) or their medical records?","Can anyone else (i.e. grandparent, family friend, or childcare provider) bring my child to his or her appointment?"]
    let newpatAnswers = ["To find out if one of our locations is accepting new patients please give us a call and we will be glad to assist you. The contact information for all of our clinics is available in the locations section of this app.","New patient appointments can be scheduled as soon as two weeks. In the mean time we will send you paperwork to be completed and brought in on the day of your appointment.","For your first appointment, you should bring your completed new patient paperwork, along with your driver\'s license and insurance information. When you arrive, the front office will make a copy of your medical insurance card and verify that your account information is up-to-date. A nurse will complete your medical history after you have been checked in, but please bring any relevant medical information, including all names and dosages of prescriptions and over-the-counter medications that you are currently taking.","If you are an established patient, speak with your Primary Care Provider about referring you to a Valley Professionals Behavioral Health counselor.","Prenatal services, as well as, Labor and Delivery are available at our Terre Haute clinic by referral. For more information, or to make an appointment, contact the Valley Professionals Community Health Center nearest you.","The Health Insurance Portability and Accountability Act (HIPAA) prohibits us from sharing confidential patient health information without written authorization from the patient. If a patient would like to grant you permission to make an appointment for them or to access their medical records they must complete a Release of Information form, available in the forms section of this app.","Yes, you may grant permission for another person to bring your child to his or her appointment after you have completed and submitted a consent form available in the forms section of this app."]
    let servicesQuestion = ["What can I do if I am unable to pay for my prescription?","How long will it take for me to receive my prescription refill after I have submitted a request?","Do I have to be a patient to use the After-Hours Clinic?","Do I need an appointment for the After-Hours clinic?","What can I be seen for at the After-Hours clinic?","When is After-Hours clinic?","Does the Mobile School-Based Health Center offer school physical examinations?","What types of services are available on the Mobile School-Based Health Center?","Who can be seen on the Mobile Health Center?","What do I need to do for my child to be seen by the MSBHC?","Does it count against my child\'s attendance when he or she is seen by the MSBHC?","Does the MSBHC visit my school?","How do I know when the MSBHC will be at my school?","Do I have to be a patient to take part in the Diabetic Support Group?"]
    let servicesAnswers = ["Valley Professionals has a 403(b) Prescription Assistance Program that can help eligible individuals to afford their medication.","Prescription refill requests can take up to 48 hours once submitted.","No, you are not required to be a current Valley Professionals patient to utilize the After-Hours services.","No, After-Hours office visits are on a first-come, first-served basis.","The After-Hours clinic is for acute conditions, such as, fever, vomiting, congestion, sore throat, flu symptoms, cough, rash, earache, or other similar symptoms.","The After-Hours clinic takes place Monday through Thursday from 5:00pm to 8:00pm at our Clinton location only.","Yes.","Visit the MSBHC for: immunizations, school physicals, well child visits, cold, fever, vomiting, congestion, sore throat, flu symptoms, cough, rash, ear ache, and similar symptoms.","Students and Employees of a school hosting the Mobile Health Center may be seen. There are certain occasions during school breaks when the Mobile Health Center is open to the community. For more information, or to view the MSBHC\'s schedule, go to the tracker section of the app.","To enroll your child in MSBHC services, you must complete and submit the enrollment form found in the forms section. After you have done this, you may call the mobile unit and make an appointment, or your child can simply go to the school nurse and be referred.","No, your child\'s visit to the MSBHC will not count against his or her attendance; moreover, if your child is sent home due to illness by an MSBHC provider, this absence would be certified excused.","The MSBHC visits schools in the North Vermillion, South Vermillion, Southwest Parke, and North Central Parke school corporations.","You can find a schedule for the MSBHC in the tracker section of this app.","No, you do not have to register, make an appointment, or even be a patient of Valley Professionals to take part in the Diabetic Support Group."]
    
    var dataSegue = ["", ""]
    var questionsList = [String]()
    var answersList = [String]()
    let cellReuseIdentifier = "cell"
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoryLabel.text = dataSegue[0]
        
        
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
        
         self.faqsTable.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        faqsTable.delegate = self
        faqsTable.dataSource = self
        
        faqsTable.estimatedRowHeight = 44.0
        faqsTable.rowHeight = UITableViewAutomaticDimension

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelButtonTap(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    // number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.questionsList.count * 2
    }

    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // create a new cell if needed or reuse an old one
        let cell:UITableViewCell = self.faqsTable.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as UITableViewCell!
      
        //Formula is used to get the same index for odd and even
        let rowFormula = (indexPath as NSIndexPath).row - (((indexPath as NSIndexPath).row + 1) / 2)
        if((indexPath as NSIndexPath).row % 2 == 0){
            if((indexPath as NSIndexPath).row == 0){
                cell.textLabel?.text = self.questionsList[0]
            }else{
                cell.textLabel?.text = self.questionsList[rowFormula]
            }
           cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 20.0)
        }else{
            cell.textLabel?.text = self.answersList[rowFormula]
            cell.textLabel?.font = UIFont.systemFont(ofSize: 20.0)
        }
        
        //Used to wrap the words
        cell.textLabel?.numberOfLines = 0
        return cell
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \((indexPath as NSIndexPath).row).")
    }

}
