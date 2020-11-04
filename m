Return-Path: <SRS0=I1jd=EK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 753D1C2D0A3
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Nov 2020 06:57:52 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6D802225B
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Nov 2020 06:57:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CvBhdjeq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6D802225B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 69BFA874AF;
	Wed,  4 Nov 2020 06:57:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V9FLkAhxRSSE; Wed,  4 Nov 2020 06:57:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9D5EF8749F;
	Wed,  4 Nov 2020 06:57:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 82FCEC088B;
	Wed,  4 Nov 2020 06:57:50 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2E2C0C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Nov 2020 06:57:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 14FA886B43
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Nov 2020 06:57:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id owdjGJgZ5QDb
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Nov 2020 06:57:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 44CF186B41
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Nov 2020 06:57:47 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id h62so1307148wme.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 03 Nov 2020 22:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=a+yuq1Vwxf3SIwsDA3e1w90Itx/tzlqK8zosVeVncAM=;
 b=CvBhdjeqSXl0SpprFCStf5RiZuJm8PHB5oUPPb1QJP8HoGYw+TvxlGjhTFMXbJNQLO
 Clq9DabSNXbTpPuUdn8Gz4g2p7VMZ0q1FGk+dEhSqbQzqwtYxbdVVg4ObT0V9ELOsFfr
 DFazrz8q7Rt5xjBlhYQvmOWxhg28g7NpnUHS0EeJLWcVdgWD0177ESObUQ3t9kAQyENr
 /1ftxeR6BKQzM/eBFWTLNaeT6glqVWQSnPWVoimUWroUcCHCX4g8yyGNRROAz1KQGHbf
 nkB04IK+Oasa5+LTL+gj9nGqQzsXtU3dKxgNc02goT4cy3XUucWCXhGhWYytPNZsR4qZ
 oe7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=a+yuq1Vwxf3SIwsDA3e1w90Itx/tzlqK8zosVeVncAM=;
 b=dIydGO0IvTQoC4wsmNZjEAitOKxU+BUzuxyh6NP61Vyk141992THLp2R61Vr6b0vEm
 FiFEpaBgANFFFc6hxVMWvp6C0sDtu/VpJuv9tVYayueU7KpHqErViVpdijRS2RPDyWz1
 bva30BAl73caUj/2aVPx4t0xjM+jVjVfTC3nD5wPQscxBTzpUClPG1hd2v+gIFGw8Osk
 hLpf8/oj6OH3LoQgxsICd3hkoZh9Z70ARGoIbInKpAHhZEDWPqGgHOcwFFG6iZxHnigQ
 7RJvkqdupIAk1EJcEGQy9VCJvW12m7CO6hSUy101F1vvPg3zlX2aGmGOPYzUeDiR6Ok3
 OmgA==
X-Gm-Message-State: AOAM530bnFm79N5B1lyUkYyUwpCdv7sIj57RWtXawB+XlXQCnNoRmpUA
 f6qOthJZtWvcEOWc+nBoXKg=
X-Google-Smtp-Source: ABdhPJw3aRtc5hNsswZYGRWE+M4jmt02VXJEi26Do7KHpo0QDyhFmHco65AB7np2YFp/zFCSqWvNAA==
X-Received: by 2002:a1c:98ce:: with SMTP id a197mr2960196wme.116.1604473065418; 
 Tue, 03 Nov 2020 22:57:45 -0800 (PST)
Received: from felia ([2001:16b8:2df3:e100:71c7:3f68:5a91:6565])
 by smtp.gmail.com with ESMTPSA id h128sm1100199wme.38.2020.11.03.22.57.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2020 22:57:44 -0800 (PST)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Wed, 4 Nov 2020 07:57:38 +0100 (CET)
X-X-Sender: lukas@felia
To: Aditya <yashsri421@gmail.com>
In-Reply-To: <7c83fa07-8882-8261-cf35-3bd3347faccb@gmail.com>
Message-ID: <alpine.DEB.2.21.2011040756210.21917@felia>
References: <20201103133052.21053-1-yashsri421@gmail.com>
 <CAKXUXMx9nYkFBy3RYf-LY9VYUeWcf4FuQpT9F3=_p=9baBQikA@mail.gmail.com>
 <9d2a5a04-fd6e-f805-2036-2ab68358fbf4@gmail.com>
 <CAKXUXMyigTJoFAbwp=dE-4QEpOyUkMT=87UMJ3HZub35azb_4g@mail.gmail.com>
 <7c83fa07-8882-8261-cf35-3bd3347faccb@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: add fixes for
	BAD_SIGN_OFF
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



On Tue, 3 Nov 2020, Aditya wrote:

