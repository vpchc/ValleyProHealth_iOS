//
//  ProvidersFormViewController.swift
//  ValleyProHealth
//
//  Created by Brice Webster on 9/14/16.
//  Copyright © 2016 Valley Professionals Community Health Center. All rights reserved.
//

import UIKit
import Foundation

class ProvidersFormViewController: UIViewController{
    
    // MARK: - Outlets -
    // MARK: Buttons
    @IBOutlet weak var cancelButton: UIButton!
    // MARK: Labels
    @IBOutlet weak var providerName: UILabel!
    @IBOutlet weak var providerCredentials: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var providerEducation: UILabel!
    @IBOutlet weak var providerPersonal: UILabel!
    // MARK: Image Views
    @IBOutlet weak var providerPicture: UIImageView!
    
    // MARK: - Global Variables -
    // MARK: Arrays
    var dataSegue = ["",""]
    var providersList = [String]()
    // MARK: Defaults
    let defaults = UserDefaults.standard
    // MARK: Dictonaries
    let provider_bio_eduction = ["Dr. Aziz Abed": "•University of Illinois at Chicago\n•University of Illinois at Chicago – School of Public Health\n•St. George’s University School of Medicine\n•Union Hospital Family Medicine Residency Program", "Dr. Bing Gale": "•Ball State University – BS Physiology\n•Indiana University School of Medicine – Doctor of Medicine", "Dr. Steven Waltz": "•Purdue University\n•Indiana University School of Medicine\n•Union Hospital Family Medicine Residency Program", "Leslie Batty": "•Indiana State University - MSN\n•Indiana University School of Medicine•", "Gretchen Blevins": "•Marshall University School of Nursing - MSN\n•University of New Hampshire School of Nursing - BSN", "Christi Busenbark": "•Indiana University - MSN\n•Purdue University - BSN", "Nicole Cook": "•Southern Illinois University Edwardsville - BSN\n•St. Louis University School of Nursing - MSN", "Beth Fields": "•MSN – Indiana State University\n•BSN – Indiana Wesleyan University", "Nicole Hall": "•Indiana State University - MSN\n•Indiana State University - BSN", "Brandi Larson": "•Indiana State University - MSN\n•Indiana State University - BSN","Renae Norman": "•Indiana Wesleyan University - MSN\n•Indiana Wesleyan University - BSN", "Jordan Ryley": "•Indiana State University - MSN\n•Indiana State University - BSN", "Louwanna Wallace": "•Indiana State University - MSN, BSN\nUniversity of Indianapolis - ASN", "Dr. Paul Taraska": "•Indiana University School of Medicine\n•Wabash College - BS", "Dr. Julia Wernz": "•PhD Indiana State University\n•MS Indiana State University\n•BA Oral Roberts University", "Johnathan Detwiler": "•Indiana State University - MS\n•Purdue University - BA", "Linda Lonneman": "•University of Southern Indiana - MSW\n•Indiana State University - BS", "David McIntyre": "•Indiana State University", "Megan Neitling": "•Indiana State University - MS\n•Indiana State University - MS", "Sara Ritter": "•Indiana University - MSW\n•Indiana University - MSW", "Keith Seegers": "•Indiana University - MSW\n•Purdue University - BS", "Lacey Skwortz": "•University of Southern Indiana - MSW\n•Anderson University - BS", "Lisa Tincher": "•Stony Brook University - Post-Masters\n•Indiana State University - MS\n•Indiana Wesleyan University - BS", "Dana Tinkle": "•Indiana State University - MS\n•Indiana State University - BS", "Heather Woods": "•Indiana State University - MS\n•Indiana State University - BS", "Dr. Nichole Barnett":"•Indiana University School of Dentistry - DDS\n•Oakland City University - Bachelor of Science Biology &amp; Chemistry", "Jamie Tidwell": "•Indiana State University - MS\n•Indiana State University - BS"]
    
