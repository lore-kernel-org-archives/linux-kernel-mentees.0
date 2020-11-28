Return-Path: <SRS0=hNXL=FC=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C6F5C63697
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 28 Nov 2020 13:00:33 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73BCB24656
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 28 Nov 2020 13:00:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GQe9nADU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 73BCB24656
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id F28ED87967;
	Sat, 28 Nov 2020 13:00:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FxUYyk9MqyI9; Sat, 28 Nov 2020 13:00:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id C82E887905;
	Sat, 28 Nov 2020 13:00:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A5208C163C;
	Sat, 28 Nov 2020 13:00:30 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1F51EC0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Nov 2020 13:00:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 100F387CB9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Nov 2020 13:00:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3hejTn0xtGXm
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Nov 2020 13:00:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
 [209.85.166.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 63E0787EA3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Nov 2020 13:00:27 +0000 (UTC)
Received: by mail-il1-f195.google.com with SMTP id f5so6959874ilj.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Nov 2020 05:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NEq3IWBnT6SEHVQ8fP0PDMcO2lCkaHzMTdxstNO1FoM=;
 b=GQe9nADUDRQSzGWnMB1dzOoezcht9GC2lWqGEPLYGuyJrdYMu5C+MnL3aemDWtkDUZ
 eTYPzbhETUbeFdZ7wVop2oAPXdKOvlzxtffBb9ux1Gfxobc1VMMduVjL6giKB7J6mZRV
 Bl2iUC5sG83tCPISSBZTRTpMl0hj5Kge+p7UOdddmntE3ZSVyKywpS9yfN5YTRswRCsr
 dwLep1tKjztcJShYscK+Gg2F48AK++fP/k8pNK+LV8f9+00rMeyGlxP7JfZg+kVQepKV
 0Y6/QUHJQ5X03ropnmQB2kv410mNZ2cM3vDHJd47BnvwrN06Z56lpubmCrhTFUadySlN
 Xjng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NEq3IWBnT6SEHVQ8fP0PDMcO2lCkaHzMTdxstNO1FoM=;
 b=aRInYOEcdihcbJErkgdWx3ZMWFkCJJaWI9tavVrVskLWrIAYsBfWMKpfShB54kN7xZ
 kFWqLo7OlFtDhXVbNudXxpFe1W6EWcjPtkoGq6E2xQn8jvCDbF0K8XT/KC4xoqwOqtEM
 MOBQWmKbQXA0ScxdGKgraWV52WxvFU97ktbg5/ckR/GO24pMLt3B6qnmY5HBkaEUQRJ4
 cnJoUnVxVjejbHxHu3UonAANMt1556lL6nsftefjYLZQ6rwIhSDKSy9H+kp513hit+Dt
 koyk++FUVBvzz+vyKivbMnulDhljJjC/1Rv1BoPQ3wEFQQcsPrMmU5Vw2FPVB5njgOUm
 n34g==
X-Gm-Message-State: AOAM532CtYc8XlmBU6TiSyCCuAg+unbRTx0L3DCdyFJVW0hFNxj12hOf
 Gx516uWY6NUpEvyOzVmfZopW2kIzoE/XjtGGNxQ=
X-Google-Smtp-Source: ABdhPJwdDZZBfboRzSUqQFNMZp2I64llsRqA/JRysmNtbUaE1+lDsiGxIxHhPJ5wNgwuSf7NLY/PxR0xRRVofPlZdN0=
X-Received: by 2002:a92:600e:: with SMTP id u14mr10402197ilb.221.1606568426599; 
 Sat, 28 Nov 2020 05:00:26 -0800 (PST)
MIME-Version: 1.0
References: <CAKXUXMxrXa2BFWKzYOuViOH8xGR6b+QDZ0oWBNnvahzKmGRwXw@mail.gmail.com>
 <20201128095225.16379-1-yashsri421@gmail.com>
In-Reply-To: <20201128095225.16379-1-yashsri421@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Sat, 28 Nov 2020 14:00:14 +0100
Message-ID: <CAKXUXMz_sSC3EvCWaGV1e6SUTi9xdABsBjc-+36T7PyV5TMrDA@mail.gmail.com>
To: Aditya Srivastava <yashsri421@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v4] checkpatch: add fix and
 improve warning msg for non-standard signature
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============4440190750729707151=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============4440190750729707151==
Content-Type: multipart/alternative; boundary="0000000000005ff94205b52a5c42"

