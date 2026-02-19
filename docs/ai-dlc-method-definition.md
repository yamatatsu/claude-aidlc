# AI-Driven Development Lifecycle (AI-DLC) Method Definition

*Raju SP, Amazon Web Services*

## I. CONTEXT

The evolution of software engineering has been a continuous quest to enable developers to focus on solving complex problems by abstracting away lower-level, undifferentiated tasks. From early machine code to high-level programming languages and the rise of frameworks, each advancement has aimed to boost developer productivity. Now, the integration of Large Language Models has revolutionized how software is created, introducing conversational natural language interactions for tasks like code generation, bug diagnosis, and test writing. This marks the **AI Assisted** era, where AI enhances such fine-grained, specific tasks.

As AI evolves, its applications are expanding beyond code generation to include requirements elaboration, planning, task decomposition, design, and real-time collaboration with developers. This shift is kick-starting the **AI-Driven** era, where AI becomes a central collaborator. However, existing traditional software development methods, designed for human-driven, long-running processes, are not fully aligned with AI's speed, flexibility, and advanced capabilities (ex. agentic). Their reliance on manual workflows and rigid role definitions limits the ability to fully leverage AI. Rethinking AI into these methods not only limits its potential, but also reinforces outdated inefficiencies. To unlock AI's transformative power, the development paradigm must be reimagined. This reimagination requires AI to be a central collaborator, aligning workflows, roles, and iterations to enable faster decision-making, seamless task execution, and continuous adaptability.

This paper introduces and defines the **AI-Driven Development Lifecycle (AI-DLC)**, a reimagined, AI-native methodology designed to fully integrate the capabilities of AI, setting the foundations for the next evolution in software engineering.

## II. KEY PRINCIPLES

The principles in this section form the foundation for defining AI-DLC, shaping its phases, roles, artifacts, and rituals. These assumptions are critical for validating the proposed method, as they provide the lens of underpinning reasoning behind its design.

### 1. REIMAGINE RATHER THAN RETROFIT

We choose to reimagine a development method rather than keeping the existing methods like SDLC or Agile (e.g., Scrum) and retrofitting AI into them. These traditional methods were built for longer iteration duration (months and weeks), which led to rituals like daily standups and retrospectives. In contrast, proper application of AI leads to rapid cycles, measured in hours or days. This needs continuous, real-time validation and feedback making many existing rituals (ex. sprint retrospectives) less relevant. Would effort estimation (ex. story points) be as critical if AI diminishes the boundaries between design, medium and hard tasks? Would metrics like velocity be any relevant or should we start replacing it with throughput (ex. features/hr)? Also, AI shifts the focus from software development patterns (ex. planning, task decomposition, requirements analysis, application of design techniques (ex. TDD, refactoring)), to shortening the number of phases it takes from moving intentions to code. These new dynamics warrant a **reimagining** on first principles thinking, rather than a "retrofitting. We need automobiles and not just faster horse chariots.

### 2. REVERSE THE CONVERSATION DIRECTION

AI-DLC intentionally reverses the traditional direction: **AI initiates & directs the conversations** with humans instead of humans initiating and directing AI for low-level tasks. AI drives workflows by breaking down high-level intents (ex. implementing a new feature) into smaller, actionable tasks, and actively engages humans at key decision-making junctures to serve as approvers, validating, selecting options, and confirming decisions at critical junctures. This reversal fundamentally allows developers to focus on high-value decision-making while AI handles planning, task execution, and autonomous code generation. The reasoning behind this shift in human-AI involvement is purposeful, concentrating on oversight, risk mitigation, and ensuring both business logic alignment, and both velocity and quality. An analogy to illustrate this is Google Maps: humans set the destination (the intent), and the app provides humans with the route options (the decomposition and recommendations). Along the way, humans maintain oversight and moderate the journey as needed.

### 3. INTEGRATION OF DESIGN TECHNIQUES INTO THE CORE

