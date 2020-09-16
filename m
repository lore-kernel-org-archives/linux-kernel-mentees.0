Return-Path: <SRS0=IxsT=CZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EA1DC433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 16 Sep 2020 12:07:09 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C568C22209
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 16 Sep 2020 12:07:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RSQ+XVm5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C568C22209
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 78D2E86E6B;
	Wed, 16 Sep 2020 12:07:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8hHi-e8f1guc; Wed, 16 Sep 2020 12:07:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id D1EA886E45;
	Wed, 16 Sep 2020 12:07:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ABD9AC0864;
	Wed, 16 Sep 2020 12:07:07 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9730AC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Sep 2020 12:07:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 6D97527236
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Sep 2020 12:07:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZpUhiYmdJ0-o
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Sep 2020 12:07:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 by silver.osuosl.org (Postfix) with ESMTPS id E14792083F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Sep 2020 12:07:04 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id a9so2751441wmm.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Sep 2020 05:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=GgpqCFOaQtbkX22/BnoLSpV+0GZ39e+K3NP/lFjUr6M=;
 b=RSQ+XVm5RdsDGVC25YdMcGfQ35pGXklfgf34CMq0rGzjoqlH9qx/ZeLXIBdvs/QpGW
 fki6mJ+XHfYVQlVmAMSPlYkP1LALtSK5uq8BtI4j7SFVzPUcMRu239AzYMQbKicreiWj
 3IVIp+NaKGDvZEFxXsOKuPcwJPg8eYOZTeCNkFyq+uUneL7jDcdvLZTiWHbNiZXVYOiT
 GAMP/ekOCfigF0iN9XgmLglkunTmVnbSC95g56VBB12/jYkwiR8sCUuDssIMrYyDBzTs
 F04kQ+FSKC9XXeFrr6ndjqMAHRRhqEf9SxR7elblSRoNc5jUAk/PCDgx1NzjUOpA2D2b
 qMAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=GgpqCFOaQtbkX22/BnoLSpV+0GZ39e+K3NP/lFjUr6M=;
 b=cOFXBRgTeon+UW3lfQbuH5/zB9jUPmHHtibOKp4YRpianzpmKk9ISNVemuTd2PSfoy
 qo2NUxwKn48rtp9Cses3ZFUNA0d4hEcesvlq6nugnvl/rBg2MIadH9GETkEL3K3E1XmV
 9jHy3xXLmgdkMDTcXJgXJMcoA1jY8oylLQKyRt98101v+L3WVpLCyZ89jUNk9cME360O
 66wNonL1nK6EdC/Dh1EkK2u72qjWWhvkELWiCwpFqEdkxR7plkp+O58Shxly5BKhisWd
 PUkAiqRnU4gpJgh4ZALLMTcKhTltwr0j4Hi1J25EIRGiw6YG5Vfis0lliU3gZGi9kjQ9
 agiQ==
X-Gm-Message-State: AOAM531k+tMcrm250hZLTuEWKPIdTGLnU6I5iXJw4U4gYDcVIDwgh49L
 xxWOa69LVXubohmgy3tTfuc=
X-Google-Smtp-Source: ABdhPJygFA6R72dxuxDxgJPAUSLrcgHXWPQ9aD84fZTPBD9bwZ82SF7cj2qLsyNvyKyD08/JiUKEXg==
X-Received: by 2002:a7b:c141:: with SMTP id z1mr4515288wmi.79.1600258023127;
 Wed, 16 Sep 2020 05:07:03 -0700 (PDT)
Received: from felia ([2001:16b8:2dec:c500:83c:b38c:cca0:d0c2])
 by smtp.gmail.com with ESMTPSA id b188sm7160306wmb.2.2020.09.16.05.07.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2020 05:07:02 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Wed, 16 Sep 2020 14:06:56 +0200 (CEST)
X-X-Sender: lukas@felia
To: Ujjwal Kumar <ujjwalkumar0501@gmail.com>, Ayush <ayush@disroot.org>
In-Reply-To: <e6fa87d7-3b80-390f-4db2-40e977a4b635@gmail.com>
Message-ID: <alpine.DEB.2.21.2009161352170.12662@felia>
References: <6a2bdeea-265b-5cd0-78c2-aa865b0d5bb7@gmail.com>
 <alpine.DEB.2.21.2009121343290.13082@felia>
 <23226f28-dcc4-dba3-dac9-636464d37b03@gmail.com>
 <alpine.DEB.2.21.2009121422520.3770@felia>
 <4fe9f9e4-f016-6c1c-4ac6-7af82212d392@gmail.com>
 <alpine.DEB.2.21.2009131307420.22585@felia>
 <e6fa87d7-3b80-390f-4db2-40e977a4b635@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] RRRe: Evaluate and Improve checkpatch: tasks
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



