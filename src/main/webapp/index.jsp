<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Animated Cursor Cat</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            overflow: hidden;
            cursor: none;
            position: relative;
        }

        .container {
            position: relative;
            width: 100%;
            height: 100vh;
        }

        .content {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            text-align: center;
            color: white;
            z-index: 1;
        }

        .content h1 {
            font-size: 3rem;
            margin-bottom: 1rem;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
            animation: float 3s ease-in-out infinite;
        }

        .content p {
            font-size: 1.2rem;
            opacity: 0.9;
            text-shadow: 1px 1px 2px rgba(0,0,0,0.3);
        }

        @keyframes float {
            0%, 100% { transform: translate(-50%, -50%) translateY(0px); }
            50% { transform: translate(-50%, -50%) translateY(-10px); }
        }

        .cat {
            position: absolute;
            width: 80px;
            height: 80px;
            pointer-events: none;
            z-index: 1000;
            transition: transform 0.1s ease-out;
        }

        .cat-body {
            position: relative;
            width: 100%;
            height: 100%;
        }

        .cat-head {
            position: absolute;
            top: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 50px;
            height: 45px;
            background: #ff6b6b;
            border-radius: 50% 50% 45% 45%;
            box-shadow: 0 2px 8px rgba(0,0,0,0.2);
        }

        .cat-ear {
            position: absolute;
            width: 0;
            height: 0;
            border-style: solid;
        }

        .cat-ear.left {
            top: -8px;
            left: 5px;
            border-width: 0 8px 15px 8px;
            border-color: transparent transparent #ff6b6b transparent;
            transform: rotate(-20deg);
        }

        .cat-ear.right {
            top: -8px;
            right: 5px;
            border-width: 0 8px 15px 8px;
            border-color: transparent transparent #ff6b6b transparent;
            transform: rotate(20deg);
        }

        .cat-ear-inner {
            position: absolute;
            width: 0;
            height: 0;
            border-style: solid;
        }

        .cat-ear-inner.left {
            top: 3px;
            left: -3px;
            border-width: 0 4px 8px 4px;
            border-color: transparent transparent #ffb3ba transparent;
            transform: rotate(-20deg);
        }

        .cat-ear-inner.right {
            top: 3px;
            right: -3px;
            border-width: 0 4px 8px 4px;
            border-color: transparent transparent #ffb3ba transparent;
            transform: rotate(20deg);
        }

        .cat-eye {
            position: absolute;
            width: 6px;
            height: 8px;
            background: #333;
            border-radius: 50%;
            top: 15px;
        }

        .cat-eye.left {
            left: 12px;
        }

        .cat-eye.right {
            right: 12px;
        }

        .cat-eye.blink {
            height: 1px;
            transition: height 0.1s ease-in-out;
        }

        .cat-nose {
            position: absolute;
            top: 22px;
            left: 50%;
            transform: translateX(-50%);
            width: 0;
            height: 0;
            border-width: 0 3px 3px 3px;
            border-color: transparent transparent #d63031 transparent;
        }

        .cat-mouth {
            position: absolute;
            top: 25px;
            left: 50%;
            transform: translateX(-50%);
            width: 8px;
            height: 4px;
            border: 1px solid #333;
            border-top: none;
            border-radius: 0 0 8px 8px;
        }

        .cat-whisker {
            position: absolute;
            width: 15px;
            height: 1px;
            background: #333;
            top: 20px;
        }

        .cat-whisker.left1 {
            left: -5px;
            transform: rotate(-10deg);
        }

        .cat-whisker.left2 {
            left: -5px;
            top: 24px;
            transform: rotate(10deg);
        }

        .cat-whisker.right1 {
            right: -5px;
            transform: rotate(10deg);
        }

        .cat-whisker.right2 {
            right: -5px;
            top: 24px;
            transform: rotate(-10deg);
        }

        .cat-body-main {
            position: absolute;
            top: 35px;
            left: 50%;
            transform: translateX(-50%);
            width: 35px;
            height: 30px;
            background: #ff6b6b;
            border-radius: 50% 50% 40% 40%;
            box-shadow: 0 2px 8px rgba(0,0,0,0.2);
        }

        .cat-tail {
            position: absolute;
            top: 45px;
            left: -15px;
            width: 25px;
            height: 3px;
            background: #ff6b6b;
            border-radius: 3px;
            transform-origin: right center;
            animation: tailWag 2s ease-in-out infinite;
        }

        @keyframes tailWag {
            0%, 100% { transform: rotate(-10deg); }
            50% { transform: rotate(10deg); }
        }

        .cat-paw {
            position: absolute;
            width: 8px;
            height: 6px;
            background: #ff6b6b;
            border-radius: 50%;
            bottom: -3px;
        }

        .cat-paw.left {
            left: 8px;
        }

        .cat-paw.right {
            right: 8px;
        }

        .cat.sleeping .cat-eye {
            height: 1px;
        }

        .cat.running .cat-tail {
            animation: tailWagFast 0.5s ease-in-out infinite;
        }

        @keyframes tailWagFast {
            0%, 100% { transform: rotate(-15deg); }
            50% { transform: rotate(15deg); }
        }

        .cat.happy .cat-mouth {
            border-radius: 0 0 12px 12px;
            height: 6px;
        }

        .sparkle {
            position: absolute;
            width: 4px;
            height: 4px;
            background: white;
            border-radius: 50%;
            pointer-events: none;
            animation: sparkle 1s ease-out forwards;
        }

        @keyframes sparkle {
            0% {
                opacity: 1;
                transform: scale(0) rotate(0deg);
            }
            100% {
                opacity: 0;
                transform: scale(1.5) rotate(180deg);
            }
        }

        .instructions {
            position: absolute;
            bottom: 30px;
            left: 50%;
            transform: translateX(-50%);
            color: white;
            text-align: center;
            opacity: 0.8;
            font-size: 0.9rem;
        }

        @media (max-width: 768px) {
            .content h1 {
                font-size: 2rem;
            }
            .content p {
                font-size: 1rem;
            }
            .cat {
                width: 60px;
                height: 60px;
            }
            .cat-head {
                width: 40px;
                height: 36px;
            }
            .cat-body-main {
                width: 28px;
                height: 24px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="content">
            <h1>Follow the Cat!</h1>
            <p>Move your mouse around and watch the cat follow you</p>
        </div>

        <div class="cat" id="cat">
            <div class="cat-body">
                <div class="cat-head">
                    <div class="cat-ear left">
                        <div class="cat-ear-inner left"></div>
                    </div>
                    <div class="cat-ear right">
                        <div class="cat-ear-inner right"></div>
                    </div>
                    <div class="cat-eye left" id="leftEye"></div>
                    <div class="cat-eye right" id="rightEye"></div>
                    <div class="cat-nose"></div>
                    <div class="cat-mouth"></div>
                    <div class="cat-whisker left1"></div>
                    <div class="cat-whisker left2"></div>
                    <div class="cat-whisker right1"></div>
                    <div class="cat-whisker right2"></div>
                </div>
                <div class="cat-body-main">
                    <div class="cat-tail"></div>
                    <div class="cat-paw left"></div>
                    <div class="cat-paw right"></div>
                </div>
            </div>
        </div>

        <div class="instructions">
            <p>🐱 The cat will follow your mouse! Try moving quickly or slowly!</p>
        </div>
    </div>

    <script>
        class CursorCat {
            constructor() {
                this.cat = document.getElementById('cat');
                this.leftEye = document.getElementById('leftEye');
                this.rightEye = document.getElementById('rightEye');
                
                this.mouseX = window.innerWidth / 2;
                this.mouseY = window.innerHeight / 2;
                this.catX = this.mouseX;
                this.catY = this.mouseY;
                
                this.lastMouseX = this.mouseX;
                this.lastMouseY = this.mouseY;
                this.speed = 0;
                this.isMoving = false;
                
                this.blinkInterval = null;
                this.lastBlink = Date.now();
                
                this.init();
            }
            
            init() {
                this.setupEventListeners();
                this.startAnimationLoop();
                this.startBlinking();
                this.positionCat();
            }
            
            setupEventListeners() {
                document.addEventListener('mousemove', (e) => {
                    this.lastMouseX = this.mouseX;
                    this.lastMouseY = this.mouseY;
                    this.mouseX = e.clientX;
                    this.mouseY = e.clientY;
                    
                    this.calculateSpeed();
                    this.createSparkle();
                });
                
                document.addEventListener('mouseenter', () => {
                    this.cat.style.opacity = '1';
                });
                
                document.addEventListener('mouseleave', () => {
                    this.cat.style.opacity = '0.3';
                });
                
                // Touch support for mobile
                document.addEventListener('touchmove', (e) => {
                    e.preventDefault();
                    const touch = e.touches[0];
                    this.lastMouseX = this.mouseX;
                    this.lastMouseY = this.mouseY;
                    this.mouseX = touch.clientX;
                    this.mouseY = touch.clientY;
                    
                    this.calculateSpeed();
                    this.createSparkle();
                });
            }
            
            calculateSpeed() {
                const dx = this.mouseX - this.lastMouseX;
                const dy = this.mouseY - this.lastMouseY;
                this.speed = Math.sqrt(dx * dx + dy * dy);
                this.isMoving = this.speed > 0.5;
            }
            
            startAnimationLoop() {
                const animate = () => {
                    this.updateCatPosition();
                    this.updateCatState();
                    this.updateEyeDirection();
                    requestAnimationFrame(animate);
                };
                animate();
            }
            
            updateCatPosition() {
                const dx = this.mouseX - this.catX;
                const dy = this.mouseY - this.catY;
                
                // Smooth following with easing
                const easing = this.isMoving ? 0.15 : 0.08;
                this.catX += dx * easing;
                this.catY += dy * easing;
                
                this.positionCat();
            }
            
            positionCat() {
                this.cat.style.left = (this.catX - 40) + 'px';
                this.cat.style.top = (this.catY - 40) + 'px';
            }
            
            updateCatState() {
                // Remove all state classes
                this.cat.classList.remove('sleeping', 'running', 'happy');
                
                if (this.speed > 8) {
                    this.cat.classList.add('running');
                } else if (this.speed < 0.5) {
                    this.cat.classList.add('sleeping');
                } else if (this.speed > 3 && this.speed < 6) {
                    this.cat.classList.add('happy');
                }
            }
            
            updateEyeDirection() {
                if (!this.isMoving) return;
                
                const dx = this.mouseX - this.catX;
                const dy = this.mouseY - this.catY;
                const angle = Math.atan2(dy, dx);
                
                const eyeOffset = 2;
                const leftEyeX = Math.cos(angle) * eyeOffset;
                const leftEyeY = Math.sin(angle) * eyeOffset;
                const rightEyeX = Math.cos(angle) * eyeOffset;
                const rightEyeY = Math.sin(angle) * eyeOffset;
                
                this.leftEye.style.transform = `translate(${leftEyeX}px, ${leftEyeY}px)`;
                this.rightEye.style.transform = `translate(${rightEyeX}px, ${rightEyeY}px)`;
            }
            
            startBlinking() {
                setInterval(() => {
                    if (Math.random() < 0.3) { // 30% chance to blink
                        this.blink();
                    }
                }, 2000);
            }
            
            blink() {
                this.leftEye.classList.add('blink');
                this.rightEye.classList.add('blink');
                
                setTimeout(() => {
                    this.leftEye.classList.remove('blink');
                    this.rightEye.classList.remove('blink');
                }, 150);
            }
            
            createSparkle() {
                if (this.speed > 5 && Math.random() < 0.3) {
                    const sparkle = document.createElement('div');
                    sparkle.className = 'sparkle';
                    sparkle.style.left = (this.catX + (Math.random() - 0.5) * 40) + 'px';
                    sparkle.style.top = (this.catY + (Math.random() - 0.5) * 40) + 'px';
                    
                    document.body.appendChild(sparkle);
                    
                    setTimeout(() => {
                        sparkle.remove();
                    }, 1000);
                }
            }
        }
        
        // Initialize the cursor cat when the page loads
        document.addEventListener('DOMContentLoaded', () => {
            new CursorCat();
        });
        
        // Add some interactive elements
        document.addEventListener('click', (e) => {
            // Create a ripple effect at click position
            const ripple = document.createElement('div');
            ripple.style.position = 'absolute';
            ripple.style.left = e.clientX + 'px';
            ripple.style.top = e.clientY + 'px';
            ripple.style.width = '20px';
            ripple.style.height = '20px';
            ripple.style.background = 'rgba(255, 255, 255, 0.6)';
            ripple.style.borderRadius = '50%';
            ripple.style.transform = 'translate(-50%, -50%)';
            ripple.style.pointerEvents = 'none';
            ripple.style.animation = 'ripple 0.6s ease-out forwards';
            
            document.body.appendChild(ripple);
            
            setTimeout(() => {
                ripple.remove();
            }, 600);
        });
        
        // Add ripple animation
        const style = document.createElement('style');
        style.textContent = `
            @keyframes ripple {
                0% {
                    transform: translate(-50%, -50%) scale(1);
                    opacity: 1;
                }
                100% {
                    transform: translate(-50%, -50%) scale(4);
                    opacity: 0;
                }
            }
        `;
        document.head.appendChild(style);
    </script>
</body>
</html>
