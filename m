Return-Path: <SRS0=pv6u=B3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAC74C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 17 Aug 2020 09:46:13 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B317206C0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 17 Aug 2020 09:46:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eTRbsO++"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B317206C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 30FAF204B4;
	Mon, 17 Aug 2020 09:46:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H9u14TkIVjSs; Mon, 17 Aug 2020 09:46:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 23B6E20474;
	Mon, 17 Aug 2020 09:46:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 14DBFC07FF;
	Mon, 17 Aug 2020 09:46:11 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 67018C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Aug 2020 09:46:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 5FC3686355
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Aug 2020 09:46:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KRY5pGuhbA0p
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Aug 2020 09:46:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 9925A85F90
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Aug 2020 09:46:08 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id t10so16955823ejs.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Aug 2020 02:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=iBj+FndMyVbHgjcjFZ55eKl5rnf4vSJMTPoH3b5fiOc=;
 b=eTRbsO++5OpyPOEnWsAvazyPYKgyikjXlUmmJSiLb0+x6W6K8i4FaqMLuD/6qUWE04
 EbHV11qL8iCLUeO+0lVgIY0j3GtXL4JTq0PwdWI49lHJgfj6qMlUxwBywMPKhYnLdzom
 q+LRiQDhtRoQBFpCzfJAjQslo+hL3JrfHidVQvcNQrxdfRg4YvkD4miSUxNBPomeLX8r
 8buJtMZdn6YARFI8LBhMcujIxBioK2WaOy+O7pqiNG5d/z9pelubTvJiuG3YVcvaY819
 /pCtEfTII7YTTSll0+FbPNkyz6neT2UfezGwDrQVE3HZL116Z61uTP26P2u8R+IJ2Ka1
 K3Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=iBj+FndMyVbHgjcjFZ55eKl5rnf4vSJMTPoH3b5fiOc=;
 b=FR/EKJrZGtYyNSqVbtzIPnkMpm1BGUJd+bEPiELVMFys1z+GQHhyVxwkUmaOieEbJg
 Eaeg396W/xoAoqaIWF/tM3hyIa2LoYkoG20EiL+V9CnQtg8GqaDMYyWkjpFCpsEzjY3d
 osTHWTyUlmZTt+7OKEA1xKERMkaKi832oMbMuQTc58trlDxwMDV5lOJ9UvrRN86Io6JF
 3m5Wbp4JiRi/Bu9wXWLOl8b8pPymKRrUQPOquABfoyy2ptN4cGeTam1g/566RzlDAmUc
 j7jDBB9NmKtE5T43LvA1hsakP3q10LnTH60n9sQXLJwWVUHIxkKm/h7jtewgi3Iqp4an
 +ZpA==
X-Gm-Message-State: AOAM530UzkUyBYtT8vdgzcpfJprAs/vU3Q+xYUtUud+M/1RoBp1bJcBT
 LJINPUWUQb+vjSS7xXVNbTY=
X-Google-Smtp-Source: ABdhPJwzFllM6hAkX/G4+2aBxg4xC/yt2890UOZwsJb8kYJhq1kU6vU9j+V4gHfXamfZEilH+PmifQ==
X-Received: by 2002:a17:907:11c3:: with SMTP id
 va3mr14730663ejb.497.1597657567054; 
 Mon, 17 Aug 2020 02:46:07 -0700 (PDT)
Received: from felia ([2001:16b8:2d33:f300:9831:2be0:da37:973a])
 by smtp.gmail.com with ESMTPSA id m12sm13339601edv.94.2020.08.17.02.46.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 02:46:06 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Mon, 17 Aug 2020 11:46:05 +0200 (CEST)
X-X-Sender: lukas@felia
To: Shubham Gupta <shubham.gupta2956@gmail.com>
In-Reply-To: <CABeqVEv6eBUt2EB7SUpmv5xO=hzigJ37k3m2jRJSMX-w1m9ybA@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2008171144330.8645@felia>
References: <CABeqVEv6eBUt2EB7SUpmv5xO=hzigJ37k3m2jRJSMX-w1m9ybA@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] Information regarding Linux Kernel:
 Evaluate and Improve checkpatch.pl
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

Dear Shubham,


The zeroth task is to learn suitable netiquette for the communication with 
the kernel community.

First, please do not top-post.

    A: Because we read from top to bottom, left to right.
    Q: Why should I start my reply below the quoted text?

    A: Because it messes up the order in which people normally read text.
    Q: Why is top-posting such a bad thing?

    A: The lost context.
    Q: What makes top-posted replies harder to read than bottom-posted?

    A: Yes.
    Q: Should I trim down the quoted part of an email to which I'm 
replying?

Second, please always CC: linux-kernel-mentees@lists.linuxfoundation.org.

Third, set up your email client according to the kernel community rules.



Then, the first task is to run checkpatch.pl on a few kernel patches and
collect the results. When you have that, please share your script with
me, e.g., in a github repository.


Hints to the first task:

Can you create a list of all non-merge commits that were added in the
version v5.8 of the kernel, i.e., all non-merge commits that are in v5.8
and not already in v5.7?

Can you share the script/command you executed and the resulting list on 
github?

Can you run your script on all commits of this list above and record
all checkpatch.pl reports, and store them in your github repository?

Can you suggest ideas how to aggregate the findings and create a
statistics? For example: Which type of error is reported most?
Can you implement that idea?


I also suggest to have a look at
the options ./scripts/checkpatch.pl --list-types and
./scripts/checkpatch.pl --show-types. The option --show-types changes
the output of checkpatch.pl to list type identifiers, so it is easier
to parse and aggregate the output.

Please also share the script you create for that purpose on your
github repository.



The second task is to pick one warning that appears often and improve
checkpatch.pl to handle that better and get it accepted by the kernel
community.

Hints to the second task follow when the first task is solved.

If you fail on any of those tasks, you are out of the selection process.


Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
