Return-Path: <SRS0=DonT=C4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB8DFC43463
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 19 Sep 2020 05:58:14 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3406B20DD4
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 19 Sep 2020 05:58:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="clfTdzBy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3406B20DD4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id BDC1487509;
	Sat, 19 Sep 2020 05:58:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vqauw3HGWi47; Sat, 19 Sep 2020 05:58:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1A42D874F2;
	Sat, 19 Sep 2020 05:58:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0360FC1AD4;
	Sat, 19 Sep 2020 05:58:13 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 33A29C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Sep 2020 05:58:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id ACB3E20464
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Sep 2020 05:58:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7iEn3Gh9J+Y9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Sep 2020 05:58:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by silver.osuosl.org (Postfix) with ESMTPS id 967A120446
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Sep 2020 05:58:10 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id 95so190738ota.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Sep 2020 22:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/6Y6tGQhodbgO7k2ZVfvfTXR5mG7VTqaCFtwAROQbGc=;
 b=clfTdzByhr3q/41z4nU5LB2ngWkendmB06L0h25FbzaldIP7Up3YsPrdKuEgdEpBs3
 NhUtC62wKHcXdixNW/SIB3RFsCl8cTyj9QVp0CZsESaQwepAnY+Mdhgl7QigGVZclLia
 122eZ10Za9FLlHCP8Zm68vYrW9r9Sh0YdDhsfJlJr0HJMocC0hsH3Tfou+DuwXBjCZrF
 ikjYeJ6Rd3P6VLti8brRhJUmVzrCNNymoZZnsPB/AgF2cxEPwDShrv5DL1pYS0OXnVup
 11/du4JdN2fqPa77Kav+nVwDzduMjp5BhWfDmGlv6XpZnikfmb/5CdX8ljwvzwTeQgNH
 AeXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/6Y6tGQhodbgO7k2ZVfvfTXR5mG7VTqaCFtwAROQbGc=;
 b=LkvbT//lfu++5pvQchl8SMROTvWNpygJIUnKsd+YwU9uvxbAahdTnyC4x5nY6I91yo
 8Ysn6i8tojtu5cNSlEP0MZEsN/fQd2uitDegG281eTbT1Dz8c4VPQg7FiUYxHdGkxYsE
 2uPkZWtcQJcLzPZ4gS4NfT/74ycwfEi0FF0mef7ka0yimYBi5ArLqT8+OvmRjcxZ2Na4
 ToDWi6Z2RxvlgOtrtQASNLJoGQO3Us+jrx3tkNdYcOB53U0o/pX4aXrmQEG9wfV1HWAS
 3tPxTBLl/xnFmIpGAO5r8X7xsYvpzEEtqegoY/9i8DaZyZ35d9MaHAzbskzq2BNvD5Kl
 RthA==
X-Gm-Message-State: AOAM5307eyQvomogAENyxHnwD7svq9pqzRSdPNCfoO8ExC0yLnhAU0mw
 POoyzNLDeRia3GJXFGAZsXWHB483TGNG1Q2BYn8=
X-Google-Smtp-Source: ABdhPJxzT3NNLCPXdnIz/iCJfe7+jmDrRjmTN0weatU9egGqJ5SGrAmKLZjos5K6zWWo/1NjvG/inTxmYj0uvSI0Zsw=
X-Received: by 2002:a9d:8f2:: with SMTP id 105mr21621959otf.215.1600495089597; 
 Fri, 18 Sep 2020 22:58:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200918122950.94098-1-dwaipayanray1@gmail.com>
 <alpine.DEB.2.21.2009181439160.14717@felia>
In-Reply-To: <alpine.DEB.2.21.2009181439160.14717@felia>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Sat, 19 Sep 2020 11:27:51 +0530
Message-ID: <CABJPP5D2h95X7WWzP0Nq+e2QcuPbrpp-noFmR9ZJvUw3GszVZA@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: fix author
 Signed-off-by warning for split From: header
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

> > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > index 504d2e431c60..8c4119ca7d17 100755
> > --- a/scripts/checkpatch.pl
> > +++ b/scripts/checkpatch.pl
> > @@ -2347,6 +2347,7 @@ sub process {
> >       my $signoff = 0;
> >       my $author = '';
> >       my $authorsignoff = 0;
> > +     my $prevheader = 0;
> >       my $is_patch = 0;
> >       my $is_binding_patch = -1;
> >       my $in_header_lines = $file ? 0 : 1;
> > @@ -2658,12 +2659,22 @@ sub process {
> >                       }
> >               }
> >
> > +# Check the patch for a split From:
> > +             if ($author eq '' && decode("MIME-Header", $prevheader) =~ /^From:\s*(.*)/) {
>
> How about extending to check if $prevheader is not 0?
>
> > +                     $author = $1.$line;
> > +                     $author = encode("utf8", $author) if ($prevheader =~ /=\?utf-8\?/i);
> > +                     $author =~ s/"//g;
> > +                     $author = reformat_email($author);
> > +                     $prevheader = '';
> > +             }
> > +
> >  # Check the patch for a From:
> >               if (decode("MIME-Header", $line) =~ /^From:\s*(.*)/) {
> >                       $author = $1;
> >                       $author = encode("utf8", $author) if ($line =~ /=\?utf-8\?/i);
> >                       $author =~ s/"//g;
> >                       $author = reformat_email($author);
> > +                     $prevheader = $line;
> >               }
> >
>
> So here we see two almost identical parts of code now, right?
>
> Either use a small function or restructure the code such that the
> differences are in two branches and the common code is part of one common
> control flow. You are a good programmer, you can figure this out.
>

Hi,
I have changed the structure around a bit.

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 504d2e431c60..86975baead22 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -1210,6 +1210,16 @@ sub reformat_email {
    return format_email($email_name, $email_address);
 }

+sub format_author_email {
+   my ($email, $from) = @_;
+
+   $email = encode("utf8", $email) if ($from =~ /=\?utf-8\?/i);
+   $email =~ s/"//g;
+   $email = reformat_email($email);
+
+   return $email;
+}
+
 sub same_email_addresses {
    my ($email1, $email2) = @_;

@@ -2347,6 +2357,7 @@ sub process {
    my $signoff = 0;
    my $author = '';
    my $authorsignoff = 0;
+   my $prevheader = '';
    my $is_patch = 0;
    my $is_binding_patch = -1;
    my $in_header_lines = $file ? 0 : 1;
@@ -2658,12 +2669,21 @@ sub process {
            }
        }

+# Check the patch for a split From:
+       if($prevheader ne '') {
+           if ($author eq '' && decode("MIME-Header", $prevheader) =~
/^From:\s*(.*)/) {
+               my $email = $1.$line;
+               $author = format_author_email($email, $prevheader);
+           }
+           $prevheader = '';
+       }
+
 # Check the patch for a From:
        if (decode("MIME-Header", $line) =~ /^From:\s*(.*)/) {
-           $author = $1;
-           $author = encode("utf8", $author) if ($line =~ /=\?utf-8\?/i);
-           $author =~ s/"//g;
-           $author = reformat_email($author);
+           $author = format_author_email($1, $line);
+           if($author eq '') {
+               $prevheader = $line;
+           }
        }

 # Check the patch for a signoff:

Is it good to go? I shall mail it in then.

Thanks,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
