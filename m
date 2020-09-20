Return-Path: <SRS0=4nEd=C5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72437C43465
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 20 Sep 2020 08:11:14 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D95DE2075E
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 20 Sep 2020 08:11:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FbNtdsqt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D95DE2075E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 649A1203C3;
	Sun, 20 Sep 2020 08:11:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vy0xUbsU+zF5; Sun, 20 Sep 2020 08:11:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 3715A2034F;
	Sun, 20 Sep 2020 08:11:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1C96FC0859;
	Sun, 20 Sep 2020 08:11:11 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5B1ACC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 20 Sep 2020 08:11:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 47EEC86C4D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 20 Sep 2020 08:11:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LmOxwsmCScKG
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 20 Sep 2020 08:11:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
 [209.85.218.65])
 by whitealder.osuosl.org (Postfix) with ESMTPS id C50D586C35
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 20 Sep 2020 08:11:07 +0000 (UTC)
Received: by mail-ej1-f65.google.com with SMTP id i26so13536626ejb.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 20 Sep 2020 01:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=VOis3/bzPKA6bo6jDS9eNNBndcJd1sigS7Hee24mCFw=;
 b=FbNtdsqtoceJV6JyMIbUkHSO6zA17HbYljWdOzEnsYstb24hOoUeM5lcfknwB9/+6f
 t0u34qzuGFYj+KR1ehTWJgpVqHIIZLipsDgeKkc+c5KMVAOpjMXaj7338PBHPJiInB25
 LRCsBp6rlG+etVI+0Brp11n/LhUdOnSHxVTEqRyLE2xuQ1SMpli7tySBQWDl1EVPAQMY
 xz2fDWdjmy43s9MovXUICs4iij1cNS+ISWANvvR0CrPDA7OCjY0WW0MOJeIz0tlubiEd
 RhfsID7lcwWg5PbcSKNhjjo1TMGsRJ3SWFAVLqve5usaWA/eUcGkqRc+BNqbORdp5N5k
 0UsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=VOis3/bzPKA6bo6jDS9eNNBndcJd1sigS7Hee24mCFw=;
 b=IUkPc4w6XOyIJPbnCWOFtMaW2tbVrN5gZT1lEho0B/TowNNU8gOxGwgCBeu4DJKNmL
 cTkTFNBSOJzISWe6Ly+KXrHTcfWbOIebMU6TQtUUsjsz4laUDsPfVHG5WhkfxuGDq1Ze
 3mEC6ksds1j9kzsFOHNjEwboG9TUusW/oHFd+A6mesKRFTIR12mxk8JfQusPtLMeUcTS
 sub7SeK6yZJYMJZj4XoXIjF2mqbalaZHKVKUAdpSlDT570PK70mOAtnmh5zdO9BuapG3
 lpAjIBWWMke/NIHfizaCPm/RV+Oo3az4izirsHnwP32KjOZdODdnEWerJje8VKo06QZW
 9yfQ==
X-Gm-Message-State: AOAM5316arGsWoKssO+mC8imtGrCWGgVBr7CAwBK07L1NExt1bu/N3Xn
 PJFFPVa018Ph2ETKwyUoaFw=
X-Google-Smtp-Source: ABdhPJxr4RjaFvhSBVa9OsRsk8gBc4MSjrjfUDe0rZlKgltGcaIJFBeIzUh/qQ+O19WGpEWvNkcu/w==
X-Received: by 2002:a17:906:a947:: with SMTP id
 hh7mr42527158ejb.126.1600589466258; 
 Sun, 20 Sep 2020 01:11:06 -0700 (PDT)
Received: from felia ([2001:16b8:2da4:9100:d08c:280d:91ba:79ee])
 by smtp.gmail.com with ESMTPSA id r13sm6048429edo.48.2020.09.20.01.11.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Sep 2020 01:11:05 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Sun, 20 Sep 2020 10:11:04 +0200 (CEST)
X-X-Sender: lukas@felia
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
In-Reply-To: <CABJPP5Abo1qzO+G=SEzhCLGwoiH+hgicDMy3gMmSwKBvOQcn8A@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2009201002100.12902@felia>
References: <20200919204721.100531-1-dwaipayanray1@gmail.com>
 <CABJPP5Abo1qzO+G=SEzhCLGwoiH+hgicDMy3gMmSwKBvOQcn8A@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2] checkpatch: extend author
 Signed-off-by check for split From: header
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



On Sun, 20 Sep 2020, Dwaipayan Ray wrote:

> On Sun, Sep 20, 2020 at 2:18 AM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
> >
> > Checkpatch did not handle cases where the author From: header
> > was split into multiple lines. The author identity could not
> > be resolved and checkpatch generated a false NO_AUTHOR_SIGN_OFF
> > warning.
> >
> > Support split From: headers in AUTHOR_SIGN_OFF check by correctly
> > parsing the entire From: header in such cases.
> >
> > Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
> > ---
> >  scripts/checkpatch.pl | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > index 504d2e431c60..8ee61ec346b3 100755
> > --- a/scripts/checkpatch.pl
> > +++ b/scripts/checkpatch.pl
> > @@ -2661,6 +2661,10 @@ sub process {
> >  # Check the patch for a From:
> >                 if (decode("MIME-Header", $line) =~ /^From:\s*(.*)/) {
> >                         $author = $1;
> > +                       my $curline = $linenr-1;
> > +                       while(defined($rawlines[++$curline]) && ($rawlines[$curline] =~ /^\s+(.*)/)) {
> > +                               $author.= $1;
> > +                       }
> >                         $author = encode("utf8", $author) if ($line =~ /=\?utf-8\?/i);
> >                         $author =~ s/"//g;
> >                         $author = reformat_email($author);
> > --
> > 2.27.0
> >
> 
> Hi,
> Based on Joe's suggestions I updated the patch. It's totally similar
> except for the fact that Joe missed a closing parenthesis and
> he removed the decode("MIME-Header") part which caused parsing
> of utf-8 to fail.
> 
> example: (commit e33bcbab16d1)
> WARNING: Missing Signed-off-by: line by nominal patch author
> '"=?UTF-8?q?Vesa=20J=C3=A4=C3=A4skel=C3=A4inen?="
> <vesa.jaaskelainen@vaisala.com>
> 
> So I fixed these.
> 
> Also, Joe stated that all split lines must start with a space. But I
> looked it up and it states that it must be a WSP, that is either a
> single space or a horizontal tab.
> References:
> WSP: (https://www.rfc-editor.org/std/std68.txt)
> Long headers: https://tools.ietf.org/html/rfc2822#section-2.2.3
> 
> So, i went with the ^\s+ expression instead of ^ s*. Is it alright
> or should be changed?
> 
> I do have a final question though, since he had already solved it,
> is it okay to send this patch in again?
>

Yes, please provide your design decisions in the commit message.

You can add a 'Suggested-by:' tag to name that Joe pointed out the idea.

Also, you can add a 'Link:' to the previous email from Joe with a proper 
lore.kernel.org hyperlink.

Just send out your PATCH v2, then we can all review and test it.

When we have this patch accepted, we can discuss with Joe some way to 
handle the further cases of false warnings in AUTHOR_SIGN_OFF.


Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
