Return-Path: <SRS0=KrtX=C6=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8450C43464
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 21 Sep 2020 08:32:07 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53A4C20773
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 21 Sep 2020 08:32:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oSVs8Nh5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53A4C20773
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id ECC2386503;
	Mon, 21 Sep 2020 08:32:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FzvYmXr0BO7J; Mon, 21 Sep 2020 08:32:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1BF9C86566;
	Mon, 21 Sep 2020 08:32:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 092C6C0859;
	Mon, 21 Sep 2020 08:32:05 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 04EECC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 21 Sep 2020 08:32:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 776AD870E0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 21 Sep 2020 08:32:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0BUh4-4C2Zed
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 21 Sep 2020 08:32:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9B0EA870DD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 21 Sep 2020 08:32:01 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id c13so16060552oiy.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 21 Sep 2020 01:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1L23WxraydIewy7QcSbacwm2P7ka8MVKI+aBaOXEGZI=;
 b=oSVs8Nh5yQid5/qmttpylrTUy1Ah87gx3o0oxd7LeJUeUff3U45mRnut4hPTVhlfT+
 3rcSdd/jotiv0PO1R2mZ3Z0fuJdzUU91oTUCCl6GQ4dt/3Mr1SAd/UNvUG53Js1tkixN
 7EkG/fW6lz/dnn1HjABRGKtxQH22Mi8AMl2crCG9PSpn4V8Ln4uUfJh01RkAL0Z7Pbnm
 PSbRnFLzGU2a4NuJmuqqj9r1MqiWgHZYGuw+EoDrKL4jX1ugydJMMHVJzEEAv5c4StEO
 sc0QdeoVhpjN4aI5A4hsn8eW+/2766bkXirdWyMnZfAOffc4mXRRl/Hs6Il5TrmkUcB0
 7oaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1L23WxraydIewy7QcSbacwm2P7ka8MVKI+aBaOXEGZI=;
 b=ndSsWhU+vdkXJcU5/Mz/P0b2Qgrgy5SajS4UWVrgIlB0ZiaOx8EdJUg4Aa3LeOuKeU
 0BzhvIJkhPOkXumHjUovW1Ta2/qIg6jL/HUDq9HGC38QFqB+wNHPgrriHGsvxXnY/O6B
 mEjr/FhMH+333p0FLimeAWEimm1FVoH0uNCbG/lw6w+rJ+qwFecnz42o2PVbc+AK16jH
 Jeg9wch9SUAgTGZKHtSuUVH4OlSQObdTjroOCzH4ixQz6b05ph1ladi42tdYJd3uMqDj
 qnTm6c4eTxpBDuG33Pff7TVjynDbORhIlfZ6Ofmupl+166rPcixHzao1VIbxTe0qBrFy
 Awuw==
X-Gm-Message-State: AOAM531zVP5O92s9KueZEXyuQH+NX3hUFE6RDmYnPyTgVTv4H+XX6ZRi
 3xV+SIIRqCf8oURO28uJF3tZpNJrv4ZWGIC5598=
X-Google-Smtp-Source: ABdhPJy7VmwK5B+Tj7OcaE2Li+SvVUYV24q3hotYfmb3X5/RIbHoiEifdRFAO9UyOhsEg6G3Saxk0Sq2A7t2u/QYeOk=
X-Received: by 2002:aca:b2d7:: with SMTP id
 b206mr17149640oif.110.1600677120500; 
 Mon, 21 Sep 2020 01:32:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200920091706.56276-1-dwaipayanray1@gmail.com>
 <alpine.DEB.2.21.2009210940060.7483@felia>
In-Reply-To: <alpine.DEB.2.21.2009210940060.7483@felia>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Mon, 21 Sep 2020 14:01:41 +0530
Message-ID: <CABJPP5Coi2b3xHcmf+dGTmFpsQ1QjNKixA1Yz-n42Mzjc4YngQ@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Joe Perches <joe@perches.com>, apw@canonical.com,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
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

