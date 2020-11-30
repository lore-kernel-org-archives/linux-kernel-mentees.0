Return-Path: <SRS0=9pg8=FE=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AB9AC64E7B
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 30 Nov 2020 15:23:46 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4B1F20719
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 30 Nov 2020 15:23:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IPiQmLpU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E4B1F20719
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5FF5085F8D;
	Mon, 30 Nov 2020 15:23:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lakjb7s45i1s; Mon, 30 Nov 2020 15:23:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6492E80EB2;
	Mon, 30 Nov 2020 15:23:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 491C0C0859;
	Mon, 30 Nov 2020 15:23:43 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5F528C0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Nov 2020 15:23:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 5B6AF203B0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Nov 2020 15:23:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qpx2hU95CGsJ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Nov 2020 15:23:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by silver.osuosl.org (Postfix) with ESMTPS id CB5FA2039D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Nov 2020 15:23:41 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id e23so5408235pgk.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Nov 2020 07:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=/rT7ZIlRzSKunUJ2jMK58oVSr9Pw7MngCs1Xs+HeufU=;
 b=IPiQmLpU+unlrlntFMQM8SE0R+12/9PGGmrBpIpXenI5TRULZIqVRzypADw2Jaxd3i
 4ovMWGfha7mJYhxJ7MinL5vu9igbDwXC0LPQUfKT+zCk3sXflS7byfo4P/jkDH4eriSN
 OMIQuGcYo1piddOB2KfndhNx3IVL4rPnn3IvQ2nJOq/vMcIyMFmytYpILZCdGR+X2hBI
 PdOrSQSgyyUNmZ2bQXZry/T9bbeFxOHu0zVyAstZYmNF9DGRhOu49IqFmO/Xwb9T6mgD
 GNwd6L4qkF2PGda+asAKAGum2iDAIMvVINMtm98LVY+HQMlq5nF85W37XUWH0zQvG0+q
 AsXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/rT7ZIlRzSKunUJ2jMK58oVSr9Pw7MngCs1Xs+HeufU=;
 b=McAzFi8fQ6TP3wet+N9V288LVNvgQ/9cfvBGK3FvTCzJgJL+2b40/NebpMgAKxpQHS
 KUGidN95lPbPm0qKDio1B/IyM9R82cf+FdUS45TIgDR6XW4MlgfC7rvLVNjtkZl31mfA
 zCKmkg6oPyfq0BynZSy7yMwhMufz6FX5vsXJxwF+s78PQECY0x/rHQs5pYWzcdRd/BLW
 QFspDdmwFA9MHsTp0Rr8+hE/P7T9nxPiXqRrpXAOZMyPoW95oPnVXNBSG0D6A/qYkoU9
 78m3JJGNfNUIWuNqOKMqVCFuToJiuMkHZjSdlj1eXlXxrFRWF0LWAHIN8SBsoG5M43Xq
 GPlg==
X-Gm-Message-State: AOAM531O9umcjuDYcCgOE9lpbRT9c5VX7Cjbdkxhgfh8J1TLekY7W22I
 M631wEVA7Km1ekqXxl1Zjg==
X-Google-Smtp-Source: ABdhPJwdgjtNeJQ0YkLQYG15ocYorEsCxZ6iPacdbOjuI7Ig3BghIHVL49XgUI0IaHoxi7DhmaVaVw==
X-Received: by 2002:a65:6215:: with SMTP id d21mr18728738pgv.134.1606749821296; 
 Mon, 30 Nov 2020 07:23:41 -0800 (PST)
Received: from PWN (59-125-13-244.HINET-IP.hinet.net. [59.125.13.244])
 by smtp.gmail.com with ESMTPSA id 143sm17146722pfc.119.2020.11.30.07.23.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Nov 2020 07:23:40 -0800 (PST)
Date: Mon, 30 Nov 2020 10:23:29 -0500
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Message-ID: <20201130152329.GA25773@PWN>
References: <CABJPP5CZhURjFi9xE9KpxKSygS2z_8pbnrvhvV0nQGP9+vZ5_g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABJPP5CZhURjFi9xE9KpxKSygS2z_8pbnrvhvV0nQGP9+vZ5_g@mail.gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] Possible new warning for checkpatch
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

On Mon, Nov 30, 2020 at 08:28:23PM +0530, Dwaipayan Ray wrote:
> Hi Lukas,
> I was having a talk with Peilin and a possible new idea came up.
> It's about lines in the commit message that start with a '#'.
>
> Normally if a patch contains lines starting with '#' in the commit
> message, when they are applied they successfully appear in the
> git log. But if a maintainer for some reason decides to rebase and
> reword the commit message for whatever reason, the # lines are gone.

Thanks for bringing this up Dwaipayan!

Yes, for example, if one included some code examples (e.g. `#define ...`)
in the commit message, then the maintainer applied, and reworded the
commit to add their own Signed-off-by:, then all the # lines are gone.

> Peilin had a look at it and he was able to successfully reproduce this
> fault.
>
> Now would it make sense if a warning for such lines starting with '#' in
> the commit message are emitted by checkpatch itself? I have no idea
> what other developers do, so I could be wrong at this point. But I would
> like your opinion.

I admit it is a beginner's mistake, but I myself learned it in a hard
way (i.e. by having a patch mainline'd then seeing these # lines gone),
so personally I hope this becomes a new feature of checkpatch.

Thank you,
Peilin Ye

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
