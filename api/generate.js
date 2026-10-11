export default async function handler(req, res) {
  if (req.method !== 'POST') {
    return res.status(405).json({ error: 'Method not allowed' });
  }

  const { prompt } = req.body;

  if (!prompt) {
    return res.status(400).json({ error: 'Brak opisu sprawy.' });
  }

  try {
    const response = await fetch('https://api.openai.com/v1/chat/completions', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': `Bearer ${process.env.OPENAI_API_KEY}`
      },
      body: JSON.stringify({
        model: 'gpt-4o-mini',
        messages: [
          {
            role: 'system',
            content: 'Jesteś doświadczonym polskim prawnikiem i ekspertem od praw konsumenta. Na podstawie opisu sprawy napisz oficjalne, formalne i gotowe do wysłania pismo reklamacyjne / wezwanie do zapłaty. Używaj profesjonalnego języka prawniczego, powołuj się na odpowiednie artykuły polskiego Kodeksu Cywilnego lub ustawy o prawach konsumenta. Formatuj pismo czytelnie z nagłówkami, miejscem na datę i podpis.'
          },
          {
            role: 'user',
            content: `Opis sytuacji klienta: ${prompt}`
          }
        ],
        temperature: 0.7
      })
    });

    const data = await response.json();

    if (data.choices && data.choices.length > 0) {
      return res.status(200).json({ document: data.choices[0].message.content });
    } else {
      return res.status(500).json({ error: 'Błąd generowania odpowiedzi z AI.' });
    }
  } catch (error) {
    return res.status(500).json({ error: 'Błąd serwera: ' + error.message });
  }
}
