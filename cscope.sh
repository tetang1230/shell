if [ `uname` = 'Darwin' ];then
    ROOT=$(/usr/bin/php -r "echo realpath('`dirname $0`/../');")
else
    ROOT=$(/Data/apps/php/bin/php -r "echo realpath('`dirname $0`/../');")
fi
                                                                                                                                             
rm -rf $ROOT/project/cscope.*

find_files () {
    if [[ -d $1 ]];then
        if [ `uname` = 'Darwin' ];then
            find $1 -name "*.php"    >  $ROOT/project/cscope.files
            find $1 -name "*.js"     >> $ROOT/project/cscope.files
            find $1 -name "*.sql"    >> $ROOT/project/cscope.files
            find $1 -name "*.sh"     >> $ROOT/project/cscope.files
            find $1 -name "*.conf"   >> $ROOT/project/cscope.files
            find $1 -name "*.avatar" >> $ROOT/project/cscope.files
        else
            find $1/ -type f -name "*.php" | grep -v "Zend" | grep -v "PHPUnit" >> $ROOT/project/cscope.files
            find $1/ -type f -name "*.js"                                       >> $ROOT/project/cscope.files
            find $1/ -type f -name "*.sql"                                      >> $ROOT/project/cscope.files
            find $1/ -type f -name "*.sh"                                       >> $ROOT/project/cscope.files
            find $1/ -type f -name "*.conf"                                     >> $ROOT/project/cscope.files
            find $1/ -type f -name "*.avatar"                                   >> $ROOT/project/cscope.files
        fi
    fi
}

find_files $ROOT
find_files $ROOT/libs
for service_name in `ls $ROOT/services`
do
    find_files $ROOT/services/$service_name
done

cd $ROOT/project
cscope -b

ctags  -R --fields=+lS $ROOT 2>/dev/null
#ctags -R --languages=PHP --exclude=.svn --totals=yes --tag-relative=yes --PHP-kinds=+cf $ROOT 2>/dev/null
#ctags  -R --php-kinds=+cidfvj --fields=+afmikKlnsStz $ROOT
#ctags  -R --fields=+afmikKlnsStz $ROOT
#ctags  -R --fields=+afmikKlnsStz $ROOT
