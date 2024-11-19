echo "hallo there"
echo "Enter first Number"
read x
echo "Enter second Number"
read y
echo "Enter Operation"
read z

echo `expr $x \$z $y`
