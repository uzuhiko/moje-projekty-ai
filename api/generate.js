module.exports = async function handler(req, res) {
    if (req.method !== 'POST') {
        return res.status(405).json({ error: 'Method not allowed' });
    }

    const { prompt } = req.body || {};
    if (!prompt) {
        return res.status(400).json({ error: 'Brak opisu sprawy w żądaniu.' });
    }

    try {
        const apiKey = process.env.OPENAI_API_KEY;
        if (!apiKey) {
            return res.status(500).json({ error: 'Brak klucza OPENAI_API_KEY w zmiennych Vercela.' });
        }

        const response = await fetch('https://api.openai.com/v1/chat/completions', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'Authorization': `Bearer ${apiKey}`
            },
            body: JSON.stringify({
                model: 'gpt-4o-mini',
                messages: [
                    { 
                        role: 'system', 
                        content: 'Jesteś profesjonalnym polskim prawnikiem. Przygotuj oficjalne, w pełni sformatowane pismo reklamacyjne lub przedsądowe na podstawie opisu użytkownika, używając odpowiednich podstaw prawnych.' 
                    },
                    { role: 'user', content: prompt }
                ],
                temperature: 0.7
            })
        });

        const data = await response.json();

        if (!response.ok) {
            return res.status(500).json({ error: data.error?.message || 'Błąd OpenAI API' });
        }

        const text = data.choices?.[0]?.message?.content || 'Brak treści.';
        return res.status(200).json({ text });

    } catch (err) {
        return res.status(500).json({ error: 'Błąd serwera: ' + err.message });
    }
};