Agile frameworks like Scrum or Kanban leaves the design techniques (ex. Domain Driven Design) out of scope and recommends the teams to choose their own. This has left critical whitespaces that led to poor software quality (Taibi, Lenarduzzi & Pahl, 2022 ([study](https://study)). Rather than decoupling design techniques out, AI-DLC will have them as its integral core. There will be different flavors of AI-DLC for teams following Domain Driven Design (DDD), Behavior Driven Development (BDD) or Test-Driven Development (TDD) respectively. This paper **excludes the DDD** flavor of AI-DLC which will use DDD principles to break down systems into independent, right-sized bounded contexts that can be rapidly built in parallel. AI will inherently apply these techniques in each phase, enabling developers to focus on developers only to validate and adjust. This integration is key to enabling hourly or daily cadences (the mantra of "Build Systems Faster").

### 4. ALIGN WITH AI CAPABILITY

This principle is articulate about the key constraint of AI as of today: AI is realistic about its current state: AI-DLC recognizes that current AI is advancing but not yet reliable in autonomously translating high-level intentions into executable code or independently operating without human oversight, while also ensuring **explainability and intentional design** behind the generated paradigm, where developers perform the majority of the intellectual heavy lifting with AI merely providing augmentation, fails to unlock the full potential of AI in development. AI-DLC adopts the **Alloment paradigm**, which balances human oversight with AI autonomy. In this configuration, while humans must retain this, the **developers retain ultimate responsibility for validation, decision-making, and oversight**. This balance ensures that the strengths of AI are leveraged effectively without compromising the critical role of human judgment.

### 5. CATER TO BUILDING COMPLEX SYSTEMS

AI-DLC caters to building systems that demand continuous functional adaptability, **high architectural complexity**, numerous dependencies, security hardening, and extensive customization requirements. These necessitate the application of advanced design techniques, patterns, and best practices, typically involving **multiple teams working cohesively** within large and/or regulated organizations. Simpler systems that can be built end-to-end by solo developers with minimal formal or ad trade-off management are outside the scope of AI-DLC and are better suited for low-code/no-code platforms.

### 6. RETAIN WHAT ENHANCES HUMAN SYMBIOSIS

While reimagining the method, we will retain the artifacts and touchpoints from the existing methods that are critical for human validation and risk mitigation. For instance, user stories align humans' and AI's understanding of what needs to be built, acting as a shared context. These stories will be retained and optimized in the re-imagined method also. Another example is the Risk Register that ensures AI-generated plans and codes comply with organizational risk frameworks. These retained elements will be optimized for real-time use, allowing rapid iterations without compromising alignment or safety.

### 7. FACILITATE TRANSITION THROUGH FAMILIARITY

The new method shall not demand extensive trainings and any existing practitioner should be able to orient and start practicing it in a single day. To support easier adoption via associative thinking, AI-DLC deliberately reuses terminology and concepts between familiar terms in older methods while introducing modernized terminology. For example, in Scrum we qualify 4 to 6 weeks of work as a Sprint. AI-DLC borrows the name "Sprint", but refers them as Bolts. Therefore, we need to intentionally rename Sprints. AI-DLC renames Sprints as Bolts, emphasizing rapid, intense cycles that deliver unprecedented velocity.

### 8. STREAMLINE RESPONSIBILITIES FOR EFFICIENCY

By leveraging AI's ability to perform task decomposition, and planning, combined with automation for generating deployment artifacts, AI-DLC reduces the dependency on overly granular traditional specialization silos such as infrastructure, front-end, back-end, DevOps, QA, and security specialists. The emergence of responsibilities reduces the need for multiple specialized roles, streamlining the development process. Team Owners and Developers assume broader, cross-functional oversight responsibilities for oversight, validation, and strategic decision-making. These roles ensure alignment with business objectives, maintain design quality, and maintain compliance with risk management frameworks, preserving critical human oversight between developers and technical specialists. In smaller teams, we will stick to first principles, keeping the roles minimum, with additional roles introduced only when critically necessary.

### 9. MINIMISE STAGES, MAXIMISE FLOW

Through automation and convergence of responsibilities, AI-DLC aims to minimize the number of phases and transitions, enabling continuous iterative flow. But human validation and decision-making remain critical to ensure that AI-generated outcomes does not fail. A fully autonomous flow, devoid of human validations across iterations. To address this, AI-DLC incorporates minimal but sufficient number of phases (each phase with a level of human oversight at critical decision junctures. These validations act as a set of "loss functions", analogous to gradient descent during downstream efforts before they occur.

### 10. NO HARD-WIRED, OPINIONATED SDLC WORKFLOWS

AI-DLC avoids prescribing opinionated workflows for different development pathways (ex. new feature development, refactoring, defect fixes, or microservice scaling). Instead, it adapts a truly AI-First approach inspired by the Level 1 Plan based on the given pathway intention. Humans verify and moderate these AI-generated plans through interactive dialogue with the AI to approve or reject specific steps, or request changes in subsequent hierarchy levels. At the task execution level, AI implements the tasks while humans maintain oversight through verification and validation of outcomes. This flexible approach ensures the methodology is adaptable and can evolve alongside AI capabilities while maintaining human control over critical decisions.

## III. CORE FRAMEWORK

This section outlines the core framework of AI-DLC, detailing its phases, roles, workflows, and key artifacts.

### AI-DLC

[Framework Diagram - showing Intent, Unit, and Bolt hierarchy with Development Units and associated phases]

### 1. ARTEFACTS

#### Intent

An **Intent** in AI-DLC is a high-level statement of purpose that encapsulates what needs to be achieved, whether a new feature, an enhancement, performance optimization, or scaling). It serves as the starting point for AI-driven decomposition into actionable tasks, aligning human design with AI-generated plans.

#### Unit

A **Unit** represents a cohesive, self-contained work package designed to deliver measurable value. For instance, an Intent to implement a business idea may be decomposed into Units representing independent functional blocks, analogous to Subdomains in DDD or Epics in Scrum. Each Unit encapsulates a set of tasks (user stories, technical tasks, etc.) to be completed within a Unit. In the context of AI-DLC, the process of decomposing Intents into Units is driven by AI, with developers and/or Product Owners validating and refining the resulting Units to ensure alignment with business and technical objectives. The units are **loosely coupled**, enabling autonomous development and independent deployment downstream.

#### Bolt

A **Bolt** is the smallest iteration in AI-DLC, designed for the rapid implementation of a Unit or a set of tasks within a Unit. Bolts (analogous to Sprints in Scrum) emphasize intense focus and high-velocity delivery, with build-validation cycles measured in hours or days rather than weeks. Each Bolt encapsulates a well-defined scope containing its objectives, success criteria and duration. The Domain Design artefact models the core business logic of a Unit, independently of the infrastructure components. In the first version of AI-DLC, AI uses domain-driven design principles to create the strategic and tactical modeling elements including aggregates, value objects, entities, domain events, repositories and factories. The Logical Design translates domain concepts into concrete data models aligning with technical requirements using the right choice of architectural design patterns (ex. CQRS, Circuit Breakers etc.). AI creates the Architecture Decision Records (ADRs) for validation by the Developers. With the Logical Design specification, AI will conduct unit testing, analyze the results and provide recommendations on fixes to the Developer.

The **Deployment Units** are the operational artifacts encompassing the packaged executable code (ex. container images for Kubernetes workloads, serverless functions such as AWS Lambda), configurations (ex. Helm Charts), and infrastructure constructs (ex. Terraform or CDK stacks) that are deployed. The AI creates these artifacts in an automated manner. AI generates all associated tests, including functional tests, static and dynamic security tests, and load testing scenarios. After the human validation and adjustments on the test scenarios and cases, the AI agent executes the test suits, analyses the results and provides recommendations on fixes to the Developers. Continuous refinement of design decisions and architectures. Thus, these units are rigorously tested for functional acceptance, security compliance, adherence to non-functional requirements (NFRs), and mitigation of operational risks, ensuring their readiness for seamless deployment.

### 2. PHASES & RITUALS

#### Inception Phase

The **Inception Phase** focuses on capturing **intents** and translating them into actionable plans via a ritual called **"Mob Elaboration"**, a collaborative requirements elaboration and decomposition ritual. This happens in a single room with a shared screen led by a facilitator. During Mob Elaboration, AI plays a central role in proposing an initial breakdown of the Intent into User Stories, Acceptance Criteria and Units, leveraging domain knowledge, and the principles of loose coupling and high cohesion. The **Product Owner**, Developers, QA and other relevant stakeholders (the mob) collaboratively review and refine these AI-generated parts and aligning them with real-world constraints. The outputs encapsulate components containing a) PRFAQs, b) User Stories, c) Non-Functional Requirement (NFR) definitions, d) Description of Risks for Mitigation Plan, e) Non-Functional Requirements (NFRs) and Measurement Criteria that traces to the business intent and the f) Suggested bolts using which the Units can be constructed. Mob Elaboration condenses weeks or even months of sequential work into a few hours, while achieving better alignment both within the mob and between the mob and the AI.

