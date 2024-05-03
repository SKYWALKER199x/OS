while true; do
    echo "Menu:"
    echo "1-Create"
    echo "2-Modify"
    echo "3-Navigate"
    echo "4-List"
    echo "5-User Details"
    echo "6-Permissions"
    echo "7-Exit"
    read choice

    case $choice in
    1)
        echo "-> Create : "
        echo "---> 1-Create Directory"
        echo "---> 2-Create Files"
        echo "---> 3-Exit"
        read choice1
        case $choice1 in
        1)
            echo "Enter name of new directory: "
            read name_dir
            mkdir "$name_dir" && echo "New Directory created"
            ;;
        2)
            echo "Enter name of new file: "
            read name_file
            touch "$name_file" && echo "New File created"
            ;;
        3)
            break
            ;;
        esac
        ;;
    2)
        echo "-> Modify: "
        echo "---> 1-delete"
        echo "---> 2-rename"
        echo "---> 3-mv"
        echo "---> 4-copy "
        echo "---> 5-exit"
        read choice2
        case $choice2 in
        1)
            echo "Enter name to delete: "
            read del_name
            rm "$del_name" && echo "Directory/File deleted"
            ;;
        2)
            echo "Enter name of file/dir to rename: "
            read rename_file_dir
            echo "Enter new name of file/dir: "
            read new_name
            mv "$rename_file_dir" "$new_name" && echo "File renamed"
            ;;
        3)
            echo "Enter file/dir to move: "
            read move_name
            echo "Enter new destination: "
            read new_destination
            mv "$move_name" "$new_destination" && echo "File/directory moved"
            ;;
        4)
            echo "Enter name of file/dir to copy: "
            read copy_file_directory
            echo "Enter new file to copy: "
            read new_file_copy
            cp -r "$copy_file_directory" "$new_file_copy" && echo "File/Directory copied successfully"
            ;;
        5)
            break
            ;;
        esac
        ;;
    3)
        echo "-> Navigate: "
        echo "---> 1-Change directory"
        echo "---> 2-Go to Previous Directory "
        echo "---> 3-Exit"
        read choice3
        case $choice3 in
        1)
            echo "Enter path to change: "
            read new_path
            cd "$new_path" || echo "Directory not found"
            echo "Current path: "
            pwd
            ;;
        2)
            cd ..
            echo "Current path: "
            pwd
            ;;
        3)
            break
            ;;
        esac
        ;;
    4)
        echo "-> List: "
        echo "---> 1-All Files"
        echo "---> 2-All Files in Detail"
        echo "---> 3-All with Hidden Files"
        echo "---> 4-All with Hidden files in detail"
        echo "---> 5-Exit"
        read choice4
        case $choice4 in
        1)
            echo "All : "
            ls
            ;;
        2)
            echo "All Files in Detail: "
            ls -l
            ;;
        3)
            echo "All with Hidden Files: "
            ls -a
            ;;
        4)
            echo "All with hidden files in detail: "
            ls -la
            ;;
        5)
            break
            ;;
        esac
        ;;
    5)
        echo "-> User Details: "
        echo "---> 1-logname "
        echo "---> 2-uname"
        echo "---> 3-df"
        echo "---> 4-Exit"
        read choice5
        case $choice5 in
        1)
            echo "Login name of current user: "
            logname
            ;;
        2)
            echo "Print OS name"
            uname -a
            ;;
        3)
            echo "Report file system desk space"
            df -h
            ;;
        4)
            break
            ;;
        esac
        ;;
    6)
        echo "-> Permission: "
        echo "---> 1-chmod"
        echo "---> 2-umask"
        read choice6
        case $choice6 in
        1)
            echo "Enter file pSath: "
            read file_name_permission_path
            echo "Enter permission mode: "
            read permission_mode
            chmod "$permission_mode" "$file_name_permission_path" && echo "Permission Operation Successful"
            ;;
        2)
            echo "Enter umask value: "
            read umask_value
            umask "$umask_value" && echo "Umask set successfully"
            umask
            echo "Permission Operation Successful"
            ;;
        esac
        ;;
    7)
        exit
        ;;
    esac
done
