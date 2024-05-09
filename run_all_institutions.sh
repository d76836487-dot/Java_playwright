#!/bin/bash

tags="@playwright and not @ignore and not @rebatedor"
profiles="sicredi azulzinha afinz ota-azulzinha ota-afinz bin003 bin007"
cycle_id=
all_pids=

if [ $# -eq 1 ] && [ $1 = '-h' ]; then
  echo "Roda testes automatizados para todos os perfis."
  echo "Opções: "
  echo " -h: ói eu aqui."
  echo " -t <tags>: quais tags para rodar. Ex: -t '@playwright and not @ignore'. Padrão: '$tags'."
  echo " -p <perfis>: quais perfis deve rodar. Ex: -p 'afinz azulzinha'. Padrão: '$profiles'."
  echo " -z <cycle id>: qual id do test cycle para subir evidências. Ex: -z 'SMP-C13'. Padrão: não subir no zephyr."
  exit 0
fi

while getopts t:p:z: option
do
    case "${option}"
        in
        t)tags=${OPTARG};;
        p)profiles=${OPTARG};;
        z)cycle_id=${OPTARG};;
        *)echo "opção desconhecida $OPTARG"; exit 1
    esac
done

rm -Rf output
mkdir output

for profile in $profiles;
do
  echo "Iniciando testes $profile"
  mkdir output/$profile

  plugins="junit:output/$profile/target/cucumber/junit-report.xml,json:output/$profile/target/cucumber/cucumber.json,me.jvt.cucumber.report.PrettyReports:output/$profile/target/cucumber"

  if [ $cycle_id != '' ]; then
    zephyr_cmd="zephyr save-result -f=output/$profile/target/cucumber/cucumber.json -c=$cycle_id >> output/$profile.out"
  else
    zephyr_cmd='echo "sem opção para subir evidências no zephyr." >> output/$profile.out'
  fi

  { mvn test -P $profile -Dcucumber.plugin=$plugins -Dcucumber.filter.tags="$tags" > output/$profile.out;
    mvn com.trivago.rta:cluecumber-maven:3.5.1:reporting -P $profile >> output/$profile.out;
    `$zephyr_cmd` ; } & all_pids="$profile=$!, $all_pids"
done

echo "Acompanhe os arquivos de saída com 'tail -f output/azulzinha.out' (por exemplo)"
echo "Pids: $all_pids" | tee output/pids