#### Construction Phase

The **Construction Phase** The encompasses the transformation of Units into operation-ready Deployment Units. This phase progresses through Domain Design, where AI models the business logic independently of technical considerations, to Logical Design, where non-functional requirements are incorporated into a semantic-rich modeling representation of components. In this phase, AI transforms the Units defined during the Inception Phase into tested, operations-ready Deployment Units. This phase progresses through Domain Design, where AI models the business logic independently of technical considerations, to logical Design, where non-functional requirements are refined into semantic-rich models of the actual system components. At the logical-design model stage, make decisions and deliver their Bolts. AI can calls this the mob-construction ritual.

##### The following bullet points outline the key activities involved in this phase, focusing on the Mob Programming and Mob Testing rituals.

a. The Developer establishes the session with AI. AI prompts the developer to begin with the Unit assigned to them.
b. AI models the core business logic for the assigned Unit using Domain-Driven Design principles. Example: For the "Recommendation Algorithm" Unit, AI identifies relevant entities like Product, Customer, and Purchase History and creates code to implement collaborative filtering and integrates it with a DynamoDB data source)

It also auto-generates functional, security, and performance tests (e.g., For the "Recommendation Algorithm" Unit, AI creates code to implement collaborative filtering and integrates it with a DynamoDB data source)

