local FeatureRestrictionManager = game:GetService("FeatureRestrictionManager")
local PlayerService = game:GetService("Players");
local TouchInputService = game:GetService("TouchInputService")
local player = PlayerService.LocalPlayer;
local PlayerGui = player.PlayerGui;
local stringValue = player:WaitForChild("ChosenGameMode")
local gameUI = PlayerGui:WaitForChild("GameUI");
local logoUI = PlayerGui:WaitForChild("LogoUI");
local informFrame = gameUI.InformFrame
local frame = gameUI.Frame;

local questionBGFrame = logoUI:WaitForChild("QuestionBGFrame");
local questionCount = 1;

--Menu Buttons
local easyButton = frame.EasyButton;
local mediumButton = frame.MediumButton;
local hardButton = frame.HardButton;
local closeButton = questionBGFrame.CloseButton

local logoImage =  questionBGFrame.LogoImage

--Options Buttons
local firstOption = questionBGFrame.FirstOption
local secondOption = questionBGFrame.SecondOption
local thirdOption = questionBGFrame.ThirdOption
local fourthOption = questionBGFrame.FourthOption

local easyFlagImagesTable = {
 "rbxassetid://83860996692092", 
 "rbxassetid://80652197149965",
 "rbxassetid://81405322744988",
 "rbxassetid://128744573930050",
 "rbxassetid://101910054873662",
 "rbxassetid://78485810421536",
 "rbxassetid://129806443242202",
 "rbxassetid://134464232496270",
 "rbxassetid://115039988411948",
 "rbxassetid://136128192062527"
}
local mediumFlagImagesTable = {
 "rbxassetid://83860996692092",
 "rbxassetid://132758433549520",
 "rbxassetid://80140113819521",
 "rbxassetid://99869988202329",
 "rbxassetid://101794487519793",
 "rbxassetid://100424502909870",
 "rbxassetid://129809071031483",
 "rbxassetid://77362622832900",
 "rbxassetid://77403625775447",
 "rbxassetid://105605981615036",
}
local hardFlagImagesTable = {
 "rbxassetid://87692771218503",
 "rbxassetid://99834950810964",
 "rbxassetid://118398383998902",
 "rbxassetid://77993732687611",
 "rbxassetid://99555330129477",
 "rbxassetid://89164939871108",
 "rbxassetid://102299995473289",
 "rbxassetid://79692723212631",
 "rbxassetid://70801772485985"
}

--Flag Multiple Choice Options
local easyFlagOptions = {
	{"Brazil","Dominican","Saudi arabia","Bangladesh"}, 
	{"Vietnam","North korea","China","Taiwan"}, 
	{"Andora", "Belgium", "France", "The Netherlands"},
	{"Russia","Germany","Croatia","Belgium"},
	{"Italy","Mexico","Iran","Hungary"},
	{"Poland", "Palau", "Bangladesh", "Japan"},
	{"Chad","Romania","Portugal","Andorra"},
	{"Spain","Mexico","Puerto Rico","Paraguay"},
	{"Australia", "New Zealand", "United Kingdom", "Bermuda"},
	{"Malaysia","Uruguay","Liberia","USA"},
}
local hardFlagOptions = {
	{"Benin","Dominican","Saudi arabia","Bangladesh"}, 
	{"Vietnam","North korea","Burundi","Taiwan"}, 
	{"Andora", "Gabon", "France", "The Netherlands"},
	{"Russia","Germany","Croatia","Georgia"},
	{"Italy","Mexico","Lesotho","Hungary"},
	{"Poland", "Palau", "Bangladesh", "Oman"},
	{"Chad","Romania","Togo","Andorra"},
	{"Spain","Uzbekistan","Puerto Rico","Paraguay"},
	{"Australia", "New Zealand", "Leone", "Bermuda"},
	{"Malaysia","Taiwan","Liberia","USA"},
}
local mediumFlagOptions = {
	{"Benin","Dominican","Saudi arabia","Brazil"}, 
	{"Vietnam","North korea","Egypt","Taiwan"}, 
	{"Andora", "Gabon", "Canada", "The Netherlands"},
	{"Russia","Israel","Croatia","Georgia"},
	{"Italy","Pakistan","Lesotho","Hungary"},
	{"Poland", "Palau", "Singapore", "Oman"},
	{"Chad","Romania","Togo","India"},
	{"Spain","Mexico","Puerto Rico","Paraguay"},
	{"Australia", "Nigeria", "Leone", "Bermuda"},
	{"Malaysia","Taiwan","Sweden","USA"},
}

