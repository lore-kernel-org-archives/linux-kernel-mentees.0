Return-Path: <SRS0=DgfW=CU=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5D5AC43461
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 11 Sep 2020 10:34:06 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72D842076C
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 11 Sep 2020 10:34:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P8lbviCw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 72D842076C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0036487667;
	Fri, 11 Sep 2020 10:34:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id enXVwtavtbBM; Fri, 11 Sep 2020 10:34:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 71E8087637;
	Fri, 11 Sep 2020 10:34:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 578B9C0052;
	Fri, 11 Sep 2020 10:34:05 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DF30AC0051
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 11 Sep 2020 10:34:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id B614E2E204
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 11 Sep 2020 10:34:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BEiX-gYp3Qf2
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 11 Sep 2020 10:34:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
 [209.85.218.65])
 by silver.osuosl.org (Postfix) with ESMTPS id 1E1EF2E1ED
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 11 Sep 2020 10:34:03 +0000 (UTC)
Received: by mail-ej1-f65.google.com with SMTP id nw23so13137518ejb.4
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 11 Sep 2020 03:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=x+gKgwqpz8FyUb8rq8BAvAWD2+F0oKpLQAqc/wAbJig=;
 b=P8lbviCwpgGpEmshyTlFRAtozzp2b1Iz3SvGwjPpeeHM+VvzRiNlrESQLff/uYc9bd
 6b+6LR2xwUdGnqXYa3lSXtDcN9Gd8LFrtoMpnu9p1+DT0rUjFhYeFQoWdI+dEI9AeZ1g
 0c1UTLOqEUWsXoJnEIyTD1o09oGjXda5yyBQ+0AoEp6OqU2lp7dzjSMtUa3a2hdleQqc
 Dl7nnvGcX8uFB3ikNCreoNbalWjRxHDx4i8Qfr3LYTxaPGgIoUAfP0rXCCj2Ucl2Cew1
 olUAn1dOuy3HICQlWI5fVHvX+6yJIVA1tloyuZUGLmKNQjUJlhWvSSVy8Y4MI0/ZyAPM
 PJjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=x+gKgwqpz8FyUb8rq8BAvAWD2+F0oKpLQAqc/wAbJig=;
 b=GEV0dko/NyoNi2RMq4qQFDCVfiPRm0cymJFdH99JyxZuQkPYZZmYLiLWJVgKy1rBS7
 d51ll/J11cg/PM3Xlz7KxhSRBhW5TU0FYKGVYCcc84XEr/p71nfFZflun9BI2lyQv1fr
 9Oezz2re4flWaBZeUqHBKmFKbqTtTtUUQSzF1vhZPUfMLF8PpyH6r9+JwqYXPTLy4v2D
 g6TUkIfs1GwBq7GvW6jFy6fPqcs1Rr6H65hrXbkxyNglWSrEnFlG8PZ7EXRRbXtT+2JJ
 HzSMQG3GrIx9/6+jRzo5IWuQAKzuhNhs3BQyp4S/kZL0eCU2G/FfKkQxwkPynPNwXHhF
 yX8A==
X-Gm-Message-State: AOAM531NiHjag0fnUDTZ2Wef6IIMm2ZjyUteBGRaIIAOEPlbSgwE23BA
 8+txGb67kIEFEAaDEY7l7ig=
X-Google-Smtp-Source: ABdhPJxe854OlwKYSGNG/9HzzXcVjbFoTc3O4ppSSPjcbhtHCzF2jUrvIIuTib1EYhtkFwe0VV4OaQ==
X-Received: by 2002:a17:906:c55:: with SMTP id
 t21mr1464895ejf.276.1599820441230; 
 Fri, 11 Sep 2020 03:34:01 -0700 (PDT)
Received: from felia ([2001:16b8:2dfa:1900:b0c3:335:87f7:d616])
 by smtp.gmail.com with ESMTPSA id o14sm1317029edj.77.2020.09.11.03.34.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Sep 2020 03:34:00 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Fri, 11 Sep 2020 12:33:59 +0200 (CEST)
X-X-Sender: lukas@felia
To: Mrinal Pandey <mrinalmni@gmail.com>
In-Reply-To: <20200911101631.4lylpsbaog5g5jdj@mrinalpandey>
Message-ID: <alpine.DEB.2.21.2009111224270.16254@felia>
References: <20200804155640.x3kzgqfsmmkj5z2b@mrinalpandey>
 <alpine.DEB.2.21.2008042131530.4346@felia>
 <20200809072240.lvuuwscinkfqpwxo@mrinalpandey>
 <20200820044241.4ivtq5co6cm4aze6@mrinalpandey>
 <alpine.DEB.2.21.2008221014310.12792@felia>
 <20200824082325.4prwz56p2ppgfojl@mrinalpandey>
 <alpine.DEB.2.21.2008241052310.2932@felia>
 <20200825045358.hygtrkm6qxyiwjft@mrinalpandey>
 <20200906042724.p6gbirsugnvslmh7@mrinalpandey>
 <CAKXUXMyh1eVusXc+2DAN9H9WfyXHkTuCuhaiG8dfM54Km+rW4A@mail.gmail.com>
 <20200911101631.4lylpsbaog5g5jdj@mrinalpandey>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: Linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: Improve SPDX license
 identifier check for script files
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



On Fri, 11 Sep 2020, Mrinal Pandey wrote:

> On 20/09/07 09:10AM, Lukas Bulwahn wrote:
> > > I was wondering how should I go about the original patch? Should I keep
> > > both the checks or just the executable one and let be the patch as it is
> > > as further cleanup can lead to better performance as we have already
> > > seen with the evaluations.
> > >
> > 
> > Kees Cook and Andrew Morton pointed out that a tool may not rely on
> > the executable flag. So, checkpatch.pl may not rely on the executable
> > flag; the patch we created here is misdesigned, now we know that.
> 
> Sir,
> 
> Yes.
> > 
> > > Also, I have completed all the tasks related to this project on Community
> > > Bridge's site. What are the next steps of mentorship? By when can I
> > > expect the results sir/ma'am?
> > >
> > 
> > Mentorship can begin by October 1st. We need to develop a project plan
> > for the mentorship, you are in the lead to write that. We need a
> > project plan for the mentorship to start.
> > 
> Eagerly looking forward to writing the plan. How, when and to whom am I
> required to submit this plan and what should it broadly contain?
>

A rough plan is required for the beginning of the mentorship, if you would 
like to start on October 1st.

Simply send the plan as text email or share it as a plain Google Doc 
document with me.

I should describe buckets of tasks around checkpatch.pl improvements that 
you see that you can work on.

Just as a hint:

You should have the script for evaluating checkpatch.pl.
If you find many false positives, you can try to improve the check.
If you find many same true positives, you can try to implement a "fix 
automation" in checkpatch.pl.

The end goal is to have a setup/config where we have very few false 
positives and very much fix automation.
Then, we can report back the checkpatch.pl findings for the patches sent 
to the mailing list and integrate the reliable fix automation into
tools for maintainers to pick up patches, such as b4, to quickly fix 
patches on the fly when integrating.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
