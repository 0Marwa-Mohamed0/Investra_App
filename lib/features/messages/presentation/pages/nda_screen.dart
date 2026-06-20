import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:investra/core/styles/colors.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:signature/signature.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class _NdaData {
  final String entrepreneurName;
  final String entrepreneurId;
  final String investorName;
  final String investorId;
  final String ideaTitle;
  final String ideaId;

  const _NdaData({
    required this.entrepreneurName,
    required this.entrepreneurId,
    required this.investorName,
    required this.investorId,
    required this.ideaTitle,
    required this.ideaId,
  });
}

class NdaScreen extends StatefulWidget {
  const NdaScreen({super.key, required this.chatId});
  final String chatId;

  @override
  State<NdaScreen> createState() => _NdaScreenState();
}

class _NdaScreenState extends State<NdaScreen> {
  final _supabase = Supabase.instance.client;

  _NdaData? _ndaData;
  bool _loading = true;
  String? _error;
  bool _isSaving = false;

  late final SignatureController _signatureController;

  String get _myId => _supabase.auth.currentUser!.id;
  bool get _iAmInvestor => _ndaData?.investorId == _myId;


  @override
  void initState() {
    super.initState();
    _signatureController = SignatureController(
      penStrokeWidth: 2.5,
      penColor: Colors.black,
      exportBackgroundColor: Colors.white,
    );
    _loadNdaData();
  }

  @override
  void dispose() {
    _signatureController.dispose();
    super.dispose();
  }


  Future<void> _loadNdaData() async {
    try {
      final chatRow = await _supabase
          .from('chat')
          .select('entrepreneur_id, investor_id, idea_id')
          .eq('chat_id', widget.chatId)
          .single();

      final entrepreneurId = chatRow['entrepreneur_id'] as String;
      final investorId     = chatRow['investor_id']     as String;
      final ideaId         = chatRow['idea_id']         as String;

      final entrepreneurRow = await _supabase
          .from('User').select('FullName').eq('userid', entrepreneurId).single();
      final investorRow = await _supabase
          .from('User').select('FullName').eq('userid', investorId).single();
      final ideaRow = await _supabase
          .from('ideas').select('title').eq('id', ideaId).single();

      if (mounted) {
        setState(() {
          _ndaData = _NdaData(
            entrepreneurName: entrepreneurRow['FullName'] as String,
            entrepreneurId:   entrepreneurId,
            investorName:     investorRow['FullName']     as String,
            investorId:       investorId,
            ideaTitle:        ideaRow['title']            as String,
            ideaId:           ideaId,
          );
          _loading = false;
        });
      }
    } catch (e) {
      if (mounted) setState(() { _error = 'Failed to load NDA: $e'; _loading = false; });
    }
  }

