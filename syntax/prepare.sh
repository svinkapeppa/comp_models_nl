echo Start downloading constituency data
wget https://raw.githubusercontent.com/nikitakit/self-attentive-parser/master/data/02-21.10way.clean
mv 02-21.10way.clean train_con.txt
wget https://raw.githubusercontent.com/nikitakit/self-attentive-parser/master/data/22.auto.clean
mv 22.auto.clean dev_con.txt
wget https://raw.githubusercontent.com/nikitakit/self-attentive-parser/master/data/23.auto.clean
mv 23.auto.clean test_con.txt
echo Finished downloading constituency data

echo Downloading stanford parser
wget https://raw.githubusercontent.com/DoodleJZ/HPSG-Neural-Parser/master/data/stanford-parser_3.3.0.jar
echo Finished downloading stanford parser


echo Start converting constituency to dependency
java -cp stanford-parser_3.3.0.jar edu.stanford.nlp.trees.EnglishGrammaticalStructure -basic -keepPunct -conllx -treeFile train_con.txt > train_dep.txt
java -cp stanford-parser_3.3.0.jar edu.stanford.nlp.trees.EnglishGrammaticalStructure -basic -keepPunct -conllx -treeFile dev_con.txt > dev_dep.txt
java -cp stanford-parser_3.3.0.jar edu.stanford.nlp.trees.EnglishGrammaticalStructure -basic -keepPunct -conllx -treeFile test_con.txt > test_dep.txt
echo Finised converting constituency to dependency
