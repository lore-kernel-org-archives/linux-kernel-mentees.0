Return-Path: <SRS0=Swos=DS=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16D56C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 11 Oct 2020 18:19:42 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 822482222A
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 11 Oct 2020 18:19:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L2n9SavT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 822482222A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 251C5204F7;
	Sun, 11 Oct 2020 18:19:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1GpoB7qBGhK3; Sun, 11 Oct 2020 18:19:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id C2B902014B;
	Sun, 11 Oct 2020 18:19:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A96BBC0052;
	Sun, 11 Oct 2020 18:19:39 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 532B8C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Oct 2020 18:19:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 3CC80870FA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Oct 2020 18:19:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tZWC6EesTV1C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Oct 2020 18:19:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 by hemlock.osuosl.org (Postfix) with ESMTPS id AD819870EE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Oct 2020 18:19:36 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id k18so15177279wmj.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Oct 2020 11:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=dXRX0XtwQ9PPGU2GC8dL4PVl7XaHr6n0qUdUpLNWQtE=;
 b=L2n9SavTeSI1u7+WpJfuJPrtFr0E2Odq58TjvZmWIoXwRK+SHijI4jvt1mYkd+986c
 QFeUslaaH6GNf/4lDXvmFsx53ap25JhowzUBx/PjLCHbCTrp7a4ZlAfNr9AXVehpu42L
 CHr3BeJUft0QLqjhZIYKX2Ohla51miUq+lxSN8pQOuX+FWGTRXDA5wewU/k5N2ch5+DN
 MOQFO2fh12L6r+C1jCQCA6MFquhlQnCPr+Ju1wOApdSHRd21TnQKodFElPE2/5Y8M3t+
 J0kIjUiClKwjjvv+Byw9KZo2puvzMLMuEl6NFE1qPxEBHdOjPM3Nx4tQFSGbJEdvQzgv
 fSdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=dXRX0XtwQ9PPGU2GC8dL4PVl7XaHr6n0qUdUpLNWQtE=;
 b=iIPyIT5N0RLW0XwogNUAE1Bf194tJfYdRRZ3nWXFqywOt68ZViZivBP+4GlBHk8MMF
 OvCYLU6UTHtGBDjeXIwVd5fYcybVOrXSyM6grO3z5zysTkmUvQoIpipUClyHwUYy4cGc
 q5eggvAYEtlcAn4exrTEK6TwbVivgtq3Vk+3u3ZuDatnljV2X7Rdf9MKd3SJPiaGndpV
 adqr180KUK0iSWjbtJYl0DqMvEsXPIjMUETLViNY8xG9dsj9Lr8QunjcxopOHDTweprA
 YW8NwfT5K+XFsx0AxpiYzbN+jnMjK6ObC0WdS7dyswF1M1pEfp/2OeEbG030riudNn6C
 Sb1A==
X-Gm-Message-State: AOAM533wL/uPNIlcR/RYlKOcYtRSxqlD8N9brZdbHHPHx5LSPPKPEC4N
 f0dUnEtQzWzj1/EsrAM2Esk=
X-Google-Smtp-Source: ABdhPJwsDDWcXmEwkraMWi4M2TiYcqMcXZT89ijfbAt0aYmJ18pD3ZO9mWVINdcgJkg7eaZ4LFnMwA==
X-Received: by 2002:a7b:c307:: with SMTP id k7mr7872241wmj.31.1602440375014;
 Sun, 11 Oct 2020 11:19:35 -0700 (PDT)
Received: from felia ([2001:16b8:2d57:2e00:8422:c9cb:c3f7:9b2b])
 by smtp.gmail.com with ESMTPSA id s11sm17208232wrm.56.2020.10.11.11.19.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Oct 2020 11:19:34 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Sun, 11 Oct 2020 20:19:33 +0200 (CEST)
X-X-Sender: lukas@felia
To: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
In-Reply-To: <28381616-fb42-4efa-7a5a-7127e1a3f794@gmail.com>
Message-ID: <alpine.DEB.2.21.2010112017490.412@felia>
References: <20201011162123.1151215-1-ujjwalkumar0501@gmail.com>
 <alpine.DEB.2.21.2010111946390.5535@felia>
 <28381616-fb42-4efa-7a5a-7127e1a3f794@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [RFC PATCH] checkpatch: add shebang
 check to EXECUTE_PERMISSIONS
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



On Sun, 11 Oct 2020, Ujjwal Kumar wrote:

> On 11/10/20 11:20 pm, Lukas Bulwahn wrote:
> > 
> > 
> > On Sun, 11 Oct 2020, Ujjwal Kumar wrote:
> > 
> >> checkpatch script checks for invalid EXECUTE_PERMISSIONS on source
> >> files. The script leverages filename extensions and its path in
> >> the repository to decide whether to allow execute permissions on
> >> the file or not.
> >>
> >> Based on current check conditions, a perl script file without
> >> '.pl' extension in its filename and not belonging to 'scripts/'
> >> directory is reported as ERROR which is a false-positive.
> >>
> >> The script can correctly handle patches with mode changes and
> >> shebang line if shebang is taken into account. So, along with
> >> the current check conditions, adding the shebang check in the
> >> check conditions can improve the reports of the script.
> >>
> > 
> > I think one of the core design decisions of checkpatch.pl is:
> > 
> > checkpatch.pl can run on a patch, even if the patch does not apply to the 
> > current repository version that is checked out.
> 
> From our past conversation I remember about this particular point.
> 
> > 
> > It solely uses the information in the patch, and does not try to guess how 
> > it could be applied etc.
> 
> I am fetching the 'shebang' from the patch itself (therefore I do not 
> understand how does the proposed change violate that design decision?).
>

Okay, maybe I misread the patch; so, where those the first line come from?
What if that first line is not part of the patch?

> > 
> > This patch violates that core design decisions.
> 
> Can you please point out the exact change that violates the design decisions?
> 
> > 
> > You can propose to Joe Perches and lkml, but do not be surprised if that 
> > is rejected because of this reason above.
> > 
> > I would be interested in the discussion.
> > 
> > Lukas
> > 
> >  
> 
> Thanks
> Ujjwal Kumar
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