  Future<Uint8List> _generatePdf(Uint8List signatureBytes) async {
    final pdf  = pw.Document();
    final d    = _ndaData!;
    final now  = DateTime.now();
    final date = '${now.year}-${now.month.toString().padLeft(2,'0')}-${now.day.toString().padLeft(2,'0')}';

    // تحويل التوقيع لـ PdfImage
    final sigImage = pw.MemoryImage(signatureBytes);

    // ألوان
    const primaryColor = PdfColor.fromInt(0xFF1A3C5E);
    const lightGray    = PdfColor.fromInt(0xFFF5F5F5);
    const green        = PdfColor.fromInt(0xFF4CAF50);

    pw.TextStyle bodyStyle()    => const pw.TextStyle(fontSize: 11, lineSpacing: 1.5);
    pw.TextStyle boldStyle()    => pw.TextStyle(fontSize: 11, fontWeight: pw.FontWeight.bold, lineSpacing: 1.5);
    pw.TextStyle sectionStyle() => pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold, color: primaryColor);
    pw.TextStyle titleStyle()   => pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold, color: primaryColor);

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(40),
        header: (context) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.center,
          children: [
            pw.Text('NON-DISCLOSURE AGREEMENT (NDA)', style: titleStyle()),
            pw.SizedBox(height: 4),
            pw.Text('Generated through Investra Platform',
                style: pw.TextStyle(fontSize: 9, color: PdfColors.grey600)),
            pw.Divider(color: primaryColor, thickness: 1),
            pw.SizedBox(height: 8),
          ],
        ),
        footer: (context) => pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Text('Confidential Document',
                style: pw.TextStyle(fontSize: 8, color: PdfColors.grey500)),
            pw.Text('Page ${context.pageNumber} of ${context.pagesCount}',
                style: pw.TextStyle(fontSize: 8, color: PdfColors.grey500)),
          ],
        ),
        build: (context) => [

          pw.Text('This Agreement is entered into on $date between:', style: bodyStyle()),
          pw.SizedBox(height: 12),

          pw.Container(
            padding: const pw.EdgeInsets.all(12),
            decoration: pw.BoxDecoration(
              color: lightGray,
              borderRadius: const pw.BorderRadius.all(pw.Radius.circular(6)),
            ),
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text('Entrepreneur (Disclosing Party):', style: sectionStyle()),
                pw.SizedBox(height: 4),
                pw.RichText(text: pw.TextSpan(children: [
                  pw.TextSpan(text: 'Name: ', style: boldStyle()),
                  pw.TextSpan(text: d.entrepreneurName, style: bodyStyle()),
                ])),
                pw.RichText(text: pw.TextSpan(children: [
                  pw.TextSpan(text: 'User ID: ', style: boldStyle()),
                  pw.TextSpan(text: d.entrepreneurId, style: bodyStyle()),
                ])),
                pw.SizedBox(height: 10),
                pw.Text('Investor (Receiving Party):', style: sectionStyle()),
                pw.SizedBox(height: 4),
                pw.RichText(text: pw.TextSpan(children: [
                  pw.TextSpan(text: 'Name: ', style: boldStyle()),
                  pw.TextSpan(text: d.investorName, style: bodyStyle()),
                ])),
                pw.RichText(text: pw.TextSpan(children: [
                  pw.TextSpan(text: 'User ID: ', style: boldStyle()),
                  pw.TextSpan(text: d.investorId, style: bodyStyle()),
                ])),
                pw.SizedBox(height: 10),
                pw.RichText(text: pw.TextSpan(children: [
                  pw.TextSpan(text: 'Idea Title: ', style: boldStyle()),
                  pw.TextSpan(text: d.ideaTitle, style: bodyStyle()),
                ])),
              ],
            ),
          ),

          pw.SizedBox(height: 16),


          _pdfSection('1. Purpose', sectionStyle(), bodyStyle(),
              'The purpose of this Agreement is to allow the Entrepreneur to share confidential business information, startup ideas, documents, feasibility studies, business plans, contracts, and related materials through the Investra platform for evaluation and potential investment discussions.'),

          _pdfSection('2. Confidential Information', sectionStyle(), bodyStyle(),
              'Confidential information includes but is not limited to:\n'
                  '• Business ideas and concepts\n'
                  '• Business plans\n'
                  '• Financial projections\n'
                  '• Feasibility studies\n'
                  '• Uploaded documents\n'
                  '• Product concepts\n'
                  '• Chat discussions and shared materials\n'
                  '• Contracts and investment documents\n'
                  '• Any files exchanged through the platform'),

          _pdfSection('3. Obligations of the Investor', sectionStyle(), bodyStyle(),
              'The Investor agrees:\n'
                  '• Not to copy, reproduce, distribute, or disclose confidential information to third parties\n'
                  '• Not to use shared information for personal, commercial, or competitive benefit without written permission\n'
                  '• Not to claim ownership of the entrepreneur\'s ideas, documents, or intellectual property\n'
                  '• To use the information only for evaluation and investment purposes\n'
                  '• To maintain confidentiality of all exchanged information'),

          _pdfSection('4. Ownership Rights', sectionStyle(), bodyStyle(),
              'All intellectual property rights, business ownership rights, and idea ownership remain exclusively with the Entrepreneur.\n\n'
                  'Signing this Agreement does not transfer ownership, licensing rights, or usage rights to the Investor.'),

          _pdfSection('5. Duration', sectionStyle(), bodyStyle(),
              'This Agreement shall remain valid for three (3) years from the signing date.'),

          _pdfSection('6. Breach of Agreement', sectionStyle(), bodyStyle(),
              'Unauthorized disclosure, copying, misuse, or unauthorized ownership claims regarding confidential information may result in legal action according to applicable laws.'),

          _pdfSection('7. Platform Record Acknowledgment', sectionStyle(), bodyStyle(),
              'Both parties acknowledge that this agreement, related files, signatures, timestamps, and transaction records may be stored within the Investra platform for documentation and verification purposes.'),

          _pdfSection('8. Acceptance', sectionStyle(), bodyStyle(),
              'By signing below, both parties acknowledge that they have read, understood, and accepted this agreement.'),

          pw.Divider(color: primaryColor),
          pw.SizedBox(height: 12),


          pw.Row(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              // Entrepreneur
              pw.Expanded(
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text('Entrepreneur Signature:', style: sectionStyle()),
                    pw.SizedBox(height: 4),
                    pw.Text('Name: ${d.entrepreneurName}', style: bodyStyle()),
                    pw.Text('Date: $date', style: bodyStyle()),
                    pw.SizedBox(height: 8),
                    pw.Container(
                      padding: const pw.EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: pw.BoxDecoration(
                        color: green,
                        borderRadius: const pw.BorderRadius.all(pw.Radius.circular(4)),
                      ),
                      child: pw.Text('✓ Signed by Entrepreneur',
                          style: pw.TextStyle(fontSize: 9, color: PdfColors.white,
                              fontWeight: pw.FontWeight.bold)),
                    ),
                  ],
                ),
              ),
              pw.SizedBox(width: 20),

              pw.Expanded(
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text('Investor Signature:', style: sectionStyle()),
                    pw.SizedBox(height: 4),
                    pw.Text('Name: ${d.investorName}', style: bodyStyle()),
                    pw.Text('Date: $date', style: bodyStyle()),
                    pw.SizedBox(height: 8),

                    pw.Container(
                      height: 80,
                      width: 200,
                      decoration: pw.BoxDecoration(
                        border: pw.Border.all(color: primaryColor, width: 0.8),
                        borderRadius: const pw.BorderRadius.all(pw.Radius.circular(4)),
                        color: PdfColors.white,
                      ),
                      child: pw.Image(sigImage, fit: pw.BoxFit.contain),
                    ),
                  ],
                ),
              ),
            ],
          ),

          pw.SizedBox(height: 16),
          pw.Center(
            child: pw.Text(
              'Generated through Investra Platform · Confidential Document',
              style: pw.TextStyle(fontSize: 8, color: PdfColors.grey500),
            ),
          ),
        ],
      ),
    );

    return pdf.save();
  }

  pw.Widget _pdfSection(String title, pw.TextStyle titleStyle,
      pw.TextStyle bodyStyle, String body) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(title, style: titleStyle),
        pw.SizedBox(height: 4),
        pw.Text(body, style: bodyStyle),
        pw.SizedBox(height: 12),
      ],
    );
  }


  Future<void> _submit() async {
    if (_signatureController.isEmpty || _ndaData == null) return;
    setState(() => _isSaving = true);

    try {

      final Uint8List? signatureBytes = await _signatureController.toPngBytes();
      if (signatureBytes == null) throw Exception('Could not export signature');


      final pdfBytes = await _generatePdf(signatureBytes);


      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final fileName  = 'signed_NDA_${widget.chatId}_$timestamp.pdf';

      await _supabase.storage
          .from('Signed NDA Files')
          .uploadBinary(
        fileName,
        pdfBytes,
        fileOptions: const FileOptions(contentType: 'application/pdf'),
      );


      final signedUrl = _supabase.storage
          .from('Signed NDA Files')
          .getPublicUrl(fileName);


      await _supabase.from('nda_agreement').insert({
        'investor_id':    _ndaData!.investorId,
        'entrepreneur_id': _ndaData!.entrepreneurId,
        'idea_id':        _ndaData!.ideaId,
        'chat_id':        widget.chatId,
        'signed_pdf_url': signedUrl,
        'status':         'signed',
        'signed_at':      DateTime.now().toIso8601String(),
      });


      await _supabase.from('notifications').insert({
        'user_id':  _ndaData!.entrepreneurId,
        'title':    'NDA Signed ✓',
        'content':  '${_ndaData!.investorName} has signed the NDA for "${_ndaData!.ideaTitle}"',
        'type':     'nda_signed',
        'is_read':  false,
        'idea_id':  _ndaData!.ideaId,
        'status':   'pending',
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('NDA signed and saved successfully ✓'),
            backgroundColor: AppColors.primaryColor,
            behavior: SnackBarBehavior.floating,
          ),
        );
        Navigator.of(context).pop(true);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed: $e'),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text('NDA Agreement',
            style: theme.textTheme.titleMedium?.copyWith(
                color: theme.colorScheme.primary, fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          color: theme.colorScheme.primary,
          onPressed: () => Navigator.of(context).maybePop(),
        ),
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _error != null
          ? Center(child: Padding(padding: const EdgeInsets.all(24),
          child: Text(_error!, textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(color: Colors.red))))
          : _buildContent(theme),
    );
  }

  Widget _buildContent(ThemeData theme) {
    final d    = _ndaData!;
    final now  = DateTime.now();
    final date = '${now.year}-${now.month.toString().padLeft(2,'0')}-${now.day.toString().padLeft(2,'0')}';

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: theme.cardColor,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: theme.colorScheme.primary.withOpacity(0.15)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: Column(children: [
                  Text('NON-DISCLOSURE AGREEMENT',
                      style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold, letterSpacing: 0.5),
                      textAlign: TextAlign.center),
                  const SizedBox(height: 4),
                  Text('(NDA)', style: theme.textTheme.titleSmall
                      ?.copyWith(fontWeight: FontWeight.bold)),
                ])),
                const SizedBox(height: 16),
                _ndaText('This Non-Disclosure Agreement ("Agreement") is entered into on $date between:'),
                const SizedBox(height: 12),
                _sectionLabel('Entrepreneur (Disclosing Party):'),
                _ndaField('Name', d.entrepreneurName),
                _ndaField('User ID', d.entrepreneurId),
                const SizedBox(height: 8),
                _sectionLabel('Investor (Receiving Party):'),
                _ndaField('Name', d.investorName),
                _ndaField('User ID', d.investorId),
                const SizedBox(height: 8),
                _sectionLabel('Idea Title:'),
                _ndaText(d.ideaTitle, bold: true, color: theme.colorScheme.primary),
                const SizedBox(height: 16),
                _divider(),
                _flutterSection('1. Purpose',
                    'The purpose of this Agreement is to allow the Entrepreneur to share confidential business information, startup ideas, documents, feasibility studies, business plans, contracts, and related materials through the Investra platform for evaluation and potential investment discussions.'),
                _flutterSection('2. Confidential Information',
                    'Confidential information includes but is not limited to:\n• Business ideas and concepts\n• Business plans\n• Financial projections\n• Feasibility studies\n• Uploaded documents\n• Product concepts\n• Chat discussions and shared materials\n• Contracts and investment documents\n• Any files exchanged through the platform'),
                _flutterSection('3. Obligations of the Investor',
                    'The Investor agrees:\n• Not to copy, reproduce, distribute, or disclose confidential information to third parties\n• Not to use shared information for personal, commercial, or competitive benefit without written permission\n• Not to claim ownership of the entrepreneur\'s ideas, documents, or intellectual property\n• To use the information only for evaluation and investment purposes\n• To maintain confidentiality of all exchanged information'),
                _flutterSection('4. Ownership Rights',
                    'All intellectual property rights, business ownership rights, and idea ownership remain exclusively with the Entrepreneur.\n\nSigning this Agreement does not transfer ownership, licensing rights, or usage rights to the Investor.'),
                _flutterSection('5. Duration',
                    'This Agreement shall remain valid for three (3) years from the signing date.'),
                _flutterSection('6. Breach of Agreement',
                    'Unauthorized disclosure, copying, misuse, or unauthorized ownership claims regarding confidential information may result in legal action according to applicable laws.'),
                _flutterSection('7. Platform Record Acknowledgment',
                    'Both parties acknowledge that this agreement, related files, signatures, timestamps, and transaction records may be stored within the Investra platform for documentation and verification purposes.'),
                _flutterSection('8. Acceptance',
                    'By signing below, both parties acknowledge that they have read, understood, and accepted this agreement.'),
                _divider(),
                _sectionLabel('Entrepreneur Signature:'),
                _ndaField('Name', d.entrepreneurName),
                _ndaField('Date', date),
                const SizedBox(height: 6),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.green.withOpacity(0.4)),
                  ),
                  child: Row(mainAxisSize: MainAxisSize.min, children: [
                    const Icon(Icons.check_circle_outline, color: Colors.green, size: 16),
                    const SizedBox(width: 6),
                    Text('Signed by Entrepreneur',
                        style: theme.textTheme.labelSmall?.copyWith(
                            color: Colors.green, fontWeight: FontWeight.w600)),
                  ]),
                ),
                const SizedBox(height: 6),
                Text('Generated through Investra Platform · Confidential Document',
                    style: theme.textTheme.labelSmall?.copyWith(
                        color: theme.colorScheme.onSurface.withOpacity(0.4), fontSize: 10)),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // signature+ submit
          if (_iAmInvestor) ...[
            Text('Investor Signature',
                style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold, color: theme.colorScheme.primary)),
            const SizedBox(height: 4),
            Text('Sign in the box below using your finger',
                style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurface.withOpacity(0.55))),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                    color: theme.colorScheme.primary.withOpacity(0.4), width: 1.5),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(13),
                child: Signature(
                  controller: _signatureController,
                  height: 180,
                  backgroundColor: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton.icon(
                onPressed: () => _signatureController.clear(),
                icon: const Icon(Icons.refresh_rounded, size: 16, color: Colors.red),
                label: const Text('Clear',
                    style: TextStyle(color: Colors.red, fontWeight: FontWeight.w600)),
              ),
            ),
            _ndaField('Name', d.investorName),
            _ndaField('Date', date),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: _isSaving ? null : _submit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  disabledBackgroundColor: AppColors.primaryColor.withOpacity(0.4),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                ),
                child: _isSaving
                    ? const SizedBox(width: 22, height: 22,
                    child: CircularProgressIndicator(strokeWidth: 2.5, color: Colors.white))
                    : const Text('Submit & Sign NDA',
                    style: TextStyle(color: Colors.white,
                        fontWeight: FontWeight.bold, fontSize: 15)),
              ),
            ),
          ] else ...[

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF8E1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFF59E0B).withOpacity(0.4)),
              ),
              child: Row(children: [
                const Icon(Icons.hourglass_empty_rounded,
                    color: Color(0xFFF59E0B), size: 22),
                const SizedBox(width: 12),
                Expanded(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Waiting for investor signature',
                        style: theme.textTheme.bodyMedium?.copyWith(
                            color: const Color(0xFFF59E0B), fontWeight: FontWeight.bold)),
                    const SizedBox(height: 2),
                    Text('The investor will receive a request to sign this NDA.',
                        style: theme.textTheme.bodySmall?.copyWith(
                            color: const Color(0xFFF59E0B).withOpacity(0.8))),
                  ],
                )),
              ]),
            ),
          ],
        ],
      ),
    );
  }


  Widget _ndaText(String t, {bool bold = false, Color? color}) => Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Text(t, style: TextStyle(fontSize: 13,
          fontWeight: bold ? FontWeight.w600 : FontWeight.normal,
          color: color, height: 1.5)));

  Widget _sectionLabel(String t) => Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Text(t, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600)));

  Widget _ndaField(String label, String value) => Padding(
      padding: const EdgeInsets.only(bottom: 2),
      child: RichText(text: TextSpan(
          style: const TextStyle(fontSize: 13, color: Colors.black87),
          children: [
            TextSpan(text: '$label: ', style: const TextStyle(fontWeight: FontWeight.w500)),
            TextSpan(text: value),
          ])));

  Widget _flutterSection(String title, String body) => Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(title, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700, height: 1.6)),
        Text(body,  style: const TextStyle(fontSize: 13, height: 1.55)),
      ]));

  Widget _divider() => Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Divider(color: AppColors.primaryColor.withOpacity(0.2), thickness: 1));
}