    let provider_bio_personal = ["Dr. Aziz Abed": NSLocalizedString("Dr. Abed enjoys weight training and sports, including football, basketball, and baseball.", comment: "Provider Personal Abed"), "Dr. Bing Gale": NSLocalizedString("Dr. Gale has been practicing in the area for over fifteen years. She enjoys focusing on patient care and creating a happier and healthier community.", comment:"Provider Personal Gale"), "Dr. Steven Waltz": NSLocalizedString("Dr. Waltz has been practicing medicine in the Wabash Valley for over 30 years. He enjoys teaching and mentoring other primary care providers in his role as Chief Medical Officer at Valley Professionals, as well as continuing to provide excellent care to his patients in Rockville.", comment:"Provider Personal Waltz"), "Leslie Batty": NSLocalizedString("Leslie is married with 2 daughters. She is active in her church, enjoys spending time with her family, watching her daughters in their many sporting events, and photography.", comment:"Provider Personal Batty"), "Gretchen Blevins": NSLocalizedString("In addition to practicing medicine, Gretchen enjoys spending time with her family swimming, kayaking, ATV riding, and trying new things like sky diving when she gets the opportunity.", comment:"Provider Personal Blevins"), "Christi Busenbark": NSLocalizedString("Christi enjoys spending time with her four children and family. She is an avid reader and also enjoys photography.", comment:"Provider Personal Busenbark"), "Nicole Cook": NSLocalizedString("Nicole says her favorite part of working on the Mobile Health Unit is being able to provide healthcare services to children who may not normally receive healthcare as well as working with the wonderful school staff. In her free time, she enjoys spending time with her husband and daughter. Originally from the St. Louis area, Nicole is an avid St. Louis Cardinals fan.", comment:"Provider Personal Cook"), "Beth Fields": NSLocalizedString("Beth considers it an honor and a privilege to care for persons who entrust her with their healthcare needs. In her free time she enjoys spending time with her family, gardening, and travel.", comment:"Provider Personal Fields"), "Nicole Hall": NSLocalizedString("Nicole Hall is committed to her patients and holistic care. She enjoys running, shopping, and serving her country in the Indiana Air National Guard.", comment:"Provider Personal Hall"), "Brandi Larson": NSLocalizedString("Brandi is passionate about providing medical care for the patients of VPCHC.", comment:"Provider Personal Larson"),, "Tammy Mundy": NSLocalizedString("In addition to practicing medicine, Tammy enjoys traveling, reading and visiting antique shops. Tammy is married with 2 children and one grandchild.", comment:"Provider Personal Mundy"), "Renae Norman":  NSLocalizedString("In addition to practicing medicine, Renae enjoys reading and spending time with her husband and their three children. Renae’s children are very active in athletics, therefore she spends a lot of time supporting the North Vermillion Falcons.", comment:"Provider Personal Norman"), "Jordan Ryley": NSLocalizedString("Jordan’s favorite part of working for Valley Professionals in Rockville is knowing that she is a part of the solution to the shortage of rural health providers. She also enjoys the connection that she has with the patients, coming from a small town herself. Jordan enjoys traveling and all things outdoors, especially hiking and gardening.", comment:"Provider Personal Ryley"), "Louwanna Wallace": NSLocalizedString("Louwanna has been in the healthcare field more than 40 years and enjoys providing health care in a rural clinic setting In her free time, she enjoys spending time with family, hunting, reading, and music.", comment:"Provider Personal Wallace"), "Dr. Paul Taraska": NSLocalizedString("Dr. Taraska is passionate about providing behavorial healthcare for the patients of VPCHC.", comment:"Provider Personal Taraska"), "Dr. Julia Wernz": NSLocalizedString("Dr. Wernz is a psychologist with more than ten years of experience, She specializes in treating patients with attention deficit, pervasive developmental, mood, anxiety and personality disorders, while collaborating with medical providers and other service providers to comprehensively treat patients. Dr. Wernz created the behavioral health integration model for the VPCHC as well as developed the current integrated MAT addictions program. She also serves, as the Director of Behavioral Health for all VPCHC locations.", comment:"Provider Personal Wernz"), "Johnathan Detwiler": NSLocalizedString("Johnathan is currently working towards a PhD at Indiana State University. He has been working in integrated healthcare since August 2015 and has a passion for helping patients reach their Behavioral Health treatment goals. Johnathan is an avid outdoorsman, golfer, and enjoys riding anything from motorcycles to jet skis. He has a passion for animal welfare and enjoys spending time with his dogs and his cat.", comment:"Provider Personal Detwiler"), "Linda Lonneman": NSLocalizedString("Linda is married and has two children, three granddaughters, and two stepdaughters. She enjoys spending time with family and friends, cycling and outdoor activities, traveling, and caring for her animals.", comment:"Provider Personal Lonneman"), "David McIntyre": NSLocalizedString("Dave is a Licensed Clinical Addictions Counselor (LCAC) and is a certified Medically Assisted Treatment (MAT) provider. Dave has worked in the field of addictions and mental health for over 30 years. In addition to providing clinical services, Dave has served as the Coordinator of Counselor Training Services at the Fairbanks Research and Training Institute, and worked as Training Specialist for the Indiana Department of Mental Health and Addiction Services. In his free time, Dave enjoys spending time with his grandkids, vacationing with family, coaching basketball, fishing, and being outdoors.", comment:"Provider Personal McIntyre"), "Megan Neitling": NSLocalizedString("Megan is pursuing her PhD at the California Institute of Integral Studies. Megan enjoys working with children, adolescents, adults, couples, and families to improve their quality of life through counseling. Megan enjoys traveling, live music, and Netflix. She spends weekends relaxing with family and friends.", comment:"Provider Personal Neitling"), "Sara Ritter": NSLocalizedString("Sara has an LCSW as well as her LCAC (Licensed Clinical Addictions Counselor) and has been working in the field of mental health and addictions for over 30 years. She enjoys working with people of all ages and treatment concerns. During her time away from work, Sara enjoys reading, being outside, taking vacations, and spending time with friends and family.", comment:"Provider Personal Ritter"), "Keith Seegers": NSLocalizedString("Keith is married with two adult children and two grandsons. He enjoys travel and the out of doors. He takes special interest in history, especially Williamsburg, VA. He enjoys his home gardens and dog and cat.", comment:"Provider Personal Seegers"), "Lacey Skwortz": NSLocalizedString("Lacey comes from a big family, is married and has a daughter. She was born in Cory, Indiana, but has lived most of her life in Terre Haute and has been a social worker in the community since 2006. Lacey became a social worker because she has a heart for helping others and enjoys getting to know her patients and assisting them in meeting their goals.", comment:"Provider Personal Skwortz"), "Lisa Tincher": NSLocalizedString("Lisa has worked as a nurse practitioner since 1999, first as Family Nurse Practitioner for 10 years, and for the last 7 years as a Psychiatric Mental Health NP. Lisa’s favorite hobby is scuba diving. She also loves spending time with her family including, two daughters and two grandchildren.", comment:"Provider Personal Tincher"), "Dana Tinkle": NSLocalizedString("Dana is currently working towards becoming a Registered Play Therapist. She works with clients of all ages and mental health concerns, and has a strong clinical interest in childhood trauma treatment. Dana is married and enjoys traveling with her husband. Her hobbies include reading, fitness classes, and listening to music. She also loves to spend time with her friends and family.", comment:"Provider Personal Tinkle"), "Heather Woods": NSLocalizedString("Heather is currently working towards becoming a Registered Play Therapist. Her favorite part of working on the Mobile School-Based Health Center is having the ability to provide services to children and adolescents who may otherwise not be able to receive behavioral healthcare, as well as, the privilege of working and collaborating with some wonderful members of the school staff. Heather enjoys spending her free-time with family and friends. She also enjoys crafting, decorating, listening to music, learning new things, and playing with her two dogs.", comment:"Provider Personal Woods"), "Dr. Nichole Barnett": NSLocalizedString("Dr. Barnett became a dentist so she could help the underserved, and her goal is to make every patient feel comfortable while having their dental work done. In addition to being a dentist, she is also a member of a gospel trio along with her husband and sister-in-law. In her free time she enjoys spending time with her family, hunting and fishing.", comment:"Provider Personal Barnett"), "Jamie Tidwell": NSLocalizedString("Jamie loves being a Dental Hygienist and giving her patients a clean, healthy smile. In her spare time, Jamie loves to spend time with her family and friends going camping and fishing.", comment:"Provider Personal Tidwell")]

