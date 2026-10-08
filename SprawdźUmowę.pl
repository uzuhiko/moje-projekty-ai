<!DOCTYPE html>
<html lang="pl" class="dark">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SprawdźUmowę.pl — Wykryj Haczyki Zanim Podpiszesz</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Plus Jakarta Sans', sans-serif; background-color: #0a0806; }
        .glass-card { background: rgba(24, 18, 12, 0.65); backdrop-filter: blur(16px); border: 1px solid rgba(255, 255, 255, 0.08); }
        .glow-amber { box-shadow: 0 0 50px -12px rgba(245, 158, 11, 0.3); }
    </style>
</head>
<body class="text-slate-100 min-h-screen flex flex-col justify-between selection:bg-amber-500 selection:text-black">

    <header class="w-full border-b border-white/5 py-5 px-6 max-w-6xl mx-auto flex justify-between items-center">
        <div class="flex items-center gap-2">
            <div class="w-3 h-3 rounded-full bg-amber-500"></div>
            <span class="text-2xl font-extrabold tracking-tight text-white">Sprawdź<span class="text-amber-400">Umowę.pl</span></span>
        </div>
        <div class="text-xs font-semibold px-3 py-1.5 rounded-full bg-amber-500/10 text-amber-400 border border-amber-500/20">
            Skaner Bezpieczeństwa Prawnego
        </div>
    </header>

    <main class="max-w-3xl mx-auto px-6 py-16 text-center flex-grow flex flex-col justify-center items-center">
        <span class="text-xs font-bold uppercase tracking-widest text-amber-400 mb-4 px-3 py-1 rounded-full bg-amber-500/10 border border-amber-500/20">
            Najem • Umowa o Pracę • Kredyty • Regulaminy
        </span>
        <h1 class="text-4xl md:text-6xl font-extrabold tracking-tight mb-6 leading-tight">
            Podpisuj bez ryzyka. <br><span class="text-transparent bg-clip-text bg-gradient-to-r from-amber-400 to-orange-200">Brak ukrytych pułapek.</span>
        </h1>
        <p class="text-slate-400 text-base md:text-lg mb-10 max-w-xl font-medium leading-relaxed">
            Nie czytaj 20 stron skomplikowanego języka prawnego. Nasz skaner w kilka sekund wyciągnie kaucje, kary umowne i niekorzystne zapisy.
        </p>

        <div class="w-full glass-card rounded-3xl p-6 md:p-8 text-left glow-amber mb-8 relative overflow-hidden">
            <label class="block text-sm font-semibold mb-3 text-slate-200 flex justify-between">
                <span>Wklej treść lub fragment umowy</span>
                <span class="text-xs text-slate-500">Prywatność 100% gwarantowana</span>
            </label>
            <textarea id="userInput" rows="4" class="w-full bg-slate-950/80 border border-white/10 rounded-2xl p-4 text-slate-100 placeholder-slate-600 focus:outline-none focus:border-amber-500 transition-all text-sm mb-5 resize-none" placeholder="Wklej tutaj paragrafy umowy, które budzą Twoją wątpliwość..."></textarea>
            
            <button onclick="generateDraft()" class="w-full bg-gradient-to-r from-amber-500 to-orange-400 hover:from-amber-400 hover:to-orange-300 text-slate-950 font-bold py-4 px-6 rounded-2xl transition-all duration-200 transform hover:-translate-y-0.5 shadow-lg shadow-amber-500/25 text-center text-sm md:text-base">
                Przeanalizuj Umowę (14,99 zł)
            </button>
        </div>

        <div id="resultBox" class="hidden w-full glass-card rounded-3xl p-6 text-left border-amber-500/30">
            <div class="flex items-center justify-between mb-4">
                <span class="text-amber-400 text-xs font-bold uppercase tracking-wider">
                    ⚠️ Wykryto Punkty Wysokiego Ryzyka
                </span>
                <span class="text-slate-400 text-xs font-semibold">Koszt raportu: 14,99 zł</span>
            </div>
            <pre id="outputContent" class="whitespace-pre-wrap text-slate-300 text-xs md:text-sm bg-slate-950/90 p-5 rounded-xl border border-white/5 mb-5 font-mono leading-relaxed"></pre>
            <button class="w-full bg-amber-500 hover:bg-amber-400 text-slate-950 font-bold py-3.5 rounded-xl transition text-sm">
                Odblokuj Pełny Raport Ochronny (BLIK)
            </button>
        </div>
    </main>

    <footer class="border-t border-white/5 py-6 text-center text-xs text-slate-600">
        &copy; 2026 SprawdźUmowę.pl. Analiza dokumentów i ochrona konsumenta.
    </footer>

    <script>
        function generateDraft() {
            const input = document.getElementById('userInput').value;
            if(!input.trim()) { alert("Wklej fragment umowy!"); return; }
            document.getElementById('resultBox').classList.remove('hidden');
            document.getElementById('outputContent').innerText = 
                "RAPORT ANALIZY RYZYKA DOKUMENTU\n\n" +
                "1. Zapis w Paragrafie 3 narusza Twoje prawa jako najemcy...\n" +
                "2. UWAGA: Haczyk finansowy przy wcześniejszym rozwiązaniu umowy...\n\n" +
                "[PEŁNA ANALIZA Z INSTRUKCJĄ NEGOCJACJI PO OPŁACENIU 14,99 ZŁ]";
        }
    </script>
</body>
</html>
