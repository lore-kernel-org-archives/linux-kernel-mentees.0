Return-Path: <SRS0=yCHA=53=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8564C2BA2B
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 11 Apr 2020 14:04:17 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D5632083E
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 11 Apr 2020 14:04:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mslzIaHY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D5632083E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5D35184EEB;
	Sat, 11 Apr 2020 14:04:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BeXL7MdODk3Z; Sat, 11 Apr 2020 14:04:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D0BF784E8C;
	Sat, 11 Apr 2020 14:04:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B93F9C1831;
	Sat, 11 Apr 2020 14:04:16 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9F13AC0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 11 Apr 2020 14:04:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 85CA3207A2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 11 Apr 2020 14:04:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZdylSbjaYMtp
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 11 Apr 2020 14:04:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
 [209.85.166.193])
 by silver.osuosl.org (Postfix) with ESMTPS id B078E2048E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 11 Apr 2020 14:04:14 +0000 (UTC)
Received: by mail-il1-f193.google.com with SMTP id c17so561729ilk.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 11 Apr 2020 07:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cpy8pLxAYe5xiURpD1/xcnNHrrRpCQ6Ib4CvtcJzb1s=;
 b=mslzIaHYM4fbB/otZJZPwtOCFr2togq9OsgRoR64xMCtFzDLuGTuIfkyUwRRb/CGNV
 ZxadlNfudCDdlf910z5DMhstlZ5LywgodVjeSU1hV3O2fX7trRR+9Xq8YFgzBUnDrgqS
 mXrZA7FZcoBGE9dbRvbGFIyFqT7ajxasMKrX7RPDyF4BG3ouHpog7/pDwxTZI/iPjrJN
 Ko9TWnUXIY/Go4UiyNQ1zGddIbBJJ+bEJsyahdb0jwgaBUrc2Bf4azjASFqpiyatZUsg
 5aPGjuChNdTfm83LRZ130PoOzUms1oPpi3d3Hg5WGxE+yPkCav8VGqIms8s7HIFr4K/O
 ABIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cpy8pLxAYe5xiURpD1/xcnNHrrRpCQ6Ib4CvtcJzb1s=;
 b=aIXi8CI0p4Yxix/NwnRJ4g3eZfYD1hKOPrGHu5fHC9mpJz+K7EgWg+Y75P7EkAnHls
 uq2PZedJilU3v94WJF6rg2v1PTzbHJzSAeZfatHDjRjkT40+iV2GoMOMkJl2POIZNz6p
 1DkWr5FYqO4efTA82ZUEUWjUajX/7a+Kd6TUuZ1mWqtdoSVvP51Ypf5lcWUnjtr1WXnj
 TxFigQtzqShVKLulNqqWPBKkMGRLugHjiivP75zSaoEutl66ZeK0/7bJOSG+hr0f8IoJ
 5s04RTGEYILNeQ0JRHhLcEDlA3KL8jdXAMZM6SVO5NiURpZc/Qs9yyreErDlfE3BS3Mb
 XJxA==
X-Gm-Message-State: AGi0PuZHz9+puEiUVO+b0iV41QNyEdpy2NOr2nRNDAXTy3mcqX9tJi8a
 Unic14EAf1D0JFMQo2XxpQ1DHnjo1p2RGV34anM=
X-Google-Smtp-Source: APiQypKc0pMYxQC80ITi62kAKPEnBjW0VjB6yW6opPjSfplE9V1mOMBAqoUMkb3Wr2/JtnZDJCLBOEebaldPEA3FerE=
X-Received: by 2002:a92:3b83:: with SMTP id n3mr10139071ilh.100.1586613854030; 
 Sat, 11 Apr 2020 07:04:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200410124418.34640-1-vaibhavgupta40@gmail.com>
 <20200411001539.GA209636@google.com>
In-Reply-To: <20200411001539.GA209636@google.com>
From: Vaibhav Gupta <vaibhav.varodek@gmail.com>
Date: Sat, 11 Apr 2020 19:33:20 +0530
Message-ID: <CAPBsFfA9dJP7FmwEpuG1e4_f_Nk5zXf+xzmvenOkt7zcPMjdjg@mail.gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v1] ethernet: intel: e1000:
 Convert to dev_pm_ops
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

> 1) Use "git log --oneline
> drivers/net/ethernet/intel/e1000/e1000_main.c" and match the prefix to
> the convention for the file.  The e1000-specific commits all start
> with "e1000: "
Okay, will do that!
>
> 2) The subject should say something about the overall goal and why we
> want this, so "dev_pm_ops" is a little too low-level.  I like "Convert
> to generic power management", e.g.,
>
>   e1000: Convert to generic power management
Okay!
>
> When you eventually post this to netdev, I think you should post
> several patches as a series, e.g., maybe all the Intel drivers
> together.  In this case it's not because they depend on each other,
> but because the patches will be similar and the same set of people
> will review them, so it's convenient for them to look at them all at
> once.
Yes, when I will send it to netdev, will send the patch-set for whole
intel family. This patch is for RFC.

> This should mention "power management" somehow.  I think 77b84bb306fd
> ("xen-platform: Convert to generic power management") is a good
> template (of course, since I wrote it :)).
Sure, I will follow that.
>
> I have other questions, so no need to repost this until we work
> through those a little bit.
>
Okay! Thanks!
--Vaibhav Gupta
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