> On 3/11/20 9:04 pm, Lukas Bulwahn wrote:
> > On Tue, Nov 3, 2020 at 3:47 PM Aditya <yashsri421@gmail.com> wrote:
> >>
> >> On 3/11/20 7:09 pm, Lukas Bulwahn wrote:
> >>> On Tue, Nov 3, 2020 at 2:31 PM Aditya Srivastava <yashsri421@gmail.com> wrote:
> >>>>
> >>>> Currently, checkpatch warns if the author signs-off two or more times
> >>>> for the same role.
> >>>> E.g., for commit 6dd47d9754ff ("mac80211: fix
> >>>> ieee80211_txq_setup_flows() failure path") we get warning:
> >>>>
> >>>> WARNING: Duplicate signature
> >>>> Signed-off-by: Johannes Berg <johannes.berg@intel.com>
> >>>>
> >>>> Here there are two Signed-off-by lines present for the same user. So,
> >>>> we get a warning to remove one.
> >>>>
> >>>> Similarly, we get warning if the author of the commit signs-off under
> >>>> co-developed-by.
> >>>> E.g. for commit 6e88559470f5 ("Documentation: Add section about
> >>>> CPU vulnerabilities for Spectre") we get:
> >>>>
> >>>> WARNING: Co-developed-by: should not be used to attribute nominal
> >>>> patch author 'Tim Chen <tim.c.chen@linux.intel.com>'
> >>>> Co-developed-by: Tim Chen <tim.c.chen@linux.intel.com>
> >>>>
> >>>> Provide fixes by removing the duplicate signature line and the
> >>>> co-developed-by line from the commit
> >>>>
> >>>
> >>>
> >>> The duplicate signature fix is simply wrong, because the indication of
> >>> the duplicate signature is imprecise.
> >>>
> >>> Probably, we would first really need to understand the valid cases of
> >>> duplicate signature warnings compared to the invalid ones.
> >>>
> >>> Please rework.
> >>>
> >>>
> >>> Lukas
> >>>
> >>
> >> Oh, Alright. I get it now.
> >> I ran a script over WARNING: Duplicate signature.
> >> I found out that it is occurring with these prefixes and their
> >> frequencies:
> >>
> >> Acked-by -- 6
> >> Signed-off-by -- 218
> >> Tested-by -- 3
> >> Reported-by -- 1
> >> Reviewed-by -- 8
> >> Cc -- 28
> >>
> >> IMO largely Signed-off-by warnings in this frequency might be false
> >> positives. This is so because we are simply checking for duplicate
> >> occurrences in the sign-offs in checkpatch.pl
> >>
> >>> Probably, we would first really need to understand the valid cases
> >>> of duplicate signature warnings compared to the invalid ones.
> >>>
> >>
> >> Is there any way I can know that the second sign-off is intended?
> >>
> >> In my observation, this particular commit was prefixed by '^Link:.*$'
> >> Alternatively, we could use maintainers list to ensure that the signer
> >> is maintainer and avoid this warning.
> >>
> > 
> > That is somehow difficult to say, but probably it is best to
> > deactivate this multiple Signed-off-by: warning on git commits.
> > 
> > On patches it makes sense to warn about duplicate Signed-off-by: ; on
> > commits, not so much.
> > 
> >> How about other prefixes. Can we remove them?
> >>
> > 
> > Can you show the duplicate Tested-by, Acked-by, Reported-by,
> > Reviewed-by, Cc in some structured format to quickly check those?
> > 
> > Probably for those, we can really assess them to be all true positives
> > (maybe we can find out the reasons as well) and hence a fix for them
> > would make sense.
> > 
> 
> I generated git logs of all such commits, which might help us get some
> idea about mailing list or sign offs as well.
> 
> Acked-by:
> https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task5/acked_by.txt
> 
> Reported-by:
> https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task5/reported_by.txt
> 
> Reviewed by:
> https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task5/reviewed_by.txt
> 
> Tested-by:
> https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task5/tested_by.txt
> 
> Cc: https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task5/cc.txt
> 
> 
> >> I observed one of the 'Tested-by' warnings and it was because of these
> >> sign offs:
> >>
> >> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> >> Tested-by:Liang Yang <liang.yang@amlogic.com>
> >> Acked-by: Liang Yang <liang.yang@amlogic.com>
> >> Tested-by:Liang Yang <liang.yang@amlogic.com>
> >> Acked-by: Liang Yang <liang.yang@amlogic.com>
> >> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> >>
> >> Here tested-by is occurring 2 times.
> >>
> > 
> > That example seems to be a clear true positive. It would be
> > interesting to see how that happened to be added twice in a commit.
> > What was the state on the mailing list and what did the maintainer do
> > to add these tags twice (was this done manually or is there some
> > automatic tool involved?).
> > 
> 
> I found the mailing list state corresponding to that day. It indeed
> seems like a true positive.
> 
> Link1:
> https://lore.kernel.org/linux-mtd/CAFBinCB9Z_H4wX3_g2hVL-XnS6Oq-KtPHa4Z1ws79FGp5jCapQ@mail.gmail.com/
> 
> Link2 (reply):
> https://lore.kernel.org/linux-mtd/8ff232c3-f325-5b91-4de1-a39e63939df2@amlogic.com/
>

Yes, and it suggest to fix patchwork :)

How are your python programming skills?

Do you want to try fixing patchwork for this issue?

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
