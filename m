Return-Path: <SRS0=DUpp=CW=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95900C43461
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 13 Sep 2020 11:15:50 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12E9620665
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 13 Sep 2020 11:15:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BABzC+yp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 12E9620665
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CB23586078;
	Sun, 13 Sep 2020 11:15:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ynHr49ts77UF; Sun, 13 Sep 2020 11:15:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 482FF8605E;
	Sun, 13 Sep 2020 11:15:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1FF9CC0859;
	Sun, 13 Sep 2020 11:15:49 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 28C46C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Sep 2020 11:15:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 122AD86977
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Sep 2020 11:15:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FvrYY0dN2qub
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Sep 2020 11:15:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
 [209.85.218.66])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 2DC34868F1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Sep 2020 11:15:47 +0000 (UTC)
Received: by mail-ej1-f66.google.com with SMTP id i26so19277223ejb.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Sep 2020 04:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=npMu4OSA7M+mqJu0ooZp206DZ27c/P6e5reuLjeQnf0=;
 b=BABzC+ypKtxq4KQD/eLIxc+EjccbuutLkWdocoxPw5GVACxG0ye9q0OmGjAbbwcCh+
 hPIhXxvYPezQQLrVwBaG5l+wI4vQhyhYrs+KlLGlxnjwFkLiqd58sRlz1PNHrKvRYOuR
 uduvIqOktfA51tJR8AipxyvfJQl9CFZGzUtUgNmYvAFXj0wrz65WcUIoLVRSI51I/kLq
 MhkcH6n4fbt3zvaA4vt0Q1kimEJ1yptaBz1bEGe+9asbDU8VWppxN7AcsDcFTf3CxgLl
 yrCLbPnqtMypBU5LCMYohFcMhTcJZJS5p9Nrb3bH5VyWcAj4bNEY9HPhcV/1Wg06flCT
 a/cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=npMu4OSA7M+mqJu0ooZp206DZ27c/P6e5reuLjeQnf0=;
 b=dbSf/rUTsBftgFXf1B5fN7/94yB06S7AuH+q/LOHtxzrtoopjpY4tepx0dIrtprMUN
 y+KWPtXb3XOo/1cSmc+uZljGhCZvjxLhbVqi/6s2zKhY7iONJ7vpkVbtFQJNip9oKIYR
 LiRHSggJrJGFhOLRrCyxmm3dg4jv/ydf8zyi7PoYsFhztMUIua2bTHmjOYxhgb6jWRDp
 SJCFDTSt6PuDMG5GiBuz6pCxsT59U8fIPK+P8Dk+MdGZlJcH04SE+sQ/awga6S2c6Wgs
 eXqxr4EQmFOdkfjgUL4BfwJyvKJmT2oam1XbThH3GNFkuVEwgRQExV9R7SBydDCCFxUW
 RXWQ==
X-Gm-Message-State: AOAM5318GzoDPCHImT7ZwlCuExvLKI2xEr6HALJZZ0Dqg1y+pu5+LHVg
 uaA3KIjbkQR2dIWI4U2Xnw7sN5U12ogL2w==
X-Google-Smtp-Source: ABdhPJxnOfd9NU5Whm/5/8639wAWNY5dZOx6FY8YkzfyZY5LIPstby3EKnOoTDNQTdGQvq0EU0IBkw==
X-Received: by 2002:a17:906:4a81:: with SMTP id
 x1mr5637897eju.541.1599995745623; 
 Sun, 13 Sep 2020 04:15:45 -0700 (PDT)
Received: from felia ([2001:16b8:2d3b:f900:79af:10ed:f757:91c8])
 by smtp.gmail.com with ESMTPSA id g25sm6694537edu.53.2020.09.13.04.15.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Sep 2020 04:15:45 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Sun, 13 Sep 2020 13:15:44 +0200 (CEST)
X-X-Sender: lukas@felia
To: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
In-Reply-To: <4fe9f9e4-f016-6c1c-4ac6-7af82212d392@gmail.com>
Message-ID: <alpine.DEB.2.21.2009131307420.22585@felia>
References: <6a2bdeea-265b-5cd0-78c2-aa865b0d5bb7@gmail.com>
 <alpine.DEB.2.21.2009121343290.13082@felia>
 <23226f28-dcc4-dba3-dac9-636464d37b03@gmail.com>
 <alpine.DEB.2.21.2009121422520.3770@felia>
 <4fe9f9e4-f016-6c1c-4ac6-7af82212d392@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] Evaluate and Improve checkpatch: tasks
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



On Sun, 13 Sep 2020, Ujjwal Kumar wrote:

> On 12/09/20 6:02 pm, Lukas Bulwahn wrote:
> > On Sat, 12 Sep 2020, Ujjwal Kumar wrote:
> > 
> >> On 12/09/20 5:14 pm, Lukas Bulwahn wrote:
> >>>
> >>>
> >>> On Sat, 12 Sep 2020, Ujjwal Kumar wrote:
> >>>
> >>>> Hello Lukas,
> >>>>
> >>>> I attempted the tasks.
> >>>>
> >>>> Below is the link of GitHub repository containing my write-up and findings.
> >>>> https://github.com/Ujjwal0501/lkmp-checkpatch
> >>>>
> >>>
> >>> Thanks, it shows 404. Good luck next time.
> >>
> >> I'm really sorry for the noise. The link is active now.
> > 
> > Okay, scripts and data looks sound. So, let us try those scripts.
> > 
> > Please have a look at this patch:
> > 
> > https://lore.kernel.org/linux-kernel-mentees/20200912094826.150170-1-ayush@disroot.org/
> > 
> > The author states:
> > 
> > This issue was discovered through a thorough analysis of checkpatch.pl
> > errors and warnings of type GIT_COMMIT_ID on commits between v5.7 and
> > v5.8.
> > 
> > Before applying this patch, checkpatch.pl reported 342 errors of type
> > GIT_COMMIT_ID. After applying patch, errors reduced to 284.
> > 
> > 
> > If your scripts work, you should be able to confirm the statement.
> > 
> 
> I'm unable to reproduce the same count as above because the script is run 
> on different sets of commits.
>

So, you say the evaluation from Ayush was not really a good evaluation of 
v5.7..v.5.8 due to some misconception of Ayush how to obtain the set of 
proper commits from v5.7..v5.8?

> 
> > The tasks are:
> > 
> > 1. Run your scripts and create a full statistics of all error types with
> > their according count for v5.7..v5.8.
> > 
> > 2. Apply the patch with git am.
> > 
> > 3. Run your scripts again and create a new statistics.
> > 
> > 4. Compare before and after
> > 
> > 5. Make all results available on your github repository.
> > 
> 
> The results are available at the link 
> https://github.com/Ujjwal0501/lkmp-checkpatch/blob/master/tasks.md
> 
> Kindly take a look at it.
>

Can you share the errors that have changed after the patch was applied?

- Which cases of GIT_COMMIT_ID have disappeared?
- Which cases of GIT_COMMIT_ID are new?
- Which cases of GIT_COMMIT_ID have changed?
- Have cases of other type of errors/warnings/checks/notes disappeared, 
been added or changed?

You state GIT_COMMIT_ID changed from 272 to 230, but the tester in

https://lore.kernel.org/linux-kernel-mentees/CABJPP5BFNjBhdcvBWqDYnR-o2sZ0oY77bYr9PxducXW4Y=482Q@mail.gmail.com/

claimed that it changed from 270 to 251.

Which numbers are right? Why is there a difference in both statistics?


Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