local easyFlagAnswers = {"Brazil", "China", "France", "Germany", "Italy", "Japan", "Portugal", "Spain", "United Kingdom", "USA"}
local mediumFlagAnswers = {"Brazil", "Egypt", "Canada", "Israel", "Pakistan", "Singapore", "India", "Mexico", "Nigeria", "Sweden"}
local hardFlagAnswers = {"Benin", "Burundi", "Gabon", "Georgia", "Lesotho", "Oman", "Togo", "Uzbekistan", "Leone", "Taiwan"}

local function showQuestionFrame()
    frame.Visible = false
    questionBGFrame.Visible = true
    questionBGFrame:TweenPosition(UDim2.new(0.5, 0, 0.5, 0), Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.6)
    
    task.wait(0.7)
end

local function showFlagQuestion(givenFlagOptionsTable, flagImagesTable)

    logoImage.Image = flagImagesTable[questionCount]

    for i, v in pairs(givenFlagOptionsTable[questionCount]) do
        if (i == 1) then 
            firstOption.Text = v;
        elseif (i == 2) then
            secondOption.Text = v;
        elseif (i == 3) then
            thirdOption.Text = v;
        else
            fourthOption.Text = v;
        end
    end
end



easyButton.MouseButton1Click:Connect(function()
    print("inside easy")
    showFlagQuestion(easyFlagOptions, easyFlagImagesTable)
    showQuestionFrame()
    stringValue.Value = "Easy"
end)

mediumButton.MouseButton1Click:Connect(function()
    print("inside easy")
    showFlagQuestion(mediumFlagOptions, mediumFlagImagesTable)
    showQuestionFrame()
    stringValue.Value = "Medium"
end)

hardButton.MouseButton1Click:Connect(function()
    print("inside easy")
    showFlagQuestion(hardFlagOptions, hardFlagImagesTable)
    showQuestionFrame()
    stringValue.Value = "Hard"
end)

local function noMoreQuestions()
    if questionCount > #easyFlagAnswers then
        return true
    end
end

local function closeQuiz()
    questionBGFrame:TweenPosition(UDim2.new(1.5, 0, 1.5, 0), Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.6)
    questionCount = 1
    task.wait(0.7)
    questionBGFrame.Visible = false;
    frame.Visible = true
    frame:TweenPosition(UDim2.new(0.5, 0, 0.5, 0), Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.6)
end

local function informPlayer(won)
    closeQuiz()
    if won then
        informFrame.TextLabel.TextColor3 = Color3.fromRGB(19, 255, 67)
        informFrame.TextLabel.Text = "You Won!"
    else
        informFrame.TextLabel.TextColor3 = Color3.fromRGB(255, 14, 0)
        informFrame.TextLabel.Text = "You Lost"
    end
    informFrame.Visible = true
    task.wait(2.5)
    informFrame.Visible = false
end

firstOption.MouseButton1Click:Connect(function()
        print("clicked")
        print(questionCount)
        print(easyFlagAnswers[questionCount])

        local flagAnswersTable = nil
        local flagOptionsTable = nil
        local flagImagesTable = nil

        if (stringValue.Value == "Easy") then
            flagAnswersTable = easyFlagAnswers
            flagOptionsTable = easyFlagOptions
            flagImagesTable = easyFlagImagesTable

        elseif (stringValue.Value == "Medium") then
            flagAnswersTable = mediumFlagAnswers
            flagOptionsTable = mediumFlagOptions
            flagImagesTable = mediumFlagImagesTable

        elseif (stringValue.Value == "Hard") then
            flagAnswersTable = hardFlagAnswers
            flagOptionsTable = hardFlagOptions
            flagImagesTable = hardFlagImagesTable
        end

        if (firstOption.Text == flagAnswersTable[questionCount]) then
            --They Got It Right
            print("YOU GOT IT RIGHT!")
            questionCount = questionCount + 1
            if not noMoreQuestions() then
                showFlagQuestion(flagOptionsTable, flagImagesTable)
            else
                informPlayer(true)
            end
        else 
            informPlayer(false)
        end
end)

