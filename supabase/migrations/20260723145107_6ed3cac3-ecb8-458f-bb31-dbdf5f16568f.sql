-- Fix 1: Lock down SECURITY DEFINER trigger function from being called via API
REVOKE EXECUTE ON FUNCTION public.handle_new_user() FROM PUBLIC, anon, authenticated;

-- Fix 2: Add owner-scoped RLS policies for the private export_260625 bucket
CREATE POLICY "Users can view own files in export_260625"
ON storage.objects FOR SELECT TO authenticated
USING (bucket_id = 'export_260625' AND owner = auth.uid());

CREATE POLICY "Users can upload own files to export_260625"
ON storage.objects FOR INSERT TO authenticated
WITH CHECK (bucket_id = 'export_260625' AND owner = auth.uid());

CREATE POLICY "Users can update own files in export_260625"
ON storage.objects FOR UPDATE TO authenticated
USING (bucket_id = 'export_260625' AND owner = auth.uid())
WITH CHECK (bucket_id = 'export_260625' AND owner = auth.uid());

CREATE POLICY "Users can delete own files in export_260625"
ON storage.objects FOR DELETE TO authenticated
USING (bucket_id = 'export_260625' AND owner = auth.uid());