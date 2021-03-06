
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#


function() {
    fluidPage(
        div(style="padding: 1px 0px; width: '100%'",
            titlePanel(
                title="", windowTitle="VisCello: C. elegans Embryogenesis Visualizer"
            )
        ),
        tags$head(tags$style(HTML("body{ background: #F7F7F7; }"))),
        #tags$head(tags$style(type="text/css", ".container-fluid {  max-width: 1500px; /* or 950px */}")),
        navbarPage(
    title = div(
        "C. elegans Embryogenesis",
        div(
            id = "sys_control",
            dropdownButton(
                inputId="load_state_dropdown",
                actionButton("exit_app","Exit App", icon = icon("power-off"), width = "115px", class = "btn-primary", onclick = "setTimeout(function(){window.close();}, 100); "),
                tags$br(),
                fluidRow(column(12,downloadButton("state_save_sc","Save State", icon = icon("save"),class = "btn-primary", style="float:left;width: 115px"))),
                tags$br(),
                fileInput2('uploadState', NULL, buttonLabel = "Load State", width = "50px", accept = ".rda"),
                uiOutput("refreshOnUpload"),
                circle = T, label ="System Control", tooltip=T, right = T,
                status = "syscontrol",
                icon = icon("cog")
            )
        )
    ),
    position = "fixed-top",
    theme = shinytheme("flatly"),
    # Application title
    tabPanel(
        "Cell Type",
        mainPanel(
            NULL,
            width = 12,
            tags$head(
                tags$link(rel = "stylesheet", type = "text/css", href = "custom.css")
            ),
            singleton(tags$script(type="text/javascript", "
                                  $(document).ready(function() {
                                  $('input[type='text'], textarea').attr({autocomplete:'off', spellcheck:false, autocorrect:'off', autocapitalize:'off'});

                                  ")),
            singleton(tags$script(type="text/javascript", "
                                  $(document).ready(function() {
                                  Shiny.addCustomMessageHandler('showalert', function(message) {
                                  alert(message);
                                  });
                                  });
                                  ")
            ),
            explorer_ui("main"),
            
            tags$br(),
            tags$br(),
            tags$br(),
            tags$br(),
            tags$br(),
            tags$br(),
            tags$br()
            #downloadButton('download_ct_tbl', 'Download',class = "btn_rightAlign")
        )
    ),
    tabPanel(
        "Early Lineage",
        explorer_ui("early")
    ),
    tabPanel(
        "Lineage Tree",
        tree_ui("lin")
    ), 
    tabPanel(
        "Differential Expression",
        de_ui("cel")
    ),
    # tabPanel(
    #     "Tutorial",
    #     tags$p("To be added.")
    # ),
    header = tagList(
        tags$br(),
        tags$br(),
        tags$br(),
        tags$br()
    ),

    footer = tagList(
        tags$br(),
        tags$br(),
        tags$br(),
        tags$br()
    )
            )
        )
}
