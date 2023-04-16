import os
 
# Function to rename multiple files
def main():
    banned={"rename.py","rename.exe"}
    
    folder =os.getcwd()
    for count, filename in enumerate(os.listdir(folder)):
        if(filename is not banned):
            file=filename.replace("-","_").lower()
            print(file)
            # dst = f"Hostel {str(count)}.ttf"
            src =f"{folder}/{filename}"  # foldername/filename, if .py file is outside folder
            dst =f"{folder}/{filename}"
         
            # rename() function will
            # rename all the files
            os.rename(src, file)
 
# Driver Code
if __name__ == '__main__':
     
    # Calling main() function
    main()