On Wed, 16 Sep 2020, Ujjwal Kumar wrote:

> On 13/09/20 4:45 pm, Lukas Bulwahn wrote:
> > 
> > 
> > On Sun, 13 Sep 2020, Ujjwal Kumar wrote:
> > 
> >> On 12/09/20 6:02 pm, Lukas Bulwahn wrote:
> >>> On Sat, 12 Sep 2020, Ujjwal Kumar wrote:
> >>>
> >>>> On 12/09/20 5:14 pm, Lukas Bulwahn wrote:
> >>>>>
> >>>>>
> >>>>> On Sat, 12 Sep 2020, Ujjwal Kumar wrote:
> >>>>>
> >>>>>> Hello Lukas,
> >>>>>>
> >>>>>> I attempted the tasks.
> >>>>>>
> >>>>>> Below is the link of GitHub repository containing my write-up and findings.
> >>>>>> https://github.com/Ujjwal0501/lkmp-checkpatch
> >>>>>>
> >>>>>
> >>>>> Thanks, it shows 404. Good luck next time.
> >>>>
> >>>> I'm really sorry for the noise. The link is active now.
> >>>
> >>> Okay, scripts and data looks sound. So, let us try those scripts.
> >>>
> >>> Please have a look at this patch:
> >>>
> >>> https://lore.kernel.org/linux-kernel-mentees/20200912094826.150170-1-ayush@disroot.org/
> >>>
> >>> The author states:
> >>>
> >>> This issue was discovered through a thorough analysis of checkpatch.pl
> >>> errors and warnings of type GIT_COMMIT_ID on commits between v5.7 and
> >>> v5.8.
> >>>
> >>> Before applying this patch, checkpatch.pl reported 342 errors of type
> >>> GIT_COMMIT_ID. After applying patch, errors reduced to 284.
> >>>
> >>>
> >>> If your scripts work, you should be able to confirm the statement.
> >>>
> >>
> >> I'm unable to reproduce the same count as above because the script is run 
> >> on different sets of commits.
> >>
> > 
> > So, you say the evaluation from Ayush was not really a good evaluation of 
> > v5.7..v.5.8 due to some misconception of Ayush how to obtain the set of 
> > proper commits from v5.7..v5.8?
> 
> That is not totally correct as he correctly generated the list of commits in 
> the first task. But the script used to generate the statistics used a 
> different way so I was trying to point that specific thing.
> 
> >>
> >>> The tasks are:
> >>>
> >>> 1. Run your scripts and create a full statistics of all error types with
> >>> their according count for v5.7..v5.8.
> >>>
> >>> 2. Apply the patch with git am.
> >>>
> >>> 3. Run your scripts again and create a new statistics.
> >>>
> >>> 4. Compare before and after
> >>>
> >>> 5. Make all results available on your github repository.
> >>>
> >>
> >> The results are available at the link 
> >> https://github.com/Ujjwal0501/lkmp-checkpatch/blob/master/tasks.md
> >>
> >> Kindly take a look at it.
> >>
> > 
> > Can you share the errors that have changed after the patch was applied?
> > 
> > - Which cases of GIT_COMMIT_ID have disappeared?
> > - Which cases of GIT_COMMIT_ID are new?
> > - Which cases of GIT_COMMIT_ID have changed?
> > - Have cases of other type of errors/warnings/checks/notes disappeared, 
> > been added or changed?
> > 
> > You state GIT_COMMIT_ID changed from 272 to 230, but the tester in
> > 
> > https://lore.kernel.org/linux-kernel-mentees/CABJPP5BFNjBhdcvBWqDYnR-o2sZ0oY77bYr9PxducXW4Y=482Q@mail.gmail.com/
> > 
> > claimed that it changed from 270 to 251.
> > 
> > Which numbers are right? Why is there a difference in both statistics?
> 
> The patch from Ayush appears to have a bug which I have detailed in my write up.
> 
> Kindly take a look at the link.
> https://github.com/Ujjwal0501/lkmp-checkpatch/blob/master/followuptask1.md
>

Ayush, please fix the bug.

Ujjwal, please do not create screenshots. That is wasteful and harmful to 
the environment.

You can share the same information by sharing plain text in nicely 
formated ways.

Ujjwal, I do not understand the diff you presented. We are really not 
acquainted with your stat file, maybe you can explain what you read out of 
that.

Which results are from which exact commit?

Ujjwal, can you judge if the findings that disappeared should have not 
been warned about in the first place?

And the ones that appear new? Should they be really warned about or not?

Are there further patterns in the GIT_COMMIT_ID findings that probably 
should not be warned about and could be improved?


Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
