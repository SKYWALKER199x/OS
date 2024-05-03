clear
r=0
temp=1
while [ $r -eq 0 ]; do
    clear
    echo "Directory Management"
    echo "1)New"
    echo "2)Modify"
    echo "3)Navigate"
    echo "4)List"
    echo "5)permision"
    echo "0)exit"
    read -p "Enter your choice: " ch
    
    case $ch in
        1)
            #new
            clear
            echo "1)create New File"
            echo "2)Create New directory"
            echo "0)exit"
            read -p "Enter your choice: " i

            case $i in
                1)
                    read -p "Enter File Name: " name
                    touch $name
                    echo done
                    if (( $temp==0))
                                then
                                continue
                    fi
                ;;
                2)
                    read -p "Enter Directory Name: " name
                    mkdir $name   
                    echo done
                    if (( $temp==0))
                                then
                                continue
                    fi
                ;;
                0)
                    #exit
                ;;
                *)
                    echo "Enter Valid Choice"
                    if (( $temp==0))
                                then
                                continue
                    fi
                ;;
            esac
        ;;
        2)
            #Modifty
            clear
            echo "1)Edit/View"
            echo "2)rename"
            echo "3)copy"
            echo "4)move"
            echo "5)remove"
            echo "0)exit"
            read -p "Enter your choice: " i

            case $i in
                1)
                    #edit
                    read -p "Enter file name you want to edit/view: " name
                    gedit $name
                    echo Done
                    read temp
                    if (( $temp==0))
                        then
                        continue
                    fi
                ;;
                2)
                    #rename
                    read -p "Enter file name you want to rename: " name
                    read -p "Enter new name: " newname
                    mv $name $newname
                    echo Done
                    read temp
                    if (( $temp==0))
                        then
                        continue
                    fi
                ;;
                3)
                    #copy
                    read -p "Enter file name you want to copy" name
                    read -p "Enter other file name: " newname
                    cp $name $newname
                    echo Done
                    read temp
                    if (( $temp==0))
                        then
                        continue
                    fi
                ;;
                4)
                    #move
                    read -p "Enter file name you want to move: " name
                    read -p "Enter path where you want to move: " newname
                    mv $name $newname
                    echo Done
                    read temp
                    if (( $temp==0))
                        then
                        continue
                    fi
                ;;
                5)
                    #remove
                    echo "1)Remove file"
                    echo "2)Remove directory"
                    read -p "Enter your choice: " i
                    case "${i}" in
                        1)
                            read -p "Enter file name you want to remove: " name
                            rm $name
                            echo Done
                            if (( $temp==0))
                                then
                                continue
                            fi
                        ;;
                        2)
                            read -p "Enter file directory you want to remove: " name
                            rmdir $name
                            echo Done
                            if (( $temp==0))
                                then
                                continue
                            fi
                        ;;
                        *)
                            echo "Enter Valid Choice"
                            read temp
                            if (( $temp==0))
                                then
                                continue
                            fi
                        ;;
                    esac    
                ;;
                0)
                    #exit
                ;;
                *)
                    echo "Enter Valid Choice"
                    read temp
                    if (( $temp==0))
                        then
                        continue
                    fi
                ;;
            esac  
        ;;
        3)
            x=0
            while [ $x -eq 0 ]; do
                #Navigate
            clear
            echo "1)Get into"ls
            echo "2)Back"
            echo "0)exit"
            read -p "Enter your choice: " i

            case $i in
                1)
                    ls
                    read -p "Get into " name
                    cd $name
                ;;
                2)
                    cd ..
                ;;
                0)
                    x=1
                ;;
                *)
                    echo "Enter Valid Choice"
                    read temp
                    if (( $temp==0))
                        then
                        continue
                    fi
                ;;
            esac
            done
        ;;    
        4)
            #list
            clear
            echo "1)List all files and directory of current location"
            echo "2)List all details of a particular file or directory of current location"
            echo "0)exit"
            read -p "Enter your choice: " i
            case "${i}" in
                1)
                    ls
                    read temp
                    if (( $temp==0))
                        then
                        continue
                    fi
                ;;
                2)
                    ls -al
                    read temp
                    if (( $temp==0))
                        then
                        continue
                    fi
                ;;
                *)
                    echo "Enter Valid Choice"
                    read temp
                    if (( $temp==0))
                        then
                        continue
                    fi
                ;;
            esac  
        ;;
        5)
            #permision
            clear
            echo "1)Check  permission for the owner, group and others on a file/directory."
            echo "2)Change permissions of a file/directory."
            echo "0)Exit"
            read -p "Enter your choice: " i

            case "${i}" in
                1)
                    ls -al
                ;;
                2)
                    echo "1)remove permission"
                    echo "2)give permission"
                    read -p "Enter Your choice : " j
                    case "${j}" in
                        1)
                            ls -al
                            echo "1)For read type r"
                            echo "2)For write type w"
                            echo "2)For execute type x"
                            read -p "Enter choice"  k
                            read -p "Enter File name" filename
                            chmod -$k $filename
                        ;;
                        2)
                            ls -al
                            echo "1)For read type r"
                            echo "2)For write type w"
                            echo "2)For execute type x"
                            read -p "Enter choice: 9"  k
                            read -p "Enter File name" filename
                            chmod +$k $filename
                        ;;
                        0)
                            #exit  
                        ;;
                        *)
                            echo "Enter Valid Choice"
                        ;;
                    esac  
                ;;
                0)
                  #exit  
                ;;
                *)
                    echo "Enter Valid Choice"
                ;;
            esac
            
        ;;
        0)
            #exit
            clear
            r=1
        ;;
        *)
            echo "Enter Valid Choice"
        ;;
    esac
done
echo "Bye Bye!"