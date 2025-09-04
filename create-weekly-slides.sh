#!/bin/bash

# Weekly Slide Creator for CMPSC 100 (Reveal.js HTML Format)
# Usage: ./create-weekly-slides.sh <week-number> "<week-title>"

if [ $# -ne 2 ]; then
    echo "Usage: $0 <week-number> \"<week-title>\""
    echo "Example: $0 1 \"Introduction to Programming\""
    exit 1
fi

WEEK_NUM=$1
WEEK_TITLE=$2
DATE=$(date +%Y-%m-%d)
FILENAME="week${WEEK_NUM}.html"
FILEPATH="static/slides/cmpsc100/fall2025/${FILENAME}"

# Create the slide file
cat > "$FILEPATH" << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>Week WEEK_NUM: WEEK_TITLE - CMPSC 100</title>
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reveal.js@4.3.1/dist/reveal.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reveal.js@4.3.1/dist/theme/white.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reveal.js@4.3.1/plugin/highlight/monokai.css">
    
    <style>
        .reveal {
            font-family: "Arial", "Helvetica", sans-serif;
        }
        .reveal h1, .reveal h2, .reveal h3, .reveal h4, .reveal h5, .reveal h6 {
            color: #000;
            font-weight: 700;
            text-transform: none;
        }
        .reveal .slides section {
            text-align: left;
        }
        .reveal .slides section.center h1,
        .reveal .slides section.center h2,
        .reveal .slides section h1 {
            text-align: center;
        }
        .reveal .progress {
            color: #8b0000;
        }
        .reveal .controls {
            color: #8b0000;
        }
        .reveal a {
            color: #8b0000;
        }
        .reveal a:hover {
            color: #a50000;
        }
    </style>
</head>

<body>
    <div class="reveal">
        <div class="slides">
            <section class="center">
                <h1>Week WEEK_NUM: WEEK_TITLE</h1>
                <h3>CMPSC 100 - Computational Expression</h3>
                <p>Dr. Janyl Jumadinova</p>
            </section>

            <section>
                <h2>Learning Objectives</h2>
                <p>By the end of this week, you will be able to:</p>
                <ul>
                    <li class="fragment">Objective 1</li>
                    <li class="fragment">Objective 2</li>
                    <li class="fragment">Objective 3</li>
                </ul>
            </section>

            <section>
                <h2>Agenda</h2>
                <ol>
                    <li class="fragment">Topic 1</li>
                    <li class="fragment">Topic 2</li>
                    <li class="fragment">Topic 3</li>
                    <li class="fragment">Hands-on Activity</li>
                    <li class="fragment">Wrap-up</li>
                </ol>
            </section>

            <section>
                <section>
                    <h1>Topic 1</h1>
                </section>
                
                <section>
                    <h2>Topic 1 Content</h2>
                    <p>Content goes here...</p>
                </section>
            </section>

            <section>
                <section>
                    <h1>Topic 2</h1>
                </section>
                
                <section>
                    <h2>Topic 2 Content</h2>
                    <p>Content goes here...</p>
                </section>
            </section>

            <section>
                <section>
                    <h1>Topic 3</h1>
                </section>
                
                <section>
                    <h2>Topic 3 Content</h2>
                    <p>Content goes here...</p>
                </section>
            </section>

            <section>
                <section>
                    <h1>Hands-on Activity</h1>
                </section>
                
                <section>
                    <h2>Let's Practice!</h2>
                    <p>Time to apply what we've learned!</p>
                </section>
            </section>

            <section>
                <section class="center">
                    <h1>Summary</h1>
                </section>
                
                <section>
                    <h2>Key Points</h2>
                    <ul>
                        <li class="fragment">✅ Key Point 1</li>
                        <li class="fragment">✅ Key Point 2</li>
                        <li class="fragment">✅ Key Point 3</li>
                    </ul>
                </section>

                <section>
                    <h2>Next Week Preview</h2>
                    <p>Coming up next week:</p>
                    <ul>
                        <li>Preview topic 1</li>
                        <li>Preview topic 2</li>
                    </ul>
                </section>

                <section class="center">
                    <h2>Questions?</h2>
                    <p>Ready for the lab activity!</p>
                    <h3>🚀</h3>
                </section>
            </section>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/reveal.js@4.3.1/dist/reveal.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/reveal.js@4.3.1/plugin/notes/notes.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/reveal.js@4.3.1/plugin/highlight/highlight.js"></script>

    <script>
        Reveal.initialize({
            hash: true,
            transition: 'slide',
            transitionSpeed: 'default',
            controls: true,
            progress: true,
            center: true,
            touch: true,
            loop: false,
            keyboard: true,
            overview: true,
            fragments: true,
            fragmentInURL: false,
            autoAnimate: true,
            autoAnimateEasing: 'ease',
            autoAnimateDuration: 1.0,
            plugins: [ RevealHighlight, RevealNotes ]
        });
    </script>
</body>
</html>
EOF

# Replace placeholders with actual values
sed -i '' "s/WEEK_NUM/$WEEK_NUM/g" "$FILEPATH"
sed -i '' "s/WEEK_TITLE/$WEEK_TITLE/g" "$FILEPATH"

echo "Created slide deck: $FILEPATH"
echo "Don't forget to update the index page: content/slides/cmpsc100/fall2025/_index.md"