On Mon, Sep 21, 2020 at 1:19 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
>
> Dwaipayan, just a quick nitpick:
>
> Your subject line has two spaces in front of 'From:'
>
> On Sun, 20 Sep 2020, Dwaipayan Ray wrote:
>
> > Checkpatch did not handle cases where the author From: header
> > was split into multiple lines. The author identity could not
> > be resolved and checkpatch generated a false NO_AUTHOR_SIGN_OFF
> > warning.
> >
> > A typical example is Commit e33bcbab16d1 ("tee: add support for
>
> You can write 'Commit' lowercase as 'commit'.
>
> > session's client UUID generation"). When checkpatch was run on
> > this commit, it displayed:
> >
> > "WARNING:NO_AUTHOR_SIGN_OFF: Missing Signed-off-by: line by nominal
> > patch author ''"
> >
> > This was due to split header lines not being handled properly and
> > the author himself wrote in Commit cd2614967d8b ("checkpatch: warn
> > if missing author Signed-off-by"):
> >
>
> Same here.
>
> > "Split From: headers are not fully handled: only the first part
> > is compared."
> >
> > Support split From: headers by correctly parsing the header
> > extension lines. RFC 2822, Section-2.2.3 stated that each extended
> > line must start with a WSP character (a space or htab). The solution
> > was therefore to concatenate the lines which start with a WSP to
> > get the correct long header.
> >
> > Suggested-by: Joe Perches <joe@perches.com>
> > Link: https://lore.kernel.org/linux-kernel-mentees/f5d8124e54a50480b0a9fa638787bc29b6e09854.camel@perches.com/
> > Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
>
>
>
> On v5.4..v5.7 using data from a previous evaluation, I found 116 commits
> with
> the error message "Missing Signed-off-by: line by nominal patch author
> ''",
> when running ./scripts/checkpatch.pl on v5.9-rc6.
>
>
> After this patch application, all 116 warnings disappeared with "Missing
> Signed-off-by: line by nominal patch author ''"
> and these three new warnings appeared:
>
> 322f6a3182d42df18059a89c53b09d33919f755e:35: WARNING: Missing Signed-off-by: line by nominal patch author 'Johnson CH Chen <JohnsonCH.Chen@moxa.com>'
> 18977008f44c66bdd6d20bb432adf71372589303:37: WARNING: Missing Signed-off-by: line by nominal patch author '"Marek Szyprowski via Linux.Kernel.Org" <m.szyprowski=samsung.com@linux.kernel.org>'
> ed3520427f57327f581de0cc28c1c30df08f0103:51: WARNING: Missing Signed-off-by: line by nominal patch author 'Chengguang Xu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>'
>
> With that said, I think am happy to add my tags:
>
> Reviewed-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> Tested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
>
> Dwaipayan, you can fix the minor commit message issues above, add the tags
> from Joe and me to the end of your commit message and send the patch as v3
> out to Andrew Morton with everyone sofar as CC. Andrew Morton will pick up
> the patch and make it travel to Linus Torvalds.
>
> Good job so far!
>
> After you did that, let us develop and discuss a plan to refine the
> 'trickier' part of false AUTHOR_SIGN_OFF warnings for developer and
> maintainers with some known special author and sign-off procedures.
>
> Lukas
>
> > ---
> >  scripts/checkpatch.pl | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > index 504d2e431c60..9e65d21456f1 100755
> > --- a/scripts/checkpatch.pl
> > +++ b/scripts/checkpatch.pl
> > @@ -2661,6 +2661,10 @@ sub process {
> >  # Check the patch for a From:
> >               if (decode("MIME-Header", $line) =~ /^From:\s*(.*)/) {
> >                       $author = $1;
> > +                     my $curline = $linenr;
> > +                     while(defined($rawlines[$curline]) && ($rawlines[$curline++] =~ /^[ \t]\s*(.*)/)) {
> > +                             $author .= $1;
> > +                     }
> >                       $author = encode("utf8", $author) if ($line =~ /=\?utf-8\?/i);
> >                       $author =~ s/"//g;
> >                       $author = reformat_email($author);
> > --
> > 2.27.0
> >
> >

Hi,
Sure! I will do that and get back to you.

Thanks,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