d. AI translates the domain models into logical designs, applying NFRs like scalability and fault tolerance. Example: AI recommends architectural patterns (e.g., event-driven architecture for large-scale real-time computation).
e. Developers evaluate AI's recommendations, approve trade-offs, and suggest additional considerations if needed. (e.g., Accepts Lambda for the scalability but overrides the storage to S3+Athena instead of DynamoDB).
f. AI generates executable code for each Unit, mapping logical components to specific AWS services.

[Workflow Diagram showing AI (Domain Specific AI Agent) and Product Owners, Developers interaction flow]

g. It also auto-generates functional, security, and performance tests (e.g., For the "Recommendation Algorithm" Unit, AI creates code to implement collaborative filtering and integrates it with a DynamoDB data source)

##### Testing and Validation:

a. AI Executes all tests (functional, security, and performance), analyzes results, and highlights issues.
b. Developers review test results/cases, e.g., optimizing query logic for better performance.
c. Developers validate AI's findings, approve fixes, and rerun tests as needed.

#### Operations Phase

The **Operations Phase** in AI-DLC centers on the deployment, observability, and maintenance of systems, leveraging AI for operational efficiency. AI actively analyzes telemetry data, including metrics, logs, and traces, to detect patterns, identify anomalies, and predict potential SLA violations, enabling proactive issue resolution. Additionally, AI integrates with predefined incident runbooks, proposing actionable remediations for detected anomalies. Example: AI recommends increasing DynamoDB throughput or rebalancing API Gateway traffic.

AI integrates with playbooks to suggest actions for detected anomalies (e.g., trigger auto-scaling, recommend capacity increases), developers approve proposed mitigations, and monitor resolution outcomes.

### 3. THE WORKFLOW

[Workflow Diagram showing iterative process through Inception, Construction, and Operations phases with Bolts and feedback loops]

