Return-Path: <SRS0=MBlu=BX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26202C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 13 Aug 2020 04:44:44 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDE5D206A4
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 13 Aug 2020 04:44:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mxcASnIB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BDE5D206A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6DB0686935;
	Thu, 13 Aug 2020 04:44:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oJwOX1E5todV; Thu, 13 Aug 2020 04:44:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9C0F386934;
	Thu, 13 Aug 2020 04:44:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 82B84C07FF;
	Thu, 13 Aug 2020 04:44:42 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0E235C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 13 Aug 2020 04:44:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id BDCCF204AB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 13 Aug 2020 04:44:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RlUc-3WWdpXw
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 13 Aug 2020 04:44:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 by silver.osuosl.org (Postfix) with ESMTPS id 534AA2045B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 13 Aug 2020 04:44:40 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id df16so3168450edb.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 12 Aug 2020 21:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=6qr1b+cnr9zflKGb3kO37miKN7yYFQJiP9RPv40rsPw=;
 b=mxcASnIB5YGqSHbWFYGMVibDPENVFL0rKhoiGYA0JYu5oDbJxiQxFD42M1EERC4Spq
 iIOFkc6eQ5uUd8dKjIodPNcDuwWJ9IGNH2pf0YeX5mi1yRaaGjix7AHhdd6D9MFppUIy
 d30KcnTPoFRtOWN5unm6fObXLHLuR871vUGshViuDq+o9BezOC7O1iHG4pUjySA9twEF
 At0UYEYOAoIB8SmYt/DmefsS0uOWuel1uCs6IE79oMpVYMGdFS2dINgIZyYLk7800Df8
 2ERk51ZU1vP0MWhP4P/6FvM38hDQMwnM7fP0lopEMtB+r7czHJs8oNk19DhdPQqrvaji
 g3AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=6qr1b+cnr9zflKGb3kO37miKN7yYFQJiP9RPv40rsPw=;
 b=Zu+3mUTfoZqDrP37Va4iO9i92Py9x5pBLP7fPfNYpHA/e8eBujy96y1QghMZSkaqiI
 L1vOKM6tZK3E+eDmeJGZ6S7+v+yxat89SHlkgbQOJcEk/Aoe37YHT+vwIE0RrMszIHQ4
 nfbQGiX3DYSx6KZFBQwgZB4uv3eNBT2IxN5sy1vh7Finm6OIkZgxFVvhtbpbY07ZKvIc
 RaBnLpx0V4YmUpjw4/6zJCM/12G8lqyIoIBMPEMH5L0OTsX7/Agv/Z+TaltT4Wg/+ych
 8+TSBOTbTujBt2QGty5tW5a6oKP44ngjIlI0Cy1slpVgo5cIAagQUKGMY+Rfsv38GJ3l
 MitQ==
X-Gm-Message-State: AOAM531y0sYY1YCFwLiesDZI263BqULOhW6tqVV6YuHKmjTimP7wPzs+
 2fiBTI4vzqld7glPS6BrjUk=
X-Google-Smtp-Source: ABdhPJyJxdWGhnN6uB88Xda6e7Jbom0XhGTl7eqQnn3QNMJUJr7eoc0RsdEoyWfFeVPWg3ArI9qhZg==
X-Received: by 2002:a50:935a:: with SMTP id n26mr3042546eda.107.1597293878496; 
 Wed, 12 Aug 2020 21:44:38 -0700 (PDT)
Received: from felia ([2001:16b8:2dab:1900:b8e6:a865:cc51:e88c])
 by smtp.gmail.com with ESMTPSA id js19sm3009088ejb.76.2020.08.12.21.44.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2020 21:44:37 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Thu, 13 Aug 2020 06:44:30 +0200 (CEST)
