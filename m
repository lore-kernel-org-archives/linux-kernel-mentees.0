Return-Path: <SRS0=mimn=EQ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11021C388F7
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Nov 2020 18:43:56 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 571B5206F1
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Nov 2020 18:43:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZnwUJ8IX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 571B5206F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C4EAB85BB8;
	Tue, 10 Nov 2020 18:43:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pLvzvFdO2vnL; Tue, 10 Nov 2020 18:43:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E542785B80;
	Tue, 10 Nov 2020 18:43:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DE5B9C0889;
	Tue, 10 Nov 2020 18:43:49 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AEADEC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 18:43:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 9792E8716D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 18:43:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C60qjTZiaHrP
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 18:43:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 50E9A87175
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 18:43:47 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id n129so15356964iod.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 10:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7YYT5XGbaC7rgLLRbVeIzt/Pf8QwcQt9pgDwUnQaP2E=;
 b=ZnwUJ8IXi24210rDyikDR85XYn/AfI0qWt9J2dqtwKS8KD5IrAL0LQPripq2zknK/b
 CFKmey37pwNI2XJnDuEcRbc7quudgSI8MQp+VC6CsSWEGIEaDBHRJIu6N7NwDKu0KDI9
 +iPoFic6GBomv8XpEl2svFHFUjkEyJUKxYJSlBLtbcVvc+5JDBxunhu1v0FrPZdVpatU
 r2e36MdetiG1X/D6dRkPY9W+QrF6I7RKVzxKAPWIhErNrPS2NaPmfh2pj44nqzQVfQyh
 9MmsqDSEPmBWRIsIlQbpFKOXCshnZr+t5g9ZPzSyNv2a8lED092dskeVEQOQgfmBwM5W
 a9ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7YYT5XGbaC7rgLLRbVeIzt/Pf8QwcQt9pgDwUnQaP2E=;
 b=lISRkLxpNBafNKm0KV5VXhqm7K2DbEfOnaNw8SiupS8Qsbg7z1K8ARhT+1zubeI4NY
 s3Ww/dVOMedpN5401/aqWh/C1fx9R4V8yIYDuaNIjTJymgnfFnk7WfeG67pY9SQn65+J
 zV0G4yd/LR6PYgykX4he6rku75u0tzsndcjHICS14cV1SKczF0gWG+vfN8xS3uNr54Pj
 Osq7bVzAxv7KWE2uJzBL5hsgLSm25lNCDWMcMsooLBZmRb+J3EzMZHZHo+Nohf0NRrUy
 /stgxdtp5YHGCRUybiIR5PAvkoDKS7STjS0fAzczAHfhzIvyOYtGmClZ9r5Ev6B5EfAS
 it3Q==
X-Gm-Message-State: AOAM532s5/Y60Diem2FSkqKK7kitZnBR57nAhP0ss9J0COpyjB2dhsu0
 eWRI7pk3GVLiGYKUXoGjQZEEeep8tk66SbUbzw4=
X-Google-Smtp-Source: ABdhPJwifS58kcPY9gBOpyIreXqGya1kAG0HEXne1+P4q9kS+976azynlwlztb8uqM42Nj3hcVq3Z5CAA26VXEeVgpQ=
X-Received: by 2002:a5d:990e:: with SMTP id x14mr8756057iol.158.1605033826560; 
 Tue, 10 Nov 2020 10:43:46 -0800 (PST)
MIME-Version: 1.0
References: <20201110130602.22359-1-yashsri421@gmail.com>
 <CAKXUXMxVfW3nDzGqhK2pwD6fVtcmSNK-USLtNaLVK_+E_6Smpg@mail.gmail.com>
 <4291189c-4c65-4637-9b24-4ae00ac8a1a8@gmail.com>
 <CAKXUXMzdMuXaY02Lz2fvMyGBB+5vNxtT4XJemEGaZdYcXzrR0g@mail.gmail.com>
 <d0a69d66-83e0-092e-af7b-dc63e04b0a9a@gmail.com>
