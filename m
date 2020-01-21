Return-Path: <SRS0=cM1+=3K=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0065BC33CAA
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Jan 2020 11:06:42 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AEDCE2253D
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Jan 2020 11:06:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qvEwnunb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AEDCE2253D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 755D6204DB;
	Tue, 21 Jan 2020 11:06:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8FLwIvBGY4W1; Tue, 21 Jan 2020 11:06:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 710BC1FEBF;
	Tue, 21 Jan 2020 11:06:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6579EC0176;
	Tue, 21 Jan 2020 11:06:37 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0065DC0174
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jan 2020 11:06:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E2DB8816DB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jan 2020 11:06:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2VuG-HlParmz
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jan 2020 11:06:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by hemlock.osuosl.org (Postfix) with ESMTPS id AE78782063
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jan 2020 11:06:25 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id n59so1345346pjb.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jan 2020 03:06:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=KUB30XAdc7IB4BdtXCNF01sVDM5GdqhhWV+6JnRgMBU=;
 b=qvEwnunb6AUWhBr+TmnbWYze9AWZurHoCMwubXWrfPQzM2blp+R+rfagOlfzpgNZk/
 bh0uof8JDlVOT1lq6H2FV99WvX2gHku7c3EQwsYUFIAtRlerTWSeoZalo1EzDiPZtLXq
 POqj5YU14cLdISVLQ+ghLaKnJQu67bTff/Bsu2wBKU6XWyWnEJ1nFBx24ZmiGArnBAb4
 6fdz7Yq6n35h6VuN4rNX/0VZygEFW4JpXIdPFZaHSSFoXnUuTJHGv03z+alqbcVrdUmH
 9phCQRI8IelDIeSDegrAFayZax8ng5901IFCHPYJpz0t/2jfgz7u7NUWhduHThtP5Yfi
 LRjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=KUB30XAdc7IB4BdtXCNF01sVDM5GdqhhWV+6JnRgMBU=;
 b=HoWyssOIe29HAdZWvmsFteoG88KFfF3TPQEUYnmrRfhNQddDwUJOji00qzI1j/KtOD
 ZrTyZ1mzr9IPwIyHr8OzP0FU+v1Cr1Y2Edu4V+J5kOKZiz+FoDfbFGorQpN710pnVPb4
 5w+4oSOJhOhb7xNriDDgO0uBmjac8JAd55EJZzmOFO0QkB29G/z43gXC2St5FiNaBwid
 Fog12ClXArWm/K1azxyNrVam17VjdOz5fiYdIV/fKf7QDNMTiJFGXh1tNfmJb1luAAp1
 cstao9cSOKVO+aDEXxnuBQ9nE408MRJVDoinlGLUXFfBxwGevfYxhgNiUAgZyyoF6Y+C
 6tcw==
X-Gm-Message-State: APjAAAXkJFngKtR4sGmUh1AVRdOGcCeoxxYrRiE42jvJA5tTEWJB/amx
 mUJ1arfa0NfcGTVF+DsskXk=
X-Google-Smtp-Source: APXvYqytP8OJzyACZoo7qO2IiAk7ev5SQNZReA9Gyb+SF9wDfu1vleZjQT4UaqJ6IfW9Xw5ICqKd7A==
X-Received: by 2002:a17:90a:bd82:: with SMTP id
 z2mr4852814pjr.17.1579604785238; 
 Tue, 21 Jan 2020 03:06:25 -0800 (PST)
Received: from localhost.localdomain ([2402:3a80:167e:da7:fcf8:ab67:c0bb:e29])
 by smtp.gmail.com with ESMTPSA id
 189sm43662103pfw.73.2020.01.21.03.06.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2020 03:06:24 -0800 (PST)
Message-ID: <7bb4650f42c2d5b25d5695bf6f9f257bc5407043.camel@gmail.com>
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 21 Jan 2020 16:36:20 +0530
In-Reply-To: <5bb2b304-96d9-c3e0-af31-5e918f1a8e40@web.de>
References: <5bb2b304-96d9-c3e0-af31-5e918f1a8e40@web.de>
User-Agent: Evolution 3.32.5 (3.32.5-1.fc30) 
MIME-Version: 1.0
Cc: Julia Lawall <julia.lawall@inria.fr>,
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 "cocci@systeme.lip6.fr" <cocci@systeme.lip6.fr>
Subject: Re: [Linux-kernel-mentees] [Cocci] [PATCH v2 2/3] parsing_hacks:
 Add bool to list of known typedefs
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

On Tue, 2020-01-21 at 11:10 +0100, Markus Elfring wrote:
> > Before:
> >   passed:bool
> 
> I wonder if subsequent duplicate information can really help to
> achieve a better understanding
> by the suggested description of a software situation.
> 

Hm, I thought it would but you're probably right. Should I just remove 
the second Before/After? The text above it about trace_kprobe.c
explains things anyway.

Cheers,
Jaskaran.

> Regards,
> Markus

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
