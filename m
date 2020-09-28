Return-Path: <SRS0=/QZw=DF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3F36C2D0A8
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 28 Sep 2020 13:30:52 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0055420774
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 28 Sep 2020 13:30:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LLHiaSkT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0055420774
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 95FF585751;
	Mon, 28 Sep 2020 13:30:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AQkstKzvIZYU; Mon, 28 Sep 2020 13:30:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 19A4985657;
	Mon, 28 Sep 2020 13:30:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0F441C0891;
	Mon, 28 Sep 2020 13:30:51 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CAC3CC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Sep 2020 13:30:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A656F86FE7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Sep 2020 13:30:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CrAPeW-1XJyo
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Sep 2020 13:30:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9F95486FDA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Sep 2020 13:30:48 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id w16so1309953oia.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Sep 2020 06:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=klMX2i82QaXZu3oQ+U87vgRnJWwGcyFWXnT9tRf8xsc=;
 b=LLHiaSkTGvZSVOvITGnRIgTHjwLUmsCS8Y/GAWwiXuLvvpdWQ0ClHoIdXBm8t/OTFC
 5jtUO5+jsNFrpovJmEpf0aETZGwHgdbpgKlZF9EcVEDjolnNIuf0d+sebW0+vmS4ySqO
 E/RUkir6jYHE/IlLww+8inCffdYDFbIeLctY+QHm+0nKRpWlYETpEqSjAkG92IF1Rca1
 bc6QGCEWMxXlKSrjoMzy1cNR+2844wJLaFUk//KnjjjExmYXIc1flWJbKJwiYZG+gZNZ
 CwZ/AXHtAPNK12TJVted+bgNj65RjFElo7ZWk2Z1od+tla52q9YhAeUiK0s7VFejUJ8q
 LB2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=klMX2i82QaXZu3oQ+U87vgRnJWwGcyFWXnT9tRf8xsc=;
 b=TfTzHkyoz8JKbZ/3MKPUcuIm1h8zZKA3H5T2QQXYnFfG4G7QW4wFhp70h0n4OlmpmW
 NUasXimHLLbERibSd6JDEhPhCgRuUUWFft+Ul7JoTlNU7InbVmn20XtQ+TIWzNdoMaHu
 bkKZNhDT8DhhNz/Wp3Sj/L6FkSHAOKMsMAS+hJXbDBUg12PAGTRKPSPj0S/HlGgkUbwI
 0HSh1YBaJNV+KgLTp7p2OPJz4cZOMgiOV0KZEnwHR67elChOft2NTBWS5QX41kynTBnM
 NAhuJU1v+K2/uPsnSJvZZ2AzL6QqzNd+o/YvFeCEeSNWqUyZPHeG5r2DH2P6bpcQ1csn
 TJyQ==
X-Gm-Message-State: AOAM532/IRQozgBLHIrVTpPi0hia4nNsycSvV6DjQKuVCYBvjySs0tjK
 VranH3e7SyN6Je2iSDNMc4uMpVcJhbcmVnzwmPChD1X83wDvVw==
X-Google-Smtp-Source: ABdhPJwRApApHbtcCthUrhRJnAjNb1VqLzhRoKnFp4898hjRhqdXutb3DuhOLIv5JQgkUW8N9NYtVXU5fBIoegrWP1g=
X-Received: by 2002:aca:ea44:: with SMTP id i65mr835042oih.117.1601299847332; 
 Mon, 28 Sep 2020 06:30:47 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.DEB.2.21.2009181157160.14717@felia>
 <CABJPP5DGpep-S5F+J=dxdhBBDp2J9wQBrJvH_Ys6uJDj3AfRRA@mail.gmail.com>
 <alpine.DEB.2.21.2009181238230.14717@felia>
 <CABJPP5A8kaaFqR9Sm-rS6uuWb6CdbnkLLPXWpgp8XeEgC9uOJw@mail.gmail.com>
 <alpine.DEB.2.21.2009211112460.7483@felia>
 <CABJPP5B6D2ttt5D1ROrQNy7BDMcp+CBg6QB3vFRac4H10CkvCw@mail.gmail.com>
 <alpine.DEB.2.21.2009222028250.20644@felia>
 <CABJPP5B9RsGXCCAHxve2hxmCSyPX3C5aO_5MU9QMtNm08cXiNg@mail.gmail.com>
 <alpine.DEB.2.21.2009230925520.6068@felia>
 <CABJPP5CQxXdAD5fFRZaApjh2GJJ_2Dd1Q=6phS-61iLrU5qb9Q@mail.gmail.com>
 <alpine.DEB.2.21.2009230941250.6068@felia>
 <CABJPP5B8GJWPBqeb1RhJknN-4Q0_nQfU9M=Oy+K=Fwe02cgoag@mail.gmail.com>
 <alpine.DEB.2.21.2009250854230.5992@felia>
 <CABJPP5Chc5+tNda3af88=pUC2XN8bEga4FiP=+KBwyx0UWOmyA@mail.gmail.com>
 <alpine.DEB.2.21.2009250930570.5992@felia>
 <CABJPP5B8mfAi3MMS4xWbArJe=FcMBTF9U8qvXmaicGj5WKiGBQ@mail.gmail.com>
In-Reply-To: <CABJPP5B8mfAi3MMS4xWbArJe=FcMBTF9U8qvXmaicGj5WKiGBQ@mail.gmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Mon, 28 Sep 2020 19:00:27 +0530
Message-ID: <CABJPP5A46fh=Eth7RwXYHarcS11kyHMCUMrRfvvJ3_8oafAkJA@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] checkpatch.pl investigation:
	NO_AUTHOR_SIGN_OFF issues
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

Hi,
I am continuing this thread, but am writing about another issue
separate from author sign off. While checking checkpatch
output, I was checking the commits with the warnings:

WARNING:UNNECESSARY_ELSE: else is not generally
 useful after a break or return

Looking into the referenced section, I found some
sections with a redundant else.

For example: (revision 196273fffc1c),
arch/powerpc/kernel/security.c , line 360:

static int ssb_prctl_get(struct task_struct *task)
{
if (stf_enabled_flush_types == STF_BARRIER_NONE)
/*
* We don't have an explicit signal from firmware that we're
* vulnerable or not, we only have certain CPU revisions that
* are known to be vulnerable.
*
* We assume that if we're on another CPU, where the barrier is
* NONE, then we are not vulnerable.
*/
return PR_SPEC_NOT_AFFECTED;
else
/*
* If we do have a barrier type then we are vulnerable. The
* barrier is not a global or per-process mitigation, so the
* only value we can report here is PR_SPEC_ENABLE, which
* appears as "vulnerable" in /proc.
*/
return PR_SPEC_ENABLE;

return -EINVAL;
}

The else is pretty much redundant and the control flow
never reaches to return -EINVAL.

Is it possible to clean up all these redundant code?

Thanks,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