Given a business intent (ex. Green-field development, Brown-field enhancement, modernization, or defect fixng), AI-DLC begins by prompting developers to articulate a Level 1 plan. This initial proposal, which is then transparently reviewed, validated, and iteratively refined, forming a series of transparency goals and AI engineering constraints. At the heart of AI-DLC is the principle of applying transparency through humans at each phase for the next. Each step serves as a strategic decision point where human developers make **final decisions**, but always in real-time, with AI correcting errors early before they snowball downstream. The repeats recursively for each step through the final validation under human oversight to ensure accuracy and domain-appropriateness.

All artifacts generated (intents, user stories, domain models, or test plans) are opened and serve as a "context memory" that the AI references across the lifecycle. Like traditional SDLC methods, AI-DLC is inherently iterative, enabling continuous refinement and adaptation. Additionally, all artifacts are linked, allowing for backwards and forwards traceability (ex. connecting domain models to test cases, deployment artifacts, or incident resolutions). This continuous linking maintains alignment between AI retrieves the correct and most relevant context at every stage. Throughout the process, AI performs the strategic planning, task decomposition, generation etc., and humans provide the oversight and validation.

## IV. AI-DLC IN ACTION: Green-Field Development

We will examine the scenario in which the Product Owner commences the process by articulating a high-level intent, such as for a new green-field project. AI Recognizes this as an intent to build a new application and produces the Level 1 plan like the Workflow steps in the above section. The team validates, verifies and auto/Drives the stages in the level 1 plan. With the finalized Level 1 Plan, AI recursively decomposes it to Level 2, Level 3 and so forth. Level 2 to interact and provide oversights to AI.

### 1. INCEPTION PHASE

The following bullet outline the key interactions in the Mob Elaboration ritual.

a. AI asks clarifying questions (e.g., "Who are the primary users? What key business outcomes should this achieve?"), ensuring a comprehensive understanding of the goal and minimize the risk of misalignment.
b. AI decomposes the high-level intent into **user stories, non-functional requirements (NFRs), and risk descriptions**. The team validates these artifacts and provides oversight, and the corrections needed to AI.
c. AI organizes these cohesive stories into **Units**, e.g., "User Data Collection", "Recommendation Algorithm Selection", and "API Integration".
d. The Product Owner validates these outputs, adjusting wherever needed to refine the Units. Example: The Product Owner suggests renaming "Data Collection" tasks; primary concerns; and GDPR-specific considerations.
e. AI generates a **PRFAQ** for the module (optional), summarizing the business intent, functionality, and expected outcomes.
f. Developers and Product Owners validate the PRFAQ and associated risks, ensuring alignment with the overall objectives.

### 2. CONSTRUCTION PHASE

The following bullet points outline the key activities involved in this phase, focusing on the Mob Programming and Mob Testing rituals.

a. The Developer establishes the session with AI. AI prompts the developer to begin with the Unit assigned to them.
b. AI models the core business logic for the assigned Unit using Domain-Driven Design principles. Example: For the "Recommendation Algorithm" Unit, AI identifies relevant entities like Product, Customer, and Purchase History and creates cohesive.
c. Developers review and validate the domain models, refining business logic and ensuring alignment with real-world scenarios (e.g., how to handle missing purchase history for new customers)

d. AI translates the domain models into logical designs, applying NFRs like scalability and fault tolerance. Example: AI recommends architectural patterns (e.g., event-driven architecture for large-scale real-time computation).
e. Developers evaluate AI's recommendations, approve trade-offs, and suggest additional considerations if needed. (e.g., Accepts Lambda for the scalability but overrides the storage to S3+Athena instead of DynamoDB).
f. AI generates executable code for each Unit, mapping logical components to specific AWS services.

g. It also auto-generates functional, security, and performance tests (e.g., For the "Recommendation Algorithm" Unit, AI creates code to implement collaborative filtering and integrates it with a DynamoDB data source)

h. Developers review the generated code and test scenarios/cases, making adjustments where necessary to ensure quality and compliance.

##### Testing and Validation:

