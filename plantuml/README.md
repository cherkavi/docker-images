# Plant UML

## Start container
```sh
function plantuml-docker-start(){
    # visual code should have: 
    # "plantuml.server": "http://localhost:3344",
    # "plantuml.fileExtensions": ".wsd,.pu,.puml,.plantuml,.iuml,.md",
    # "plantuml.render": "PlantUMLServer",
    docker rm plantuml_visual_code
    echo "start container with plant uml on : http://localhost:3344"
    docker run -d --name plantuml_visual_code -p 3344:8080 plantuml/plantuml-server:jetty 

    # docker run -d --name plantuml-local -p 3344:8080 -e PLANTUML_SECURITY_PROFILE=ALLOWLIST  -e plantuml.allowlist.url='https://raw.githubusercontent.com/plantuml-stdlib/Archimate-PlantUML/master/dist/plantuml-stdlib/stdlib/archimate/Archimate.puml;https://raw.githubusercontent.com/plantuml-stdlib/C4-PlantUML/master/C4_Container.puml' plantuml/plantuml-server:jetty

    # https://plantuml.com/security#:~:text=ALLOWLIST,to%20local%20or%20remote%20resources.
    # > docker run -d --name plantuml-local -p 3344:8080 \
    # -e JAVA_OPTIONS=' -DPLANTUML_SECURITY_PROFILE=ALLOWLIST  -Dplantuml.allowlist.url=https://raw.githubusercontent.com/plantuml-stdlib/Archimate-PlantUML/master/dist/plantuml-stdlib/stdlib/archimate/Archimate.puml;https://raw.githubusercontent.com/plantuml-stdlib/C4-PlantUML/master/C4_Container.puml' \
    # plantuml/plantuml-server:jetty
    
    # > curl https://raw.githubusercontent.com/plantuml-stdlib/Archimate-PlantUML/master/dist/plantuml-stdlib/stdlib/archimate/Archimate.puml    
    # ' Archimate-PlantUML
    # ' Version 0.1
    # ' Url will come here...
    # 
    # ' Styling
    # ' ##################################
    # !define TECHN_FONT_SIZE 12
    # !define ELEMENT_FONT_COLOR #FFFFFF
    # 
    # skinparam defaultTextAlignment center
    # skinparam wrapWidth 400
    # skinparam maxMessageSize 150
    # skinparam StereotypeAlignment right

}
```
## Plant UML archimate example
```plantuml
@startuml
'plant uml archimate library '
!includeurl https://raw.githubusercontent.com/plantuml-stdlib/Archimate-PlantUML/master/dist/plantuml-stdlib/stdlib/archimate/Archimate.puml

title Archimate Sample - Requirement & Application Services

'Elements'
Motivation_Requirement(ReqPayrollStandard, "Do Payroll with a standard system")
Motivation_Requirement(ReqBudgetPlanning, "Do budget planning within the ERP system")

Application_Service(ASPayroll,"Payroll Service")
Application_Service(ASBudgetPlanning,"Budget Planning Service")
Application_Component(ACSAPFinanceAccRec, "SAP Finance - Accounts Recievables")
Application_Component(ACSAPHR, "SAP Human Resources")
Application_Component(ACSAPFin, "SAP Finance")
Application_Component(ACSAP,"SAP") 

'Relationships'
Rel_Realization_Up(ASPayroll, ReqPayrollStandard)
Rel_Realization_Up(ASBudgetPlanning, ReqBudgetPlanning)
Rel_Realization_Up(ACSAPFinanceAccRec, ASBudgetPlanning)
Rel_Realization_Up(ACSAPHR, ASPayroll)

Rel_Composition_Up(ACSAPFin, ACSAPFinanceAccRec)
Rel_Composition_Up(ACSAP, ACSAPFin)
Rel_Assignment_Up(ACSAP, ACSAPHR)
@enduml
```