--0000000000005ff94205b52a5c42
Content-Type: text/plain; charset="UTF-8"

Aditya Srivastava <yashsri421@gmail.com> schrieb am Sa., 28. Nov. 2020 um
10:52:

> Currently checkpatch warns for BAD_SIGN_OFF on non-standard signature
> styles.
>
> A large number of these warnings occur because of typo mistakes in
> signature tags. An evaluation over v4.13..v5.8 showed that out of 539
> warnings due to non-standard signatures, 87 are due to typo mistakes.
>
> Following are the standard signature tags which are often incorrectly
> used, along with their individual counts of incorrect use (over
> v4.13..v5.8):
>
>  Reviewed-by: 42
>  Signed-off-by: 25
>  Reported-by: 6
>  Acked-by: 4
>  Tested-by: 4
>  Suggested-by: 4
>
> Provide a fix by calculating levenshtein distance for the signature tag
> with all the standard signatures and suggest a fix with a signature, whose
> edit distance is less than or equal to 2 with the misspelled signature.
>
> Out of the 86 mispelled signatures fixed with this approach, 85 were
> found to be good corrections and 1 was bad correction.
>
> Following was found to be a bad correction:
>  Tweeted-by (count: 1) => Tested-by
>

Looks Good. Let us send it to Joe.

