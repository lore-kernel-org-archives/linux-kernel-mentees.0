Return-Path: <SRS0=/L4e=EF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78CF0C4363A
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 30 Oct 2020 10:49:53 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC8E620728
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 30 Oct 2020 10:49:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ew+XVeAK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC8E620728
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 288852047B;
	Fri, 30 Oct 2020 10:49:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xrYMopbkaPqc; Fri, 30 Oct 2020 10:49:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 8A14720468;
	Fri, 30 Oct 2020 10:49:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 787EEC088B;
	Fri, 30 Oct 2020 10:49:51 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 39D57C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Oct 2020 10:49:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 292FB867E9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Oct 2020 10:49:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NypHTG7iUjQ5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Oct 2020 10:49:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 4C280868EB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Oct 2020 10:49:49 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id c18so2417408wme.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Oct 2020 03:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=t2aycwkgUyp8mU8oG7S2mH2eBJp+XQ5U35jiCQ4KP9E=;
 b=Ew+XVeAKCCHn3gkqkEuP7D7gTC5/Kz4as8CyGAiVtztNPIcsmJMZlKecpFGPyQo3au
 qRWp+URcYBwGxOh8rBYsBs43PJnwbts9Y7A2LZu/HUgjkkLTkw3O0ooQdYuJVdQlokzu
 5bWdwOCLHYl0EUzInU+OiWQ5CtYThCsmIWy3b6iwxGcS6FsDLlSKfKnwnJWGDNosjYle
 FFkhrsgnrB3unYUFLunwZ+f2MUQbsWjQ6jdB7AqG0MWr5oNIN4/MgbGyPhZXDQ2FNoY7
 op7SuehBgox/0g1X3WVUXzUb13uABz2e+4Fg6dM1HUZDL6J+bZRyVfXABpztMbZETtJh
 Z+bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=t2aycwkgUyp8mU8oG7S2mH2eBJp+XQ5U35jiCQ4KP9E=;
 b=m/1I6pAsRuqk68hNysLKdU54zkziBq/mRq8SS+VDDeU+l2PsG0khEIhGIfS5qi+a6r
 XAmTzUWhB7icBtZ0qRNpVKaUGSrvA4dahKF7+Jj0drGoqJ3aF+rMmtqi/ahlbXCS4vJA
 cZDgYAPwuzjgY7ZlU25wlul7oxzUzDNau+2DqSTR2AzOdKiJJ1BjxmD3bMvS12OQ5m0I
 3cLRi+aZHnxMEAOOvvXxdNFeBppezI/zQyqgrfkrA5QTfzSy4Gh0Pl6E1lIHn8A9OVWQ
 B0UvAsvYHNSULflSIDhQSXbLudk3jUY6If+a1ivlCBe0yd+CoIrdgOBC2LizdK9ITZKd
 l42g==
X-Gm-Message-State: AOAM533lVE4YmW6O6e9uSp0awsP+0hMfv8rVbYv3TGVpoLDYlDY8uaib
 0W3l8aOm8lxwhjM/IywISWg=
X-Google-Smtp-Source: ABdhPJxYWegkppBaTgpoSbh9wIgPjT5IzH78R9wbOueGdUy+5Fn2opqgSYfOk0YeOWHXqyW8cEj4YA==
X-Received: by 2002:a1c:dd06:: with SMTP id u6mr2025926wmg.155.1604054987597; 
 Fri, 30 Oct 2020 03:49:47 -0700 (PDT)
Received: from felia ([2001:16b8:2d02:400:25af:1ff4:dc3:177c])
 by smtp.gmail.com with ESMTPSA id g186sm12093919wma.1.2020.10.30.03.49.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2020 03:49:46 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Fri, 30 Oct 2020 11:49:46 +0100 (CET)
X-X-Sender: lukas@felia
To: Aditya <yashsri421@gmail.com>
In-Reply-To: <a3c50073-4af5-9f58-bdb1-831c6e900b57@gmail.com>
Message-ID: <alpine.DEB.2.21.2010301147150.16621@felia>
References: <20201030082335.14256-1-yashsri421@gmail.com>
 <a3c50073-4af5-9f58-bdb1-831c6e900b57@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: add fix option for
	ERROR:GERRIT_CHANGE_ID
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



On Fri, 30 Oct 2020, Aditya wrote:

> On 30/10/20 1:53 pm, Aditya Srivastava wrote:
> > Currently, whenever gerrit change id is present in commit, checkpatch.pl
> > gives an error to remove the change id before submitting the patch.
> > 
> > For eg, running checkpatch on commit adc311a5bbf6 ("iwlwifi: bump FW
> > API to 53 for 22000 series"), causes error:
> > 
> > ERROR:GERRIT_CHANGE_ID: Remove Gerrit Change-Id's before submitting
> > upstream
> > Change-Id: I5725e46394f3f53c3069723fd513cc53c7df383d
> > 
> > But there is no --fix option present for this error message, in case
> > user wants to fix it immediately.
> > 
> > To fix this error, delete the corresponding line from the patchfile when
> > checkpatch.pl is executed with --fix
> > 
> > Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> > ---
> >  scripts/checkpatch.pl | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> > 
> > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > index 7800a090e8fe..5329927fc1c1 100755
> > --- a/scripts/checkpatch.pl
> > +++ b/scripts/checkpatch.pl
> > @@ -2852,8 +2852,11 @@ sub process {
> >  
> >  # Check for Gerrit Change-Ids not in any patch context
> >  		if ($realfile eq '' && !$has_patch_separator && $line =~ /^\s*change-id:/i) {
> > -			ERROR("GERRIT_CHANGE_ID",
> > -			      "Remove Gerrit Change-Id's before submitting upstream\n" . $herecurr);
> > +			if (ERROR("GERRIT_CHANGE_ID",
> > +			          "Remove Gerrit Change-Id's before submitting upstream\n" . $herecurr) &&
> > +			    $fix) {
> > +                                fix_delete_line($fixlinenr, $rawline);
> > +                        }
> >  		}
> >  
> >  # Check if the commit log is in a possible stack dump
> > 
> 
> Sir I have a doubt: Can I start working on another patch and send that
> too before the first one gets accepted?
>

Sure, you can parallelize your work as much as you can.
Review takes some time: we all have other full-time jobs and many other 
tasks.

When you get feedback, though, I suggest to take that feedback immediately 
and consider reworking your patch.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