X-X-Sender: lukas@felia
To: ishan srivastava <ishan.srt@gmail.com>
In-Reply-To: <0fd328a1-63d0-42ce-8963-0bafad4c9675@Spark>
Message-ID: <alpine.DEB.2.21.2008130641260.3561@felia>
References: <20200803181312.GA28716@Ishans-MacBook-Pro.local>
 <CAKXUXMz166AREJEQLBcvvj4nx4CpTKG=LDe=Ubdzpp1+8cxANA@mail.gmail.com>
 <0fd328a1-63d0-42ce-8963-0bafad4c9675@Spark>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-609103937-1597293877=:3561"
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] Application for Linux CommunityBridge
	Mentorship Programme
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
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-609103937-1597293877=:3561
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT


On Thu, 13 Aug 2020, ishan srivastava wrote:

> Hello Lukas, thanks for the reply. I have been trying to come up with a solution to the bug https://bugzilla.kernel.org/show_bug.cgi?id=207085 and I have to say that I haven’t been able to come up with one that is neat and clean.
>

Okay, let us start easy here.

1. Please always CC: linux-kernel-mentees@lists.linuxfoundation.org.
2. Your email client is broken; you will not be able to communicate with 
the kernel community with a broken email client. Please follow the 
recommendation:
https://www.kernel.org/doc/html/latest/process/email-clients.html#email-clients. 
 
> The problem described in the bug refers to false positive warnings that are encountered for missing blank lines after declarations inside a struct.
> While I found no rule regarding this on https://www.kernel.org/doc/html/v4.10/process/coding-style.html#codingstyle, I presumed that this is a problem and went ahead to devise a solution.
>

3. What is the latest kernel version? From which year is the documentation 
you looked at and referred to? Please always look at the latest version 
(at least the latest tag in torvalds' tree) of the documentation and 
refer to that.

> The code in checkpatch.pl lines 3484-3523 ensures that there is a blank line in between declarations. To ensure that these checks are skipped when the line being checked by checkpatch.pl is inside a struct, we need to maintain a
> counter as to the depth of nested structs the current line in and skip the checks whenever inside even a single struct (keeping aside further complications like do different struct declarations still need line break between them)
>

4. Why are line numbers alone meaningless in an email? Think about the 
needed information that the reader can actually know what part of code you 
are referring to? (Hint: There is only one version of the kernel sources 
and it has not changed a single bit in the last 15 years, right?)
What conveys the complete state of a git source code repository in a short 
and unambiguous way?

Now to the technical discussion:

> If I have conveyed my concerns correctly then we can see that we will introduce a level of complication to checkpatch.pl as to which kind of paradigms the current line is in, which is currently not supported.
> 
> I can go ahead and submit a patch and also show that to you if you wish so but I am not sure whether it would be accepted by the maintainers as from what I have inferred, this level of complication hasn’t been introduced in
> checkpatch.pl.
>

Has this issue of a false positive from checkpatch.pl appeared on 
multiple commits in the last 10 years? How about finding out how often 
this rule would have emitted a true positive and a false positive on the 
commits of the last 10 years?

> I believe some other linters or static analysis tools can perform this with a few lines of code in their config file.
>

That is certainly an alternative; do you a specific tool in mind and can 
you share the configuration to obtain the cases you consider true positive 
findings?
 
> Please let me know what you think about this and what should be my next steps regarding this. I also find this interesting since even though not mentioned anywhere I see this coding style being followed in most places and might just be
> one of the false positives that we are looking forward to fix through this project. I would also like to know if you have any framework/methodology in mind to approaching these problem (as this is a problem that needs to be addressed
> by this project) or should we directly introduce this complexity to checkpatch.pl?
>

Please address the points 1. to 4. correctly first; if you cannot get that 
solved, set up and you cannot follow the process, there is no chance for a 
kernel-related mentorship.

Once you solved that, think about how to send an email correctly now and 
compare it to first email. Send this improved email addressing the points 
1 to 4. above. Then we can continue the technical discussion.

Lukas
--8323329-609103937-1597293877=:3561
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--8323329-609103937-1597293877=:3561--
