Return-Path: <SRS0=tUVd=BG=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18ED0C433EB
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 20:34:52 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF302207BB
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 20:34:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TFIlcTtp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF302207BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B1273877EC;
	Mon, 27 Jul 2020 20:34:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OsuTct8WIGYV; Mon, 27 Jul 2020 20:34:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0D4DB877E3;
	Mon, 27 Jul 2020 20:34:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F131AC004F;
	Mon, 27 Jul 2020 20:34:50 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4F421C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 20:34:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 3E5A585815
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 20:34:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gAeC-SNpX453
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 20:34:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
 [209.85.218.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 640A98545F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 20:34:49 +0000 (UTC)
Received: by mail-ej1-f68.google.com with SMTP id l4so18344326ejd.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 13:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=YkkYId0qfscEeVLanlp+9fO+1FJwDeA+iuhChUKUNzw=;
 b=TFIlcTtpMEaEdu6Obq566fed0LcNw+s440FAiZQNexu+CUbPGjDfb6nfXkHqleRqLN
 tFOWBKFUPOfYQfMhOzBu1gwFG3/lFKYYHAtzejaA3o80NVCQQBpWunZMbprtdV95VAQA
 7oKbk07ix9uEjSfcBHu33BiBYrp3JewmWGPWZFc9dIxvibmjsf6sfVqun4jW2E0wdQRJ
 6N/qH4NmO8N0JLZ/mlcOFUe3MiIrJ42nBaluJFCeseAgOhsthgqyN6YGACf7IyPgTRYe
 vIln5m6LNeabOu9Cqhn4yO+CltTQS9EN1HRs5zy5Iu+rdho1AvMPfbPTMtwTQg1AHDG5
 necQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=YkkYId0qfscEeVLanlp+9fO+1FJwDeA+iuhChUKUNzw=;
 b=mlrtJ1Q79eisd7O1cXp3gEtRSgmgJVa6qloj+jdo+rqEP+fwskIcySmRSLdm4InHTj
 WMv6A6Fyt6uco6O0Hyf38vg6KquBR7HHPWuZnkq7SP2MaMV29xqcYAFIhXjg5AyoHVJc
 h5iokvlYqNwRn3guP8g4yZhyEOH1li4BrFbyMDq8+HJ9D82e12K0Lts5p51OlyMU5Atn
 L+ZzgHP4pTAY9KuAagAlDECpyyPbDdqj/UY2kPhLjzzcyaHXEN5T5wf0tJzapdpU0KOz
 e0kIcEplKrjP8bVa5pBs0vnOOKKjWqNRXhkS07E8Ia05rT7d3WoVAWDFQ3E0PRqtob5c
 aSXA==
X-Gm-Message-State: AOAM531gN3IQMcejw4xhDm6cGbdLOAZ1kk0Gw4MU2hMO/lJ5sIzbOgQY
 V96dr/ZXdDaqsbgdvAjCvV0=
X-Google-Smtp-Source: ABdhPJylqd2aCo4OdWacO1NzkdhKrkGlngvsgTCA2pPxab/QetyviXICeIv/c4d1XODXuH8f7xOATw==
X-Received: by 2002:a17:906:60d0:: with SMTP id
 f16mr22112045ejk.17.1595882087821; 
 Mon, 27 Jul 2020 13:34:47 -0700 (PDT)
Received: from felia ([2001:16b8:2daf:f700:54de:db5:3d20:437c])
 by smtp.gmail.com with ESMTPSA id q6sm7758159ejn.30.2020.07.27.13.34.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 13:34:47 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Mon, 27 Jul 2020 22:34:37 +0200 (CEST)
X-X-Sender: lukas@felia
To: Nachiket Naganure <nachiketun8@gmail.com>
In-Reply-To: <20200727071159.GA595854@endurance>
Message-ID: <alpine.DEB.2.21.2007272229280.15655@felia>
References: <20200727055458.559558-1-nachiketun8@gmail.com>
 <66bbaec73d8f69541535db5390c0f12b304c0467.camel@perches.com>
 <20200727071159.GA595854@endurance>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, apw@canonical.com,
 Joe Perches <joe@perches.com>, linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: disable commit log
 length check warning for signature tag
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



On Mon, 27 Jul 2020, Nachiket Naganure wrote:

> On Sun, Jul 26, 2020 at 11:14:42PM -0700, Joe Perches wrote:
> > On Mon, 2020-07-27 at 11:24 +0530, Nachiket Naganure wrote:
> > > Disable commit log length check in case of signature tag. If the commit
> > > log line has valid signature tags such as "Reported-and-tested-by" with
> > > more than 75 characters, suppress the long length warning.
> > > 
> > > For instance in commit ac854131d984 ("USB: core: Fix misleading driver bug
> > > report"), the corresponding patch contains a "Reported by" tag line which
> > > exceeds 75 chars. And there is no valid way to shorten the length.
> > > 
> > > Signed-off-by: Nachiket Naganure <nachiketun8@gmail.com>
> > > ---
> > >  scripts/checkpatch.pl | 2 ++
> > >  1 file changed, 2 insertions(+)
> > > 
> > > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > > index 197436b20288..46237e9e0550 100755
> > > --- a/scripts/checkpatch.pl
> > > +++ b/scripts/checkpatch.pl
> > > @@ -2806,6 +2806,8 @@ sub process {
> > >  					# filename then :
> > >  		      $line =~ /^\s*(?:Fixes:|Link:)/i ||
> > >  					# A Fixes: or Link: line
> > > +		      $line =~ /$signature_tags/ ||
> > > +					# Check for signature_tags
> > >  		      $commit_log_possible_stack_dump)) {
> > >  			WARN("COMMIT_LOG_LONG_LINE",
> > >  			     "Possible unwrapped commit description (prefer a maximum 75 chars per line)\n" . $herecurr);
> > 
> > OK, but the test should be:
> > 
> > 		      $line =~ /^\s*$signature_tags/ ||
> > 
> > so the line has to start with a signature and
> > it won't match on signature tags in the middle
> > of other content on the same line.
> > 
> > 
> But the suggested won't work in case of merged signatures.
> Such as "Reported-and-tested-by: user@email.com"
> 

But Joe's remark is valid; we do not want to match on signature tags in 
the middle. These cases are probably mentioning signature tags as part of 
a sentence or some explanation.

Nachiket, think about a proper solution for this issue.

The evaluation data from running checkpatch.pl on previous commits will 
provide you some guidance on which heuristics might work and which not.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