    // MARk: - View Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Set provider name and credentials text
        providerDisplaySetup()
    }
    override func viewWillAppear(_ animated: Bool) {
        //Shrinks some text size for Spanish locale
        if(defaults.object(forKey:"savedLocale") as! String == "es"){
            titleLabel?.font = UIFont(name: (titleLabel?.font.fontName)!, size:20)
        }
        // Used to make status bar text black so that it is legible
        UIApplication.shared.statusBarStyle = .default
    }
    override func viewWillDisappear(_ animated: Bool) {
        // Used to make status bar text back to white
        UIApplication.shared.statusBarStyle = .lightContent
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation Buttons -
    @IBAction func cancelButtonTap(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Provider Display Setup -
    func providerDisplaySetup(){
        //Sets the provider Name and Credentials display on the screen
        let providerName = providerNameCredentialSetup()
        
        //Sets the provider Picture display on the screen
        providerPictureSetup(providerName: providerName)
        
        //Sets the Education and Personal text display on the screen
        providerEducation.text = provider_bio_eduction[providerName]
        providerPersonal.text = provider_bio_personal[providerName]
    }
    func providerNameCredentialSetup() -> String{
        
        let providerTypeSelected = dataSegue[0]
        let providerNameSelected = dataSegue[1]

        //Separate the name and credentials into distinct strings
        let splitString = providerNameSelected.components(separatedBy: ",")
        print(dataSegue[1])
        let name = splitString[0]
        var credentials = splitString[1].trimmingCharacters(in: .whitespacesAndNewlines)
        
        //Expand the abbreviated credentials
        if(credentials.caseInsensitiveCompare("M.D.") == .orderedSame){
            if(providerTypeSelected == "Behavioral Health"){
                credentials = NSLocalizedString("Psychiatrist", comment:"Provider Title Psychiatrist")
            }else{
                credentials = NSLocalizedString("Physician", comment:"Provider Title Physician")
            }
        }else if(credentials == "PhD"){//Only Dr. Wernz but will need to change when other PhDs are hired
            credentials = NSLocalizedString("Director of Behavioral Health", comment:"Provider Title Director BH")
        }else if(credentials == "FNP-C"){
            credentials = NSLocalizedString("Certified Family Nurse Practitioner", comment:"Provider Title FNP")
        }else if(credentials == "MS"){
            credentials = NSLocalizedString("Mental Health Counselor", comment:"Provider Title Counselor")
        }else if(credentials == "LCSW"){
            credentials = NSLocalizedString("Licensed Clinical Social Worker", comment:"Provider Title LCSW")
        }else if(credentials == "LCAC"){
            credentials = NSLocalizedString("Licensed Clinical Addictions Coordinator", comment:"Provider Title LCAC")
        }else if(credentials == "LMHCA"){
            credentials = NSLocalizedString("Licensed Mental Health Coordinator Associates", comment:"Provider Title LMHCA")
        }else if(credentials == "PMHNP"){
            credentials = NSLocalizedString("Psychiatric-Mental Health Nurse Practitioner", comment:"Provider Title PMHNP")
        }else if(credentials == "LDH"){
            credentials = NSLocalizedString("Licensed Dental Hygienist", comment:"Provider Title LDH")
        }else{
            credentials = NSLocalizedString("Dentist", comment:"Provider Title Dentist")
        }
        
        //Sets Provider Name and Credentials displayed on the screen
        providerName.text = name
        providerCredentials.text = credentials
        
        return name
    }
    func providerPictureSetup(providerName: String){
        let providerPictureName = providerName.replacingOccurrences(of: " ", with: "_").replacingOccurrences(of: ".", with: "").lowercased()
        print(providerPictureName)
        self.providerPicture.image = UIImage(named: providerPictureName)
    }

}