In-Reply-To: <d0a69d66-83e0-092e-af7b-dc63e04b0a9a@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Tue, 10 Nov 2020 19:43:34 +0100
Message-ID: <CAKXUXMyNTXJ6u0SQfBEBoT5ifDZ9gu4bRLZS2vZDvszvr6XjXA@mail.gmail.com>
To: Aditya <yashsri421@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: add fix option for
	MISSING_SIGN_OFF
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
Content-Type: multipart/mixed; boundary="===============1611639314737630762=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============1611639314737630762==
Content-Type: multipart/alternative; boundary="00000000000015aed005b3c50f11"

--00000000000015aed005b3c50f11
Content-Type: text/plain; charset="UTF-8"

On Di., 10. Nov. 2020 at 19:13, Aditya <yashsri421@gmail.com> wrote:

> On 10/11/20 8:52 pm, Lukas Bulwahn wrote:
> > On Tue, Nov 10, 2020 at 4:13 PM Aditya <yashsri421@gmail.com> wrote:
> >>
> >> On 10/11/20 7:30 pm, Lukas Bulwahn wrote:
> >>> On Tue, Nov 10, 2020 at 2:06 PM Aditya Srivastava <
> yashsri421@gmail.com> wrote:
> >>>>
> >>>> Currently checkpatch warns us if there is no 'Signed-off-by' line
> >>>> for the patch.
> >>>>
> >>>> E.g., running checkpatch on commit 9ac060a708e0 ("leaking_addresses:
> >>>> Completely remove --version flag") reports this error:
> >>>>
> >>>> ERROR: Missing Signed-off-by: line(s)
> >>>>
> >>>> Provide a fix by adding a Signed-off-by line corresponding to the
> author
> >>>> of the patch before the patch separator line. Also avoid this error
> for
> >>>> the commits where some typo is present in the sign off.
> >>>>
> >>>> E.g. for commit 8cde5d5f7361 ("bus: ti-sysc: Detect omap4 type timers
> >>>> for quirk") we get missing sign off as well as bad sign off for:
> >>>>
> >>>> Siganed-off-by: Tony Lindgren <tony@atomide.com>
> >>>>
> >>>> Here it is probably best to give BAD_SIGN_OFF warning for Non-standard
> >>>> signature and avoid MISSING_SIGN_OFF
> >>>>
> >>>> Suggested-by: Joe Perches <joe@perches.com>
> >>>> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> >>>> ---
> >>>> This patch was made after applying
> https://lore.kernel.org/linux-kernel-mentees/20201108100632.75340-1-dwaipayanray1@gmail.com/
> >>>> and my last changes at
> https://lore.kernel.org/linux-kernel-mentees/20201108134317.25400-1-yashsri421@gmail.com/
> >>>>
> >>>>  scripts/checkpatch.pl | 18 +++++++++++++++---
> >>>>  1 file changed, 15 insertions(+), 3 deletions(-)
> >>>>
> >>>> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> >>>> index cb46288127ac..2deffd0c091b 100755
> >>>> --- a/scripts/checkpatch.pl
> >>>> +++ b/scripts/checkpatch.pl
> >>>> @@ -2404,6 +2404,8 @@ sub process {
> >>>>
> >>>>         my $last_blank_line = 0;
> >>>>         my $last_coalesced_string_linenr = -1;
> >>>> +       my $patch_separator_linenr = 0;
> >>>> +       my $non_standard_signature = 0;
> >>>>
> >>>>         our @report = ();
> >>>>         our $cnt_lines = 0;
> >>>> @@ -2755,6 +2757,10 @@ sub process {
> >>>>                 if ($line =~ /^---$/) {
> >>>>                         $has_patch_separator = 1;
> >>>>                         $in_commit_log = 0;
> >>>> +                       # to add missing sign off line before diff(s)
> >>>> +                       if($patch_separator_linenr == 0) {
> >>>> +                               $patch_separator_linenr = $linenr;
> >>>
> >>> Well are you sure linenr is correct? (As I wrote, I do not know, but
> >>> you should know.)
> >>>
> >>> I think you would need to create a patch for testing your feature
> >>> where multiple things are fixed within the same patch and then check
> >>> if the fix is added at the right place.
> >>>
> >>
> >> I checked the fix over following patch.
> >>
> >> I have modified the patch such that it has co-developed-by as the
> >> author(nominal patch author warning, which requires this line to be
> >> deleted)
> >>
> >> Also 'occuring', which is a typo(where the typo needs to be replaced)
> >>
> >> It works as expected.
> >>
> >
> > Well to really check if it works as expected, you need to have a test
> > patch where a fix adds multiple lines into the fixed patch before the
> > line you try to record.
> >
> > Then, fixlinenr and linenr are probably more than just 1 line apart,
> > but really multiple lines apart and only if you record the right
> > variable it really works.
> >
>
> Actually we currently don't have any new line insertion fixes for
> lines above patch separator.
> So, I modified checkpatch a bit to insert (instead of delete) for
> co-developed-by.
> ie here:
>
> if (WARN("BAD_SIGN_OFF",
>          "Co-developed-by: should not be used to attribute nominal patch
> author '$author'\n" . "$here\n" . $rawline) &&
>     $fix) {
> -       fix_delete_line($fixlinenr, $rawline);
> +       fix_insert_line($fixlinenr, $rawline);
> }
>
>
> When repeated a few times and removing signed-off-by, this provided an
> experience of inserting multiple lines before signed-off-by (as for
> each co-developed-by, it is inserting a new co-developed-by)
>
> With this as well, the fix was working as expected, ie, got this after
> some iterations of removing signed-off-by and keeping co-developed-by:
>
> ...
> It is causing boot failures with qemu mac99 in at least some
> configurations.occurring
> Co-developed-by: Michael Ellerman <mpe@ellerman.id.au>
> Co-developed-by: Michael Ellerman <mpe@ellerman.id.au>
> Co-developed-by: Michael Ellerman <mpe@ellerman.id.au>
> Co-developed-by: Michael Ellerman <mpe@ellerman.id.au>
> Co-developed-by: Michael Ellerman <mpe@ellerman.id.au>
> Co-developed-by: Michael Ellerman <mpe@ellerman.id.au>
> Co-developed-by: Michael Ellerman <mpe@ellerman.id.au>
> Co-developed-by: Michael Ellerman <mpe@ellerman.id.au>
> Co-developed-by: Michael Ellerman <mpe@ellerman.id.au>
> Co-developed-by: Michael Ellerman <mpe@ellerman.id.au>
> Co-developed-by: Michael Ellerman <mpe@ellerman.id.au>
> Co-developed-by: Michael Ellerman <mpe@ellerman.id.au>
> Co-developed-by: Michael Ellerman <mpe@ellerman.id.au>
> Co-developed-by: Michael Ellerman <mpe@ellerman.id.au>
> Co-developed-by: Michael Ellerman <mpe@ellerman.id.au>
> Co-developed-by: Michael Ellerman <mpe@ellerman.id.au>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>  arch/powerpc/include/asm/book3s/32/hash.h | 8 ++++----
>
>

I did not look into the details. If you are 100% sure that your patch is
right, let us send it to Joe and the mailing list.

I think next a fix for bad sign-off that corrects those obvious typos would
be nice as well.

Lukas


> Aditya
>
> > Other than that, it is all good.
> >
> > Lukas
> >
>
>

--00000000000015aed005b3c50f11
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"auto">On Di.=
, 10. Nov. 2020 at 19:13, Aditya &lt;<a href=3D"mailto:yashsri421@gmail.com=
">yashsri421@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">On 10/11/20 8:52 pm, Lukas Bulwahn wrote:<br>
&gt; On Tue, Nov 10, 2020 at 4:13 PM Aditya &lt;<a href=3D"mailto:yashsri42=
1@gmail.com" target=3D"_blank">yashsri421@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On 10/11/20 7:30 pm, Lukas Bulwahn wrote:<br>
&gt;&gt;&gt; On Tue, Nov 10, 2020 at 2:06 PM Aditya Srivastava &lt;<a href=
=3D"mailto:yashsri421@gmail.com" target=3D"_blank">yashsri421@gmail.com</a>=
&gt; wrote:<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Currently checkpatch warns us if there is no &#39;Signed-o=
ff-by&#39; line<br>
&gt;&gt;&gt;&gt; for the patch.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; E.g., running checkpatch on commit 9ac060a708e0 (&quot;lea=
king_addresses:<br>
&gt;&gt;&gt;&gt; Completely remove --version flag&quot;) reports this error=
:<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; ERROR: Missing Signed-off-by: line(s)<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Provide a fix by adding a Signed-off-by line corresponding=
 to the author<br>
&gt;&gt;&gt;&gt; of the patch before the patch separator line. Also avoid t=
his error for<br>
&gt;&gt;&gt;&gt; the commits where some typo is present in the sign off.<br=
>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; E.g. for commit 8cde5d5f7361 (&quot;bus: ti-sysc: Detect o=
map4 type timers<br>
&gt;&gt;&gt;&gt; for quirk&quot;) we get missing sign off as well as bad si=
gn off for:<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Siganed-off-by: Tony Lindgren &lt;<a href=3D"mailto:tony@a=
tomide.com" target=3D"_blank">tony@atomide.com</a>&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Here it is probably best to give BAD_SIGN_OFF warning for =
Non-standard<br>
&gt;&gt;&gt;&gt; signature and avoid MISSING_SIGN_OFF<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Suggested-by: Joe Perches &lt;<a href=3D"mailto:joe@perche=
s.com" target=3D"_blank">joe@perches.com</a>&gt;<br>
&gt;&gt;&gt;&gt; Signed-off-by: Aditya Srivastava &lt;<a href=3D"mailto:yas=
hsri421@gmail.com" target=3D"_blank">yashsri421@gmail.com</a>&gt;<br>
&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt; This patch was made after applying <a href=3D"https://lore=
.kernel.org/linux-kernel-mentees/20201108100632.75340-1-dwaipayanray1@gmail=
.com/" rel=3D"noreferrer" target=3D"_blank">https://lore.kernel.org/linux-k=
ernel-mentees/20201108100632.75340-1-dwaipayanray1@gmail.com/</a><br>
&gt;&gt;&gt;&gt; and my last changes at <a href=3D"https://lore.kernel.org/=
linux-kernel-mentees/20201108134317.25400-1-yashsri421@gmail.com/" rel=3D"n=
oreferrer" target=3D"_blank">https://lore.kernel.org/linux-kernel-mentees/2=
0201108134317.25400-1-yashsri421@gmail.com/</a><br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;=C2=A0 scripts/<a href=3D"http://checkpatch.pl" rel=3D"nore=
ferrer" target=3D"_blank">checkpatch.pl</a> | 18 +++++++++++++++---<br>
&gt;&gt;&gt;&gt;=C2=A0 1 file changed, 15 insertions(+), 3 deletions(-)<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; diff --git a/scripts/<a href=3D"http://checkpatch.pl" rel=
=3D"noreferrer" target=3D"_blank">checkpatch.pl</a> b/scripts/<a href=3D"ht=
tp://checkpatch.pl" rel=3D"noreferrer" target=3D"_blank">checkpatch.pl</a><=
br>
&gt;&gt;&gt;&gt; index cb46288127ac..2deffd0c091b 100755<br>
&gt;&gt;&gt;&gt; --- a/scripts/<a href=3D"http://checkpatch.pl" rel=3D"nore=
ferrer" target=3D"_blank">checkpatch.pl</a><br>
&gt;&gt;&gt;&gt; +++ b/scripts/<a href=3D"http://checkpatch.pl" rel=3D"nore=
ferrer" target=3D"_blank">checkpatch.pl</a><br>
&gt;&gt;&gt;&gt; @@ -2404,6 +2404,8 @@ sub process {<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0my $last_blank_line =3D 0=
;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0my $last_coalesced_string=
_linenr =3D -1;<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0my $patch_separator_linenr =3D=
 0;<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0my $non_standard_signature =3D=
 0;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0our @report =3D ();<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0our $cnt_lines =3D 0;<br>
&gt;&gt;&gt;&gt; @@ -2755,6 +2757,10 @@ sub process {<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0if ($line =3D~ /^---$/) {<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$has_patch_separator =3D 1;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$in_commit_log =3D 0;<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0# to add missing sign off line before diff(s)<br=
>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0if($patch_separator_linenr =3D=3D 0) {<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$patch_separator_lin=
enr =3D $linenr;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Well are you sure linenr is correct? (As I wrote, I do not kno=
w, but<br>
&gt;&gt;&gt; you should know.)<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I think you would need to create a patch for testing your feat=
ure<br>
&gt;&gt;&gt; where multiple things are fixed within the same patch and then=
 check<br>
&gt;&gt;&gt; if the fix is added at the right place.<br>
&gt;&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; I checked the fix over following patch.<br>
&gt;&gt;<br>
&gt;&gt; I have modified the patch such that it has co-developed-by as the<=
br>
&gt;&gt; author(nominal patch author warning, which requires this line to b=
e<br>
&gt;&gt; deleted)<br>
&gt;&gt;<br>
&gt;&gt; Also &#39;occuring&#39;, which is a typo(where the typo needs to b=
e replaced)<br>
&gt;&gt;<br>
&gt;&gt; It works as expected.<br>
&gt;&gt;<br>
&gt; <br>
&gt; Well to really check if it works as expected, you need to have a test<=
br>
&gt; patch where a fix adds multiple lines into the fixed patch before the<=
br>
&gt; line you try to record.<br>
&gt; <br>
&gt; Then, fixlinenr and linenr are probably more than just 1 line apart,<b=
r>
&gt; but really multiple lines apart and only if you record the right<br>
&gt; variable it really works.<br>
&gt; <br>
<br>
Actually we currently don&#39;t have any new line insertion fixes for<br>
lines above patch separator.<br>
So, I modified checkpatch a bit to insert (instead of delete) for<br>
co-developed-by.<br>
ie here:<br>
<br>
if (WARN(&quot;BAD_SIGN_OFF&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Co-developed-by: should not be used=
 to attribute nominal patch<br>
author &#39;$author&#39;\n&quot; . &quot;$here\n&quot; . $rawline) &amp;&am=
p;<br>
=C2=A0 =C2=A0 $fix) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fix_delete_line($fixlinenr, $rawline);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fix_insert_line($fixlinenr, $rawline);<br>
}<br>
<br>
<br>
When repeated a few times and removing signed-off-by, this provided an<br>
experience of inserting multiple lines before signed-off-by (as for<br>
each co-developed-by, it is inserting a new co-developed-by)<br>
<br>
With this as well, the fix was working as expected, ie, got this after<br>
some iterations of removing signed-off-by and keeping co-developed-by:<br>
<br>
...<br>
It is causing boot failures with qemu mac99 in at least some<br>
configurations.occurring<br>
Co-developed-by: Michael Ellerman &lt;<a href=3D"mailto:mpe@ellerman.id.au"=
 target=3D"_blank">mpe@ellerman.id.au</a>&gt;<br>
Co-developed-by: Michael Ellerman &lt;<a href=3D"mailto:mpe@ellerman.id.au"=
 target=3D"_blank">mpe@ellerman.id.au</a>&gt;<br>
Co-developed-by: Michael Ellerman &lt;<a href=3D"mailto:mpe@ellerman.id.au"=
 target=3D"_blank">mpe@ellerman.id.au</a>&gt;<br>
Co-developed-by: Michael Ellerman &lt;<a href=3D"mailto:mpe@ellerman.id.au"=
 target=3D"_blank">mpe@ellerman.id.au</a>&gt;<br>
Co-developed-by: Michael Ellerman &lt;<a href=3D"mailto:mpe@ellerman.id.au"=
 target=3D"_blank">mpe@ellerman.id.au</a>&gt;<br>
Co-developed-by: Michael Ellerman &lt;<a href=3D"mailto:mpe@ellerman.id.au"=
 target=3D"_blank">mpe@ellerman.id.au</a>&gt;<br>
Co-developed-by: Michael Ellerman &lt;<a href=3D"mailto:mpe@ellerman.id.au"=
 target=3D"_blank">mpe@ellerman.id.au</a>&gt;<br>
Co-developed-by: Michael Ellerman &lt;<a href=3D"mailto:mpe@ellerman.id.au"=
 target=3D"_blank">mpe@ellerman.id.au</a>&gt;<br>
Co-developed-by: Michael Ellerman &lt;<a href=3D"mailto:mpe@ellerman.id.au"=
 target=3D"_blank">mpe@ellerman.id.au</a>&gt;<br>
Co-developed-by: Michael Ellerman &lt;<a href=3D"mailto:mpe@ellerman.id.au"=
 target=3D"_blank">mpe@ellerman.id.au</a>&gt;<br>
Co-developed-by: Michael Ellerman &lt;<a href=3D"mailto:mpe@ellerman.id.au"=
 target=3D"_blank">mpe@ellerman.id.au</a>&gt;<br>
Co-developed-by: Michael Ellerman &lt;<a href=3D"mailto:mpe@ellerman.id.au"=
 target=3D"_blank">mpe@ellerman.id.au</a>&gt;<br>
Co-developed-by: Michael Ellerman &lt;<a href=3D"mailto:mpe@ellerman.id.au"=
 target=3D"_blank">mpe@ellerman.id.au</a>&gt;<br>
Co-developed-by: Michael Ellerman &lt;<a href=3D"mailto:mpe@ellerman.id.au"=
 target=3D"_blank">mpe@ellerman.id.au</a>&gt;<br>
Co-developed-by: Michael Ellerman &lt;<a href=3D"mailto:mpe@ellerman.id.au"=
 target=3D"_blank">mpe@ellerman.id.au</a>&gt;<br>
Co-developed-by: Michael Ellerman &lt;<a href=3D"mailto:mpe@ellerman.id.au"=
 target=3D"_blank">mpe@ellerman.id.au</a>&gt;<br>
Signed-off-by: Michael Ellerman &lt;<a href=3D"mailto:mpe@ellerman.id.au" t=
arget=3D"_blank">mpe@ellerman.id.au</a>&gt;<br>
---<br>
=C2=A0arch/powerpc/include/asm/book3s/32/hash.h | 8 ++++----<br>
<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div d=
ir=3D"auto">I did not look into the details. If you are 100% sure that your=
 patch is right, let us send it to Joe and the mailing list.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">I think next a fix for bad sign-off t=
hat corrects those obvious typos would be nice as well.</div><div dir=3D"au=
to"><br></div><div dir=3D"auto">Lukas</div><div dir=3D"auto"><br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex"><br>
Aditya<br>
<br>
&gt; Other than that, it is all good.<br>
&gt; <br>
&gt; Lukas<br>
&gt; <br>
<br>
</blockquote></div></div>

--00000000000015aed005b3c50f11--

--===============1611639314737630762==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============1611639314737630762==--
