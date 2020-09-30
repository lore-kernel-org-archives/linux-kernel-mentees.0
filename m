Return-Path: <SRS0=42xI=DH=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91721C4727E
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 30 Sep 2020 19:22:39 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 147CB20709
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 30 Sep 2020 19:22:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YUZbEEP8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 147CB20709
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id AB4D78719E;
	Wed, 30 Sep 2020 19:22:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3sdaTzstgLrl; Wed, 30 Sep 2020 19:22:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1DD99870BF;
	Wed, 30 Sep 2020 19:22:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 030BDC0889;
	Wed, 30 Sep 2020 19:22:38 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9A989C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 19:22:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 8013622636
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 19:22:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RiVO1omiZLoi
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 19:22:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by silver.osuosl.org (Postfix) with ESMTPS id 441F22039C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 19:22:35 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id y5so2962101otg.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 12:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QR+O42bqNg0Yscv1dun6J9ERQXwjYGgCeQmUCAEpies=;
 b=YUZbEEP8BBSpMYD/QTAY3ouRyEO3eqG5sJWR5IZrCjf1zVvhi9tD/l7Xm/kRgO33AD
 Ct0On2yRngbZ7WRqocpzmUy0CzWusd7J78+PV3SAV3h1zDxrSZR9su6lLYuZzvocuPOZ
 hGbI4CAYsOjdIzRVKh8wkHQ//x/5q/aU52Qyu43tMWmRDfVsL+oFm7KICjqKlquoTKPQ
 BE9nxsbflczg5lgx/EIMF0dmzhHca+h3QA1uOhVGW3xSMH3rMBdEbA1oqoPcdIPExB0K
 vEQdtUHs/WvbLPFWIy2avu8lxBdjAxj8uwrY7+g87KgfGqBTZtzatjErrf8Mlf0TNnkz
 Rpew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QR+O42bqNg0Yscv1dun6J9ERQXwjYGgCeQmUCAEpies=;
 b=pBUtyw2AW8OiL2XEwk/RaFelUSXgRG/BL7ucWap2WpjQ7ANoNH2U68PDB1LOhknjG/
 PU7SQmj1je3O+glA4vGBzskeRUOkjvbxJpuFXK+WGxPtovsVqfzfebZE0FU4+fE6Pivl
 L8RIXBvWmExtBZHkWi8y5EgpOVwk8Sse57fuY5wJVF0MzkvxeW4lixwMtgK5G6PYmLV7
 SdhXD0sQQC5CjFzV6Ueycrk1whheoeuTZJFopoONdPvkVY7METK0zbIxwfiZhjVlvccS
 q5mIn9k2e/Z4cRaRQ7MosvgD+EeCfd86LiGEsLHTq9mVeUDA6MCERwahYdcwMOw8fqDz
 CBHA==
X-Gm-Message-State: AOAM531Bc4cnJSwWFl+3oFevik0tOi2CnWdf9zrENKIBhoxs6HHzqMZN
 3onVGGnldYN016mHr2pNAPt08q8bweOj0Nkc+c8=
X-Google-Smtp-Source: ABdhPJwI/SA++F48VjN0Xn2EtIYnAA8rXQSLiIRo/0PvZb9KvHk5XVpFaZ98hAlhECv4tNmWkeDIticn/uSxX64xr84=
X-Received: by 2002:a9d:4b18:: with SMTP id q24mr2389763otf.265.1601493754237; 
 Wed, 30 Sep 2020 12:22:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200929205731.207393-1-dwaipayanray1@gmail.com>
 <alpine.DEB.2.21.2009302102420.8279@felia>
In-Reply-To: <alpine.DEB.2.21.2009302102420.8279@felia>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Thu, 1 Oct 2020 00:52:11 +0530
Message-ID: <CABJPP5A9hGU=zmQShThBqdj1d4gMWeg2Qza=fgwqk8spQE04Fg@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH RFC] checkpatch: fix
	multistatement macro checks
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Thu, Oct 1, 2020 at 12:40 AM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
>
> Dwaipayan, did you checkpatch.pl your patch before sending it out?
>

Oh right! I goofed up! Sorry about that.

> On Wed, 30 Sep 2020, Dwaipayan Ray wrote:
>
> > Checkpatch generates incorrect error message for certain
> > macros.
> >
> > When checkpatch was run on commit 4649079b9de1
> > "tracing: Make ftrace packed events have align of 1"), it
>
> brace ( is missing, checkpatch should warn you.
>

Again, I may have been too hasty in sending out the patch :(

> > generated multiple errors of the form:
> >
> Present tense is fine. checkpatch runs on ...,
> it generates ...
>
> > ERROR: Macros with multiple statements should be enclosed in a do -
> > while loop
> > +#define __field_packed(type, container, item)    type item;
> >
> > This should certainly not be enclosed in a do - while loop.
> > The problem was with the trailing semicolon. Any statement
> > with trailing semicolon was marked as a multi-line macro.
> > This was fixed by having a seperate rule for excluding
> > single statements terminated by semicolon.
> >
> > The second problem is due to while (...) {...} macros not being
> > handled.
> > For example, on commit fe557319aa06 ("maccess: rename probe_kernel_
> > {read,write} to copy_{from,to}_kernel_nofault"), checkpatch
> > generated following error:
> >
> > ERROR: Macros with multiple statements should be enclosed in a do -
> > while loop
> > +#define copy_to_kernel_nofault_loop(dst, src, len, type, err_label) \
> >       while (len >= sizeof(type)) {
> >         ....
> >
> > This was fixed by having a seperate rule to match such while blocks.
> >
>
> s/seperate/separate/
>
> If you address two different problems, make two patches not one.
>
> Kernel developers can handle many patches...
>
> Create two patches in a patch series, checkpatch.pl them, send them out
> here; then we will do a quick review and out they go to Joe and lkml.
>

Sure, I will do that.

> Lukas
>
> > Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
> > ---
> >  scripts/checkpatch.pl | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > index 9e65d21456f1..4fb612200c27 100755
> > --- a/scripts/checkpatch.pl
> > +++ b/scripts/checkpatch.pl
> > @@ -5342,10 +5342,12 @@ sub process {
> >                           $dstat !~ /^\.$Ident\s*=/ &&                                # .foo =
> >                           $dstat !~ /^(?:\#\s*$Ident|\#\s*$Constant)\s*$/ &&          # stringification #foo
> >                           $dstat !~ /^do\s*$Constant\s*while\s*$Constant;?$/ &&       # do {...} while (...); // do {...} while (...)
> > +                             $dstat !~ /^while\s*$Constant\s*$Constant$/ &&                  # while (...) {...}
>
> tab and spacing might be different than lines around it?

Weirdly, the other lines had 4 spaces instead of one
of the tabs.  Will correct that.

>
> >                           $dstat !~ /^for\s*$Constant$/ &&                            # for (...)
> >                           $dstat !~ /^for\s*$Constant\s+(?:$Ident|-?$Constant)$/ &&   # for (...) bar()
> >                           $dstat !~ /^do\s*{/ &&                                      # do {...
> >                           $dstat !~ /^\(\{/ &&                                                # ({...
> > +                             $dstat !~ /;$/ &&                                               # statement;
> >                           $ctx !~ /^.\s*#\s*define\s+TRACE_(?:SYSTEM|INCLUDE_FILE|INCLUDE_PATH)\b/)
> >                       {
> >                               if ($dstat =~ /^\s*if\b/) {
> > --
> > 2.27.0
> >
> >
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