secondOption.MouseButton1Click:Connect(function()
    print("clicked")
    print(questionCount)
    print(easyFlagAnswers[questionCount])

    local flagAnswersTable = nil
    local flagOptionsTable = nil
    local flagImagesTable = nil

    if (stringValue.Value == "Easy") then
        flagAnswersTable = easyFlagAnswers
        flagOptionsTable = easyFlagOptions
        flagImagesTable = easyFlagImagesTable

    elseif (stringValue.Value == "Medium") then
        flagAnswersTable = mediumFlagAnswers
        flagOptionsTable = mediumFlagOptions
        flagImagesTable = mediumFlagImagesTable

    elseif (stringValue.Value == "Hard") then
        flagAnswersTable = hardFlagAnswers
        flagOptionsTable = hardFlagOptions
        flagImagesTable = hardFlagImagesTable
    end

    if (secondOption.Text == flagAnswersTable[questionCount]) then
        --They Got It Right
        print("YOU GOT IT RIGHT!")
        questionCount = questionCount + 1
        if not noMoreQuestions() then
            showFlagQuestion(flagOptionsTable, flagImagesTable)
        else
            informPlayer(true)
        end
    else 
        informPlayer(false)
    end
end)
thirdOption.MouseButton1Click:Connect(function()
    print("clicked")
    print(questionCount)
    print(easyFlagAnswers[questionCount])

    local flagAnswersTable = nil
    local flagOptionsTable = nil
    local flagImagesTable = nil

    if (stringValue.Value == "Easy") then
        flagAnswersTable = easyFlagAnswers
        flagOptionsTable = easyFlagOptions
        flagImagesTable = easyFlagImagesTable

    elseif (stringValue.Value == "Medium") then
        flagAnswersTable = mediumFlagAnswers
        flagOptionsTable = mediumFlagOptions
        flagImagesTable = mediumFlagImagesTable

    elseif (stringValue.Value == "Hard") then
        flagAnswersTable = hardFlagAnswers
        flagOptionsTable = hardFlagOptions
        flagImagesTable = hardFlagImagesTable
    end

    if (thirdOption.Text == flagAnswersTable[questionCount]) then
        --They Got It Right
        print("YOU GOT IT RIGHT!")
        questionCount = questionCount + 1
        if not noMoreQuestions() then
            showFlagQuestion(flagOptionsTable, flagImagesTable)
        else
            informPlayer(true)
        end
    else
        informPlayer(false)
    end
end)

fourthOption.MouseButton1Click:Connect(function()
    print("clicked")
    print(questionCount)
    print(easyFlagAnswers[questionCount])

    local flagAnswersTable = nil
    local flagOptionsTable = nil
    local flagImagesTable = nil

    if (stringValue.Value == "Easy") then
        flagAnswersTable = easyFlagAnswers
        flagOptionsTable = easyFlagOptions
        flagImagesTable = easyFlagImagesTable

    elseif (stringValue.Value == "Medium") then
        flagAnswersTable = mediumFlagAnswers
        flagOptionsTable = mediumFlagOptions
        flagImagesTable = mediumFlagImagesTable

    elseif (stringValue.Value == "Hard") then
        flagAnswersTable = hardFlagAnswers
        flagOptionsTable = hardFlagOptions
        flagImagesTable = hardFlagImagesTable
    end

    if (fourthOption.Text == flagAnswersTable[questionCount]) then
        --They Got It Right
        print("YOU GOT IT RIGHT!")
        questionCount = questionCount + 1
        if not noMoreQuestions() then
            showFlagQuestion(flagOptionsTable, flagImagesTable)
        else 
            informPlayer(true)
        end
    else
        informPlayer(false)
    end
end)


closeButton.MouseButton1Click:Connect(function()
    closeQuiz()
end)
