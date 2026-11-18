-- Allow the OpenAI-compatible LLM provider form to configure reasoning strength.
-- The runtime already accepts thinking=default/off/low/medium/high; expose it in the UI.

UPDATE public.ai_model_provider
SET fields = (
        fields::jsonb
        || '[{"key":"thinking","label":"思考强度","type":"select","options":["default","off","low","medium","high"],"placeholder":"default"}]'::jsonb
    )::text,
    update_date = NOW()
WHERE id = 'SYSTEM_LLM_openai'
  AND NOT fields::jsonb @> '[{"key":"thinking"}]'::jsonb;