a. AI Executes all tests (functional, security, and performance), analyzes results, and highlights issues.
b. Developers review test results/cases, e.g., optimizing query logic for better performance.
c. Developers validate AI's findings, approve fixes, and rerun tests as needed.

### 3. OPERATIONS PHASE

The operations phase activities in the brown-filed are same as that of the green-filed.

## V. AI-DLC IN ACTION: Brown-Field Development

Brown field refers to making changes to an existing system in terms of either adding new features, optimizing it for non-functional requirements or fixing technical debts including refactoring and fixing defects. In this context, we will examine a scenario where the product manager needs to add a new feature to an existing application.

### 1. INCEPTION PHASE

The inception phase activities in the brown-filed are same as that of the green-filed.

### 2. CONSTRUCTION PHASE

a. AI elevates the codes into a higher-level modelling representation. The models comprise of static models (components, descriptions, responsibilities and inter-dependencies among them) and dynamic models (how the components interact to realise the most significant use cases)
b. Developers collaborate with product managers to review, validate and correct the static and dynamic models that are reverse engineered by AI.
c. From there onwards, the rest of the construction phase is similar to that of the green-field scenario.

### 3. OPERATIONS PHASE

The operations phase activities in the brown-filed are same as that of the green-field.

## VI. ADOPTING AI-DLC

