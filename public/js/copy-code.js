// Add copy buttons to all code blocks
document.addEventListener('DOMContentLoaded', function() {
    // Find all code blocks
    const codeBlocks = document.querySelectorAll('pre');
    
    codeBlocks.forEach(function(codeBlock) {
        // Create wrapper div
        const wrapper = document.createElement('div');
        wrapper.style.position = 'relative';
        
        // Create copy button
        const copyButton = document.createElement('button');
        copyButton.className = 'copy-code-button';
        copyButton.textContent = 'Copy';
        copyButton.setAttribute('aria-label', 'Copy code to clipboard');
        
        // Style the button
        copyButton.style.position = 'absolute';
        copyButton.style.top = '8px';
        copyButton.style.right = '8px';
        copyButton.style.padding = '6px 12px';
        copyButton.style.backgroundColor = '#4a5fc1';
        copyButton.style.color = 'white';
        copyButton.style.border = 'none';
        copyButton.style.borderRadius = '4px';
        copyButton.style.cursor = 'pointer';
        copyButton.style.fontSize = '12px';
        copyButton.style.fontWeight = 'bold';
        copyButton.style.zIndex = '10';
        copyButton.style.transition = 'all 0.2s ease';
        
        // Add hover effect
        copyButton.addEventListener('mouseenter', function() {
            this.style.backgroundColor = '#3a4fa1';
        });
        
        copyButton.addEventListener('mouseleave', function() {
            if (this.textContent === 'Copy') {
                this.style.backgroundColor = '#4a5fc1';
            }
        });
        
        // Copy functionality
        copyButton.addEventListener('click', function() {
            const code = codeBlock.querySelector('code');
            const textToCopy = code ? code.textContent : codeBlock.textContent;
            
            navigator.clipboard.writeText(textToCopy).then(function() {
                // Success feedback
                copyButton.textContent = 'Copied!';
                copyButton.style.backgroundColor = '#27ae60';
                
                // Reset after 2 seconds
                setTimeout(function() {
                    copyButton.textContent = 'Copy';
                    copyButton.style.backgroundColor = '#4a5fc1';
                }, 2000);
            }).catch(function(err) {
                console.error('Failed to copy code:', err);
                copyButton.textContent = 'Error';
                copyButton.style.backgroundColor = '#e74c3c';
                
                setTimeout(function() {
                    copyButton.textContent = 'Copy';
                    copyButton.style.backgroundColor = '#4a5fc1';
                }, 2000);
            });
        });
        
        // Wrap the code block and add button
        codeBlock.parentNode.insertBefore(wrapper, codeBlock);
        wrapper.appendChild(codeBlock);
        wrapper.appendChild(copyButton);
    });
});
