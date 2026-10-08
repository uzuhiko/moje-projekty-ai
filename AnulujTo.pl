<!DOCTYPE html>
<html lang="pl" class="dark">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AnulujTo.pl — Zamknij Umowy i Subskrypcje Jednym Kliknięciem</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;600;800&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Plus Jakarta Sans', sans-serif; background-color: #060a0f; }
        .glass-card { background: rgba(12, 20, 31, 0.65); backdrop-filter: blur(16px); border: 1px solid rgba(255, 255, 255, 0.08); }
        .glow-cyan { box-shadow: 0 0 50px -12px rgba(6, 182, 212, 0.35); }
    </style>
</head>
<body class="text-slate-100 min-h-screen flex flex-col justify-between selection:bg-cyan-500 selection:text-black">

    <header class="w-full border-b border-white/5 py-5 px-6 max-w-6xl mx-auto flex justify-between items-center">
        <div class="flex items-center gap-2">
            <div class="w-3 h-3 rounded-full bg-cyan-400"></div>
            <span class="text-2xl font-extrabold tracking-tight text-white">Anuluj<span class="text-cyan-400">To.pl</span></span>
        </div>
        <div class="text-xs font-semibold px-3 py-1.5 rounded-full bg-cyan-500/10 text-cyan-400 border border-cyan-500/20">
            Bot Kasujący Umowy
        </div>
    </header>

    <main class="max-w-3xl mx-auto px-6 py-16 text-center flex-grow flex flex-col justify-center items-center">
        <span class="text-xs font-bold uppercase tracking-widest text-cyan-400 mb-4 px-3 py-1 rounded-full bg-cyan-500/10 border border-cyan-500/20">
            Siłownie • VOD • Operatorzy • Aplikacje
        </span>
        <h1 class="text-4xl md:text-6xl font-extrabold tracking-tight mb-6 leading-tight">
            Stop niepotrzebnym opłatom. <br><span class="text-transparent bg-clip-text bg-gradient-to-r from-cyan-400 to-blue-200">Wypowiedz umowę bez stresu.</span>
        </h1>
        <p class="text-slate-400 text-base md:text-lg mb-10 max-w-xl font-medium leading-relaxed">
            Firma utrudnia rezygnację? Wpisz nazwę usługi, a wygenerujemy prawne oświadczenie o wypowiedzeniu umowy, którego nie mogą odrzucić.
        </p>

        <div class="w-full glass-card rounded-3xl p-6 md:p-8 text-left glow-cyan mb-8 relative overflow-hidden">
            <label class="block text-sm font-semibold mb-3 text-slate-200 flex justify-between">
                <span>Wpisz co chcesz anulować</span>
                <span class="text-xs text-slate-500">Szybka rezygnacja</span>
            </label>
            <textarea id="userInput" rows="4" class="w-full bg-slate-950/80 border border-white/10 rounded-2xl p-4 text-slate-100 placeholder-slate-600 focus:outline-none focus:border-cyan-500 transition-all text-sm mb-5 resize-none" placeholder="np. Karnet w siłowni Zdrofit / Umowa z operatorem Canal+ / Subskrypcja Adobe..."></textarea>
            
            <button onclick="generateDraft()" class="w-full bg-gradient-to-r from-cyan-500 to-blue-500 hover:from-cyan-400 hover:to-blue-400 text-slate-950 font-bold py-4 px-6 rounded-2xl transition-all duration-200 transform hover:-translate-y-0.5 shadow-lg shadow-cyan-500/25 text-center text-sm md:text-base">
                Wygeneruj Wypowiedzenie (7,99 zł)
            </button>
        </div>

        <div id="resultBox" class="hidden w-full glass-card rounded-3xl p-6 text-left border-cyan-500/30">
            <div class="flex items-center justify-between mb-4">
                <span class="text-cyan-400 text-xs font-bold uppercase tracking-wider">
                    ✓ Wypowiedzenie Gotowe do Wysyłki
                </span>
                <span class="text-slate-400 text-xs font-semibold">Jednorazowo: 7,99 zł</span>
            </div>
            <pre id="outputContent" class="whitespace-pre-wrap text-slate-300 text-xs md:text-sm bg-slate-950/90 p-5 rounded-xl border border-white/5 mb-5 font-mono leading-relaxed"></pre>
            <button class="w-full bg-cyan-400 hover:bg-cyan-300 text-slate-950 font-bold py-3.5 rounded-xl transition text-sm">
                Odblokuj i Pobierz Dokument (BLIK)
            </button>
        </div>
    </main>

    <footer class="border-t border-white/5 py-6 text-center text-xs text-slate-600">
        &copy; 2026 AnulujTo.pl. Bezproblemowe kasowanie płatności i umów.
    </footer>

    <script>
        function generateDraft() {
            const input = document.getElementById('userInput').value;
            if(!input.trim()) { alert("Wpisz nazwę firmy lub usługi!"); return; }
            document.getElementById('resultBox').classList.remove('hidden');
            document.getElementById('outputContent').innerText = 
                "OŚWIADCZENIE O WYPOWIEDZENIU UMOWY\n\n" +
                "Niniejszym składam oświadczenie o rozwiązaniu umowy ze skutkiem na koniec okresu...\n\n" +
                "[PEŁNY DOKUMENT Z DANYM ADRESOWYMI PO OPŁACENIU 7,99 ZŁ]";
        }
    </script>
</body>
</html>