AI-DLC can be adopted in any organization using any Agile variant, and it is designed with easier adoption as a key outcome. Still, organizations that are pre-Agile in the traditional Waterfall, V-longer and those who are in the process of inventing their own variation of AI-Native methodologies. Developers (ex. We believe the following 2 approaches will make this easier.

a. Learning by Practicing – AI-DLC is actually a set of rituals (Mob Elaboration, Mob Construction etc.) that can be practiced as a group. Interested teams can run a live workshop session and traditional trainings, we will get the practitioners to actually practice AI-DLC in simulating real-world scenarios that are currently being solved by the practitioners. The AWS Solution Architects (propose created a field offering called AI-DLC Unicorn Gym that packages this approach into a ready-to-run workshop for organizations.

b. By embedding AI-DLC in the new Developer Experience Tooling – our customers are building their own orchestration with DX products that they are building (e.g. their developers (ex. [flowSource](https://flowSource) from Cognizant, [CodeSpell](https://CodeSpell) by Aspire, [AIForge](https://AIForge) by HCL etc.) By embedding AI-DLC in these tools, the developers in large organizations will seamlessly practice AI-DLC without any need for significant adoption drivers.

## APPENDIX A

The following prompts can be used to interact with AI for practicing AI-DLC.

### ##Setup Prompt

We will work on building an application today. For every front end and backend component we will create a project folder all documents will reside in the aidlc-docs folder. Throughout our session I'll ask you to plan your work ahead and create an md file for the plan. You may work only after I approve said plan. These plans will always be stored in aidlc-docs/plans folder. You will always ask me for review and approval. These plans folder. requirements folder. User stories must be stored in the aidlc-docs/user_stories.md file. Architecture and Design documents must be stored in the aidlc-docs/design-artifacts folder. All feature-specific or functional-changes documents will reside in aidlc-docs/requirements folder. User stories must be stored in the aidlc-docs/prompts.md file. Confirm your understanding of this prompt. Create/update the necessary folders and files for storage. If they do not exist already.

### ##Inception

#### ## User stories

Your Role: You are an expert product manager and are tasked with creating well defined user stories that becomes the contract for developing the system as mentioned in the Task section below. Plan for the work ahead and write your steps in an md file (user_stories_plan.md) with checkboxes for each step in the plan. If any step needs my clarification, add a note in the step to get my confirmation. Upon completing the plan, ask for my review and approval. After my approval, you can go ahead to execute the same plan one step at a time. Once you finish each step, mark the checkboxes as done in the plan.

<<<After reviewing and changing the plan>>>

Yes, I like your plan as in the <<md file>>. Now exactly follow the same plan. Interact with me as specified in the plan. Once you finish each step, mark the checkboxes as done in the plan.

### ## Units

Your Role: You are an experienced software architect. Before you start the task as mentioned below, please do the planning and write your steps in an md file with checkboxes against each step in the plan. If any step needs my clarification, please add it to the step to interact with me and get my confirmation. Do not make critical decisions on your own. Once you produce the plan, ask for my review and approval. After my approval, you can go ahead to execute the same plan one step at a time. Once you finish each step, mark the checkboxes as done in the plan.

Your Task: Refer to the task from the user_stories_plan.md file. Group the user stories into multiple units that can be built in parallel. Each unit should be built by a single team in a single sprint. Deliver one unit at a time. The units are loosely coupled to each other. For each unit, write their own design folder as user_stories.md with a description, acceptance criteria in individual md files in the design/ folder.

<<<After reviewing and changing the plan>>>

I approve. Proceed.

### ##Construction

#### ## Domain (component) model creation

Your Task: You are an expert software engineer and are tasked with writing the component model. Please don't start the task as mentioned below, please do the planning and write your steps in an md file with checkboxes against each step in the plan. If any step needs my clarification, please add it to the step to interact with me and get my confirmation. Do not make critical decisions on your own. Once you produce the plan, ask for my review and approval. After my approval, you can execute the same plan one step at a time. Once you finish each step, mark the checkboxes as done in the plan.

Your Task: Refer to the user stories in the <<design/<<unit_id>>/user_stories.md file, optimised>>  Model to implement all the user stories. This model shall contain all the components, the attributes, the behaviors and the inter-dependencies. We will not generate any codes yet. Write the component model into a separate md file in the /design folder.

<<<After reviewing and changing the plan>>>

I approve the plan. Proceed. After completing each step, mark the checkbox in your plan file.

#### ## Code Generation

Your Role: You are an experienced software engineer. Before you start the task as mentioned below, please do the planning and write your steps in an md file with checkboxes against each step in the plan. If any step needs my clarification, please add it to the step to interact with me and get my confirmation. Do not make critical decisions on your own. Once you produce the plan, ask for my review and approval. After my approval, you can go ahead to execute the same plan one step at a time. Once you finish each step, mark the checkboxes as done in the plan.

Task: Refer to component design in the search_discovery/<<file_name>>/component_model.md file. Generate a very simple and intuitive Python code to implement the design using Natural Language Processing (NLP) Component that is in the design. For processQuery(queryText) method, use amazon bedrock APIs to generate for processQuery call. For the createDataset/download I will use the local vocabulary_repository. Can you analyse and give me a plan on how I can leverage GenAI for both the Entity Extraction and Intent Extraction.

#### ## Architecture

Your Role: You are an experienced Cloud Architect. Before you start the task as mentioned below, please do the planning and write your steps against each step in the plan. If any step needs my clarification, please add it to the step to interact with me and get my confirmation. Do not make critical decisions on your own. Once you produce the plan, ask for my review and approval. After my approval, you can go ahead to execute the same plan one step at a time. Once you finish each step, mark the checkboxes as done in the plan.

Task: Refer to component design model: design/core_component_model.md, units in the UNITS/ folder, cloud architecture in the ARCHITECTURE/ folder, and backend code in the BACKEND/ folder. Complete the following:
- Generate a end-to-end end plan for deployment of the backend on AWS complete with all AWS services. Document it in the ADR.
- Document all the pre-requisites for the deployment, if any. Once I approve the plan:
- Follow the best practices of Infrastructure as a deployable coding.
- All output code must be in the DEPLOYMENT/ folder.
- All deployment & configuration files must be deployed, by creating a validation plan, generate a validation report.
- Review the validation report and fix all identified issues, update the validation report.

#### ## Build DLC/Rest API

Your Role: You are an experienced software engineer. Before you start the task as mentioned below, please do the planning and write your steps in an md file with checkboxes against each step in the plan. If any step needs my clarification, please add it to the step to interact with me and get my confirmation. Do not make critical decisions on your own. Once you produce the plan, ask for my review and approval. After my approval, you can go ahead to execute the same plan one step at a time. Once you finish each step, mark the checkboxes as done in the plan.

Task: Refer to the services.py under the construction/<<>/> folder. Create python flask apis for each of the service there.