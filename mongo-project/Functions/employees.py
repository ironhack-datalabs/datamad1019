def sumEmployees(list_offices):
    list_employee = []
    res=0
    for company in list_offices:
        lst=[]
        for i in company:
            lst.append(i['number_of_employees'])
        res+=i['number_of_employees']
        list_employee.append(lst)
    result = [sum(b) for b in list_employee]
    return result