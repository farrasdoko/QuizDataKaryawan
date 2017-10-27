//
//  DataKaryawanTableViewController.swift
//  QuizDataKaryawan
//
//  Created by Gw on 27/10/17.
//  Copyright © 2017 Gw. All rights reserved.
//

import UIKit

class DataKaryawanTableViewController: UITableViewController {
    var datas : [Kayawan] = [] //Task ini di panggil dari entiti yang sudah di buat sebelumnya
    //dekarasikan context object untuk persistnet container
    var namaSelected:String?
    var jabatanSelected:String?
    var golonganSelected:String?
    var gajiSelected:String?
    var idselected:String?
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return datas.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellData", for: indexPath) as! DataTableViewCell
        
        // Configure the cell...
        // Configure the cell...
        
        //deklarasi dataTask sebagai Index dari tasks
        let dataTask = datas[indexPath.row]
        //mengambildata dengan attribute name_Task
        if let myDataTask = dataTask.nama_karyawan{
            //menampilkan data ke label
            cell.labeluser.text = myDataTask
        }
        if let myDataTask1 = dataTask.nama_staff {
            cell.labelstaff.text = myDataTask1
        }
        if let myDataTask2 = dataTask.golongan{
            cell.labelgolongan.text = myDataTask2
        }
        return cell
    }
    override func viewWillAppear(_ animated: Bool) {
        //memanggil method getData
        getData()
        //memanggil reloadData
        tableView.reloadData()
    }
    
    //method getData
    func getData() {
        //mengecek apakah ada error atau tidak
        do{
            //kondisi kalau tidak ada error
            //maka akan request download data
            datas = try context.fetch(Kayawan.fetchRequest())
        }
        catch{
            //kondisi apabila error fetch data
            print("Fetching Failed")
        }
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){
        //mengece menu swipe bila edit data
        if editingStyle == .delete {
            let task = datas[indexPath.row]
            context.delete(task)
            //Delete data
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            do{
                //retrieve data
                datas = try context.fetch(Kayawan.fetchRequest())
            }
            catch{
                print("Fetching Failed")
            }
        }
        //load data lagi
        tableView.reloadData()
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        //mengecek data yang dikirim
        print("Row \(indexPath.row)selected")
        
        let dataTask = datas[indexPath.row]
        //memasukan data ke variable namaSelected dan image selected ke masing masing variable nya
        namaSelected = dataTask.nama_karyawan
        jabatanSelected = dataTask.nama_staff
        golonganSelected = dataTask.golongan
        gajiSelected = dataTask.gaji
        idselected = dataTask.id_karyawan
        //memamnggil segue passDataDetail
        performSegue(withIdentifier: "passData", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //mengecek apakah segue nya ada atau  tidak
        if segue.identifier == "passData"{
            //kondisi ketika segue nya ada
            //mengirimkan data ke detailViewController
            let kirimData = segue.destination as! IsiViewController
            //mengirimkan data ke masing2 variable
            //mengirimkan nama wisata
            kirimData.passNama = namaSelected
            //mengirimkan data gambar wisata
            kirimData.passStaff = jabatanSelected
            kirimData.passGolongan = golonganSelected
            kirimData.passGaji = gajiSelected
            kirimData.passID = idselected
            
            
            
        }
    }
}
