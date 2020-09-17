Return-Path: <SRS0=D/zP=C2=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B54D5C433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 17 Sep 2020 14:44:13 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 485AF206DB
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 17 Sep 2020 14:44:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="exAHFhiK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 485AF206DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 072E58767D;
	Thu, 17 Sep 2020 14:44:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ojhnHdrB1fOJ; Thu, 17 Sep 2020 14:44:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id C14E98767A;
	Thu, 17 Sep 2020 14:44:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B5650C0864;
	Thu, 17 Sep 2020 14:44:11 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C519BC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Sep 2020 14:44:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id B4492870B0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Sep 2020 14:44:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id om3mCmsSGYqV
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Sep 2020 14:44:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com
 [209.85.167.181])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id B3D44870A3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Sep 2020 14:44:07 +0000 (UTC)
Received: by mail-oi1-f181.google.com with SMTP id x69so2732400oia.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Sep 2020 07:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EA41Z5txzydG1PMhAeZD91Y4d4LUqXjWUx2A0RN03ME=;
 b=exAHFhiKD/n8jMzSK4nDZUJM9SQOILDdsBJCNiCPgfGSRF8Lq03Y9BUdse44h6PLEv
 Z+O6tjylSmBMBiMPwm7IGcgRBaHlPPloFzOPPmQoO2++do2xJx6xdi/h/nxmR0lBXIAb
 6xymlkhjyZphpGxaIArdMSI6hfAGOeG45456LC1m8tqbgtG4tb8SkvxkmbQrNii+JLSJ
 fjQ3+1egN73C0VMUvhpuf2S4OxUBtdoopJJtA6zukWN73Skl3TJ+7zRP8TnVtg0CbjQG
 J+tW8uqXLnj6g49VcKpdswF9dJLswV3J4vQqTqEzefJ+/BoIj8lM+j0KheS51qlIoXbl
 FlCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EA41Z5txzydG1PMhAeZD91Y4d4LUqXjWUx2A0RN03ME=;
 b=r1w2O4ByB4/pOkFeWCqRaNd8fYja/jvkN0vnnRkXw5wBrFAYDiCgyHScZ2T3WCmqs0
 D1K+4tP4vtj9j4DP3o7RCNkdIIQben4aAhPOdLF+2QtY00SNsbLe4Spe1yaIlnOZIZ0G
 yogNDfGJx/pwduiiUZoDMQmTVK7rluG/rx5gaxGKYSXojaBuNRZ+Ev0hMg3MfVxnyWAC
 jdV6YTKJz6c/kRPaz2/UAzXn0QlV3m63kDy2zKfqSsHTlkhhVK2nwUHYIs5SkHDzSEBY
 RaMiYFydmIw6q1UEo767hxqhIJyobHUOaUjarE+fkg7iyKr+iGyeglY4Bz7eU/3KSDZr
 2jZw==
X-Gm-Message-State: AOAM5324t76HLSVUkYezHiubq0pTS5pMGbMPS7VIrPJb4kyg9kBkquzc
 wxk465ZWKHDrmTmvb6/pfjR8Lb+7tyXwct+CXS0=
X-Google-Smtp-Source: ABdhPJzjKoRHONWvcBJSSJgBhqudzMAM2L/ZndwCIOAOVM3Lqt1RlaxBpm6QRrXuZ07dUFY1uCFE2MJzlwwAr1ad1kM=
X-Received: by 2002:aca:5050:: with SMTP id e77mr6527632oib.74.1600353846761; 
 Thu, 17 Sep 2020 07:44:06 -0700 (PDT)
MIME-Version: 1.0
References: <CABJPP5CSa_QowD-O3_E5ndoQJvuBv=n2x5WG-acwQKE=rt5+Rw@mail.gmail.com>
 <alpine.DEB.2.21.2009121419430.3770@felia>
 <CABJPP5BFNjBhdcvBWqDYnR-o2sZ0oY77bYr9PxducXW4Y=482Q@mail.gmail.com>
 <alpine.DEB.2.21.2009131301570.22585@felia>
 <CABJPP5BmRcC+OTSjuX_QrYononVq__DkhjGOgiKrP147MAXK+g@mail.gmail.com>
 <alpine.DEB.2.21.2009132010300.6806@felia>
 <CABJPP5BaUss9pWq=e+UDmVvr-puJsBtSVppST+CTcB8JkEdLmQ@mail.gmail.com>
 <alpine.DEB.2.21.2009140716420.7737@felia>
 <CABJPP5D87ZVTfZ4QHxp5vweTN16LQCy+rniq-uDVCvKkbYRDNg@mail.gmail.com>
 <alpine.DEB.2.21.2009141535010.17999@felia>
 <CABJPP5Aniv2kQ4wfAD9JuR_7Q5pjChasHZTAvBWOOaza4H3VSg@mail.gmail.com>
 <alpine.DEB.2.21.2009142016150.6496@felia>
 <CABJPP5DhzCHz6PM7bLzW9s1=VckN_+qnaUuYO148xSL59Q-pkA@mail.gmail.com>
 <alpine.DEB.2.21.2009160837380.10877@felia>
 <CABJPP5Dtz7VagfY+h2Qcm=XH6W7EQxXv1QReJLU9pnz2Jp_coQ@mail.gmail.com>
 <CABJPP5BBUsSQBDi1QbL7xgVdRUqMG7OWXcNSUKsMN601Y3EYbw@mail.gmail.com>
 <alpine.DEB.2.21.2009171614150.9985@felia>
In-Reply-To: <alpine.DEB.2.21.2009171614150.9985@felia>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Thu, 17 Sep 2020 20:13:49 +0530
Message-ID: <CABJPP5CQc8WMQU2yLbW9OVrd8bdDNFJsKTqjonOsqQHCk5G1TA@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] Linux kernel checkpatch.pl mentorship
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

> Good investigation. Can you please share the commit of the commit message
> you refer to in the future?
>
> I found it, commit cd2614967d8b ("checkpatch: warn if missing author
> Signed-off-by"), but to convince the maintainers and authors that you did
> your homework properly, it is good to refer to the commits you looked at.
>
> The kernel documentation tells you how to refer to commits.
>

Yes sure, I will remember to do that in the future.

For now, I am thinking to fix the split FROM header issue. What I have thought
of is to keep a variable keeping the part data and if the author cannot be
resolved at the present line, then at the next line join the data and parse
the email.
I think the implementation to this will be fairly easy, with one
flag variable to indicate whether the from header has been parsed in the
previous line.

Should i proceed with this?

Thanks,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