>
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> ---
> changes in v2: modify commit message: replace specific example with
> overall evaluation, minor changes
>
> changes in v3: summarize commit message
>
> changes in v4: improve commit message; remove signature suggestions of
> small length (ie 'cc' and 'to')
>
>  scripts/checkpatch.pl | 85 ++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 83 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index fdfd5ec09be6..2b1afd763d8d 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -506,6 +506,77 @@ our $signature_tags = qr{(?xi:
>         Cc:
>  )};
>
> +sub get_min {
> +       my (@arr) = @_;
> +       my $len = scalar @arr;
> +       if((scalar @arr) < 1) {
> +               # if underflow, return
> +               return;
> +       }
> +       my $min = $arr[0];
> +       for my $i (0 .. ($len-1)) {
> +               if ($arr[$i] < $min) {
> +                       $min = $arr[$i];
> +               }
> +       }
> +       return $min;
> +}
> +
> +sub get_edit_distance {
> +       my ($str1, $str2) = @_;
> +       my $len1 = length($str1);
> +       my $len2 = length($str2);
> +       # two dimensional array storing minimum edit distance
> +       my @distance;
> +       for my $i (0 .. $len1) {
> +               for my $j (0 .. $len2) {
> +                       if ($i == 0) {
> +                               $distance[$i][$j] = $j;
> +                       }
> +                       elsif ($j == 0) {
> +                               $distance[$i][$j] = $i;
> +                       }
> +                       elsif (substr($str1, $i-1, 1) eq substr($str2,
> $j-1, 1)) {
> +                               $distance[$i][$j] = $distance[$i - 1][$j -
> 1];
> +                       }
> +                       else {
> +                               my $dist1 = $distance[$i][$j - 1]; #insert
> distance
> +                               my $dist2 = $distance[$i - 1][$j]; # remove
> +                               my $dist3 = $distance[$i - 1][$j - 1];
> #replace
> +                               $distance[$i][$j] = 1 + get_min($dist1,
> $dist2, $dist3);
> +                       }
> +               }
> +       }
> +       return $distance[$len1][$len2];
> +}
> +
> +sub get_standard_signature {
> +       my ($sign_off) = @_;
> +       $sign_off = lc($sign_off);
> +       $sign_off =~ s/\-//g; # to match with formed hash
> +       my @standard_signature_tags = (
> +               'signed-off-by:', 'co-developed-by:', 'acked-by:',
> 'tested-by:',
> +               'reviewed-by:', 'reported-by:', 'suggested-by:'
> +       );
> +       # setting default values
> +       my $standard_signature = 'signed-off-by';
> +       my $min_edit_distance = 20;
> +       my $edit_distance;
> +       foreach (@standard_signature_tags) {
> +               my $signature = $_;
> +               $_ =~ s/\-//g;
> +               $edit_distance = get_edit_distance($sign_off, $_);
> +               if ($edit_distance < $min_edit_distance) {
> +                       $min_edit_distance = $edit_distance;
> +                       $standard_signature = $signature;
> +               }
> +       }
> +        if($min_edit_distance<=2) {
> +               return ucfirst($standard_signature);
> +        }
> +       return "";
> +}
> +
>  our @typeListMisordered = (
>         qr{char\s+(?:un)?signed},
>         qr{int\s+(?:(?:un)?signed\s+)?short\s},
> @@ -2773,8 +2844,18 @@ sub process {
>                         my $ucfirst_sign_off = ucfirst(lc($sign_off));
>
>                         if ($sign_off !~ /$signature_tags/) {
> -                               WARN("BAD_SIGN_OFF",
> -                                    "Non-standard signature: $sign_off\n"
> . $herecurr);
> +                               my $suggested_signature =
> get_standard_signature($sign_off);
> +                               if ($suggested_signature eq "") {
> +                                       WARN("BAD_SIGN_OFF",
> +                                       "Non-standard signature:
> $sign_off\n" . $herecurr);
> +                               }
> +                               else {
> +                                       if (WARN("BAD_SIGN_OFF",
> +                                                "Non-standard signature:
> $sign_off. Please use '$suggested_signature' instead\n" . $herecurr) &&
> +                                           $fix) {
> +                                               $fixed[$fixlinenr] =~
> s/$sign_off/$suggested_signature/;
> +                                       }
> +                               }
>                         }
>                         if (defined $space_before && $space_before ne "") {
>                                 if (WARN("BAD_SIGN_OFF",
> --
> 2.17.1
>
>

--0000000000005ff94205b52a5c42
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdj48YnI+PC9kaXY+PGRpdj48YnI+PGRpdiBjbGFzcz0iZ21haWxfcXVvdGUiPjxkaXYgZGly
PSJhdXRvIj5BZGl0eWEgU3JpdmFzdGF2YSAmbHQ7PGEgaHJlZj0ibWFpbHRvOnlhc2hzcmk0MjFA
Z21haWwuY29tIj55YXNoc3JpNDIxQGdtYWlsLmNvbTwvYT4mZ3Q7IHNjaHJpZWIgYW0gU2EuLCAy
OC4gTm92LiAyMDIwIHVtIDEwOjUyOjxicj48L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxf
cXVvdGUiIHN0eWxlPSJtYXJnaW46MCAwIDAgLjhleDtib3JkZXItbGVmdDoxcHggI2NjYyBzb2xp
ZDtwYWRkaW5nLWxlZnQ6MWV4Ij5DdXJyZW50bHkgY2hlY2twYXRjaCB3YXJucyBmb3IgQkFEX1NJ
R05fT0ZGIG9uIG5vbi1zdGFuZGFyZCBzaWduYXR1cmU8YnI+DQpzdHlsZXMuPGJyPg0KPGJyPg0K
QSBsYXJnZSBudW1iZXIgb2YgdGhlc2Ugd2FybmluZ3Mgb2NjdXIgYmVjYXVzZSBvZiB0eXBvIG1p
c3Rha2VzIGluPGJyPg0Kc2lnbmF0dXJlIHRhZ3MuIEFuIGV2YWx1YXRpb24gb3ZlciB2NC4xMy4u
djUuOCBzaG93ZWQgdGhhdCBvdXQgb2YgNTM5PGJyPg0Kd2FybmluZ3MgZHVlIHRvIG5vbi1zdGFu
ZGFyZCBzaWduYXR1cmVzLCA4NyBhcmUgZHVlIHRvIHR5cG8gbWlzdGFrZXMuPGJyPg0KPGJyPg0K
Rm9sbG93aW5nIGFyZSB0aGUgc3RhbmRhcmQgc2lnbmF0dXJlIHRhZ3Mgd2hpY2ggYXJlIG9mdGVu
IGluY29ycmVjdGx5PGJyPg0KdXNlZCwgYWxvbmcgd2l0aCB0aGVpciBpbmRpdmlkdWFsIGNvdW50
cyBvZiBpbmNvcnJlY3QgdXNlIChvdmVyPGJyPg0KdjQuMTMuLnY1LjgpOjxicj4NCjxicj4NCsKg
UmV2aWV3ZWQtYnk6IDQyPGJyPg0KwqBTaWduZWQtb2ZmLWJ5OiAyNTxicj4NCsKgUmVwb3J0ZWQt
Ynk6IDY8YnI+DQrCoEFja2VkLWJ5OiA0PGJyPg0KwqBUZXN0ZWQtYnk6IDQ8YnI+DQrCoFN1Z2dl
c3RlZC1ieTogNDxicj4NCjxicj4NClByb3ZpZGUgYSBmaXggYnkgY2FsY3VsYXRpbmcgbGV2ZW5z
aHRlaW4gZGlzdGFuY2UgZm9yIHRoZSBzaWduYXR1cmUgdGFnPGJyPg0Kd2l0aCBhbGwgdGhlIHN0
YW5kYXJkIHNpZ25hdHVyZXMgYW5kIHN1Z2dlc3QgYSBmaXggd2l0aCBhIHNpZ25hdHVyZSwgd2hv
c2U8YnI+DQplZGl0IGRpc3RhbmNlIGlzIGxlc3MgdGhhbiBvciBlcXVhbCB0byAyIHdpdGggdGhl
IG1pc3NwZWxsZWQgc2lnbmF0dXJlLjxicj4NCjxicj4NCk91dCBvZiB0aGUgODYgbWlzcGVsbGVk
IHNpZ25hdHVyZXMgZml4ZWQgd2l0aCB0aGlzIGFwcHJvYWNoLCA4NSB3ZXJlPGJyPg0KZm91bmQg
dG8gYmUgZ29vZCBjb3JyZWN0aW9ucyBhbmQgMSB3YXMgYmFkIGNvcnJlY3Rpb24uPGJyPg0KPGJy
Pg0KRm9sbG93aW5nIHdhcyBmb3VuZCB0byBiZSBhIGJhZCBjb3JyZWN0aW9uOjxicj4NCsKgVHdl
ZXRlZC1ieSAoY291bnQ6IDEpID0mZ3Q7IFRlc3RlZC1ieTxicj4NCjwvYmxvY2txdW90ZT48ZGl2
IGRpcj0iYXV0byI+PGJyPjwvZGl2PjxkaXYgZGlyPSJhdXRvIj5Mb29rcyBHb29kLiBMZXQgdXMg
c2VuZCBpdCB0byBKb2UuPC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHls
ZT0ibWFyZ2luOjAgMCAwIC44ZXg7Ym9yZGVyLWxlZnQ6MXB4ICNjY2Mgc29saWQ7cGFkZGluZy1s
ZWZ0OjFleCI+PGJyPg0KU2lnbmVkLW9mZi1ieTogQWRpdHlhIFNyaXZhc3RhdmEgJmx0OzxhIGhy
ZWY9Im1haWx0bzp5YXNoc3JpNDIxQGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPnlhc2hzcmk0
MjFAZ21haWwuY29tPC9hPiZndDs8YnI+DQotLS08YnI+DQpjaGFuZ2VzIGluIHYyOiBtb2RpZnkg
Y29tbWl0IG1lc3NhZ2U6IHJlcGxhY2Ugc3BlY2lmaWMgZXhhbXBsZSB3aXRoIG92ZXJhbGwgZXZh
bHVhdGlvbiwgbWlub3IgY2hhbmdlczxicj4NCjxicj4NCmNoYW5nZXMgaW4gdjM6IHN1bW1hcml6
ZSBjb21taXQgbWVzc2FnZTxicj4NCjxicj4NCmNoYW5nZXMgaW4gdjQ6IGltcHJvdmUgY29tbWl0
IG1lc3NhZ2U7IHJlbW92ZSBzaWduYXR1cmUgc3VnZ2VzdGlvbnMgb2Ygc21hbGwgbGVuZ3RoIChp
ZSAmIzM5O2NjJiMzOTsgYW5kICYjMzk7dG8mIzM5Oyk8YnI+DQo8YnI+DQrCoHNjcmlwdHMvPGEg
aHJlZj0iaHR0cDovL2NoZWNrcGF0Y2gucGwiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxh
bmsiPmNoZWNrcGF0Y2gucGw8L2E+IHwgODUgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrLTxicj4NCsKgMSBmaWxlIGNoYW5nZWQsIDgzIGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pPGJyPg0KPGJyPg0KZGlmZiAtLWdpdCBhL3NjcmlwdHMvPGEgaHJlZj0iaHR0
cDovL2NoZWNrcGF0Y2gucGwiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmNoZWNr
cGF0Y2gucGw8L2E+IGIvc2NyaXB0cy88YSBocmVmPSJodHRwOi8vY2hlY2twYXRjaC5wbCIgcmVs
PSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+Y2hlY2twYXRjaC5wbDwvYT48YnI+DQppbmRl
eCBmZGZkNWVjMDliZTYuLjJiMWFmZDc2M2Q4ZCAxMDA3NTU8YnI+DQotLS0gYS9zY3JpcHRzLzxh
IGhyZWY9Imh0dHA6Ly9jaGVja3BhdGNoLnBsIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2Js
YW5rIj5jaGVja3BhdGNoLnBsPC9hPjxicj4NCisrKyBiL3NjcmlwdHMvPGEgaHJlZj0iaHR0cDov
L2NoZWNrcGF0Y2gucGwiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmNoZWNrcGF0
Y2gucGw8L2E+PGJyPg0KQEAgLTUwNiw2ICs1MDYsNzcgQEAgb3VyICRzaWduYXR1cmVfdGFncyA9
IHFyeyg/eGk6PGJyPg0KwqAgwqAgwqAgwqAgQ2M6PGJyPg0KwqApfTs8YnI+DQo8YnI+DQorc3Vi
IGdldF9taW4gezxicj4NCivCoCDCoCDCoCDCoG15IChAYXJyKSA9IEBfOzxicj4NCivCoCDCoCDC
oCDCoG15ICRsZW4gPSBzY2FsYXIgQGFycjs8YnI+DQorwqAgwqAgwqAgwqBpZigoc2NhbGFyIEBh
cnIpICZsdDsgMSkgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCMgaWYgdW5kZXJmbG93
LCByZXR1cm48YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZXR1cm47PGJyPg0KK8KgIMKg
IMKgIMKgfTxicj4NCivCoCDCoCDCoCDCoG15ICRtaW4gPSAkYXJyWzBdOzxicj4NCivCoCDCoCDC
oCDCoGZvciBteSAkaSAoMCAuLiAoJGxlbi0xKSkgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoGlmICgkYXJyWyRpXSAmbHQ7ICRtaW4pIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAkbWluID0gJGFyclskaV07PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgfTxicj4NCivCoCDCoCDCoCDCoH08YnI+DQorwqAgwqAgwqAgwqByZXR1cm4gJG1pbjs8YnI+
DQorfTxicj4NCis8YnI+DQorc3ViIGdldF9lZGl0X2Rpc3RhbmNlIHs8YnI+DQorwqAgwqAgwqAg
wqBteSAoJHN0cjEsICRzdHIyKSA9IEBfOzxicj4NCivCoCDCoCDCoCDCoG15ICRsZW4xID0gbGVu
Z3RoKCRzdHIxKTs8YnI+DQorwqAgwqAgwqAgwqBteSAkbGVuMiA9IGxlbmd0aCgkc3RyMik7PGJy
Pg0KK8KgIMKgIMKgIMKgIyB0d28gZGltZW5zaW9uYWwgYXJyYXkgc3RvcmluZyBtaW5pbXVtIGVk
aXQgZGlzdGFuY2U8YnI+DQorwqAgwqAgwqAgwqBteSBAZGlzdGFuY2U7PGJyPg0KK8KgIMKgIMKg
IMKgZm9yIG15ICRpICgwIC4uICRsZW4xKSB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
Zm9yIG15ICRqICgwIC4uICRsZW4yKSB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgaWYgKCRpID09IDApIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAkZGlzdGFuY2VbJGldWyRqXSA9ICRqOzxicj4NCivCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH08YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBlbHNpZiAoJGogPT0gMCkgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCRkaXN0YW5jZVskaV1bJGpdID0gJGk7PGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoGVsc2lmIChzdWJzdHIoJHN0cjEsICRpLTEsIDEpIGVxIHN1
YnN0cigkc3RyMiwgJGotMSwgMSkpIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAkZGlzdGFuY2VbJGldWyRqXSA9ICRkaXN0YW5jZVskaSAtIDFd
WyRqIC0gMV07PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTxicj4N
CivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGVsc2Ugezxicj4NCivCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoG15ICRkaXN0MSA9ICRkaXN0
YW5jZVskaV1bJGogLSAxXTsgI2luc2VydCBkaXN0YW5jZTxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoG15ICRkaXN0MiA9ICRkaXN0YW5jZVskaSAt
IDFdWyRqXTsgIyByZW1vdmU8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBteSAkZGlzdDMgPSAkZGlzdGFuY2VbJGkgLSAxXVskaiAtIDFdOyAjcmVw
bGFjZTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCRkaXN0YW5jZVskaV1bJGpdID0gMSArIGdldF9taW4oJGRpc3QxLCAkZGlzdDIsICRkaXN0Myk7
PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTxicj4NCivCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoH08YnI+DQorwqAgwqAgwqAgwqB9PGJyPg0KK8KgIMKgIMKgIMKgcmV0
dXJuICRkaXN0YW5jZVskbGVuMV1bJGxlbjJdOzxicj4NCit9PGJyPg0KKzxicj4NCitzdWIgZ2V0
X3N0YW5kYXJkX3NpZ25hdHVyZSB7PGJyPg0KK8KgIMKgIMKgIMKgbXkgKCRzaWduX29mZikgPSBA
Xzs8YnI+DQorwqAgwqAgwqAgwqAkc2lnbl9vZmYgPSBsYygkc2lnbl9vZmYpOzxicj4NCivCoCDC
oCDCoCDCoCRzaWduX29mZiA9fiBzL1wtLy9nOyAjIHRvIG1hdGNoIHdpdGggZm9ybWVkIGhhc2g8
YnI+DQorwqAgwqAgwqAgwqBteSBAc3RhbmRhcmRfc2lnbmF0dXJlX3RhZ3MgPSAoPGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgJiMzOTtzaWduZWQtb2ZmLWJ5OiYjMzk7LCAmIzM5O2NvLWRl
dmVsb3BlZC1ieTomIzM5OywgJiMzOTthY2tlZC1ieTomIzM5OywgJiMzOTt0ZXN0ZWQtYnk6JiMz
OTssPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJiMzOTtyZXZpZXdlZC1ieTomIzM5Oywg
JiMzOTtyZXBvcnRlZC1ieTomIzM5OywgJiMzOTtzdWdnZXN0ZWQtYnk6JiMzOTs8YnI+DQorwqAg
wqAgwqAgwqApOzxicj4NCivCoCDCoCDCoCDCoCMgc2V0dGluZyBkZWZhdWx0IHZhbHVlczxicj4N
CivCoCDCoCDCoCDCoG15ICRzdGFuZGFyZF9zaWduYXR1cmUgPSAmIzM5O3NpZ25lZC1vZmYtYnkm
IzM5Ozs8YnI+DQorwqAgwqAgwqAgwqBteSAkbWluX2VkaXRfZGlzdGFuY2UgPSAyMDs8YnI+DQor
wqAgwqAgwqAgwqBteSAkZWRpdF9kaXN0YW5jZTs8YnI+DQorwqAgwqAgwqAgwqBmb3JlYWNoIChA
c3RhbmRhcmRfc2lnbmF0dXJlX3RhZ3MpIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBt
eSAkc2lnbmF0dXJlID0gJF87PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJF8gPX4gcy9c
LS8vZzs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAkZWRpdF9kaXN0YW5jZSA9IGdldF9l
ZGl0X2Rpc3RhbmNlKCRzaWduX29mZiwgJF8pOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oGlmICgkZWRpdF9kaXN0YW5jZSAmbHQ7ICRtaW5fZWRpdF9kaXN0YW5jZSkgezxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCRtaW5fZWRpdF9kaXN0YW5jZSA9ICRlZGl0
X2Rpc3RhbmNlOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCRzdGFu
ZGFyZF9zaWduYXR1cmUgPSAkc2lnbmF0dXJlOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oH08YnI+DQorwqAgwqAgwqAgwqB9PGJyPg0KK8KgIMKgIMKgIMKgIGlmKCRtaW5fZWRpdF9kaXN0
YW5jZSZsdDs9Mikgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJldHVybiB1Y2ZpcnN0
KCRzdGFuZGFyZF9zaWduYXR1cmUpOzxicj4NCivCoCDCoCDCoCDCoCB9PGJyPg0KK8KgIMKgIMKg
IMKgcmV0dXJuICZxdW90OyZxdW90Ozs8YnI+DQorfTxicj4NCis8YnI+DQrCoG91ciBAdHlwZUxp
c3RNaXNvcmRlcmVkID0gKDxicj4NCsKgIMKgIMKgIMKgIHFye2NoYXJccysoPzp1bik/c2lnbmVk
fSw8YnI+DQrCoCDCoCDCoCDCoCBxcntpbnRccysoPzooPzp1bik/c2lnbmVkXHMrKT9zaG9ydFxz
fSw8YnI+DQpAQCAtMjc3Myw4ICsyODQ0LDE4IEBAIHN1YiBwcm9jZXNzIHs8YnI+DQrCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBteSAkdWNmaXJzdF9zaWduX29mZiA9IHVjZmly
c3QobGMoJHNpZ25fb2ZmKSk7PGJyPg0KPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgaWYgKCRzaWduX29mZiAhfiAvJHNpZ25hdHVyZV90YWdzLykgezxicj4NCi3CoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoFdBUk4oJnF1b3Q7QkFE
X1NJR05fT0ZGJnF1b3Q7LDxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCAmcXVvdDtOb24tc3RhbmRhcmQgc2lnbmF0dXJlOiAkc2lnbl9v
ZmZcbiZxdW90OyAuICRoZXJlY3Vycik7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgbXkgJHN1Z2dlc3RlZF9zaWduYXR1cmUgPSBnZXRfc3RhbmRh
cmRfc2lnbmF0dXJlKCRzaWduX29mZik7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgaWYgKCRzdWdnZXN0ZWRfc2lnbmF0dXJlIGVxICZxdW90OyZx
dW90Oykgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoFdBUk4oJnF1b3Q7QkFEX1NJR05fT0ZGJnF1b3Q7LDxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZx
dW90O05vbi1zdGFuZGFyZCBzaWduYXR1cmU6ICRzaWduX29mZlxuJnF1b3Q7IC4gJGhlcmVjdXJy
KTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9
PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZWxz
ZSB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgaWYgKFdBUk4oJnF1b3Q7QkFEX1NJR05fT0ZGJnF1b3Q7LDxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCAmcXVvdDtOb24tc3RhbmRhcmQgc2lnbmF0dXJlOiAkc2lnbl9vZmYuIFBsZWFz
ZSB1c2UgJiMzOTskc3VnZ2VzdGVkX3NpZ25hdHVyZSYjMzk7IGluc3RlYWRcbiZxdW90OyAuICRo
ZXJlY3VycikgJmFtcDsmYW1wOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCRmaXgpIHs8YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAkZml4ZWRbJGZpeGxpbmVucl0gPX4gcy8kc2lnbl9vZmYvJHN1Z2dlc3RlZF9zaWduYXR1
cmUvOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoH08YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqB9PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfTxi
cj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGlmIChkZWZpbmVkICRzcGFj
ZV9iZWZvcmUgJmFtcDsmYW1wOyAkc3BhY2VfYmVmb3JlIG5lICZxdW90OyZxdW90Oykgezxicj4N
CsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGlmIChXQVJO
KCZxdW90O0JBRF9TSUdOX09GRiZxdW90Oyw8YnI+DQotLSA8YnI+DQoyLjE3LjE8YnI+DQo8YnI+
DQo8L2Jsb2NrcXVvdGU+PC9kaXY+PC9kaXY+DQo=
--0000000000005ff94205b52a5c42--

--===============4440190750729707151==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============4440190750729707151==--
