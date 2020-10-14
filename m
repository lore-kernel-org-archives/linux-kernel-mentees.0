Return-Path: <SRS0=TCtx=DV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1B8EC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 14 Oct 2020 13:25:40 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CFDC22201
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 14 Oct 2020 13:25:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gm7JdoEU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3CFDC22201
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A804987B76;
	Wed, 14 Oct 2020 13:25:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QhOltjpmqH2r; Wed, 14 Oct 2020 13:25:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4323087B98;
	Wed, 14 Oct 2020 13:25:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2851CC07FF;
	Wed, 14 Oct 2020 13:25:39 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6F53EC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 13:25:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 52BD02E26D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 13:25:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hHzob4Sc9gia
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 13:25:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
 [209.85.167.68])
 by silver.osuosl.org (Postfix) with ESMTPS id 141B52E0F5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 13:25:37 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id 184so3674331lfd.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 06:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mKFq6iwfvEkroibpmULLRLiQ1H931GZCc/Lu/Ysbxus=;
 b=gm7JdoEUZtN9HQCSRKe3cLDHs2mUxvk2g1hCrMvKdnYkdNFEHx8JeZOhujiGzMFi7t
 IScT5UvNf6Iuc2dfCJkq7h6Q9mG2eQbxmmaisk3ldX+OyPouie0QOdt6TG73eZL5NL56
 PBRoaCEchoKvs2H2oXJy32RsRulN0yTFdDkARAtNZY4WeWGnpnilumB5tHXFyrsp7glt
 ytkHlivCwSZbqrvREVvqIRcqDsTIQzKXCN8+ThSbI0QwOdkS9RoB8AViOSu1OUreXIW4
 1XeTHOlMsMhVnv4SNnXVvHcnylVtqIu4Rn1SNUJfxjWL201oaxlMhsXRDsbxcwexWvhd
 Uk2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mKFq6iwfvEkroibpmULLRLiQ1H931GZCc/Lu/Ysbxus=;
 b=jNt242uA3t0ZZWNiCmDtli72qxhADyypeiU5jTFjrCylKEZpaOm6ZrqCkLKVQbld2D
 N15C9qhd6xAGoL+0XjEaTcshaDbeqBtTDMKBmV+Sik1GRXQBrz4tN/rIKXdvRnwnjfYa
 VwhxcY0WF6unolpsSqNrKGEQ43PbxRjUTj9I9d776lNzyb1A4aogWkuc7krLJUfNSWLZ
 yw1Vh5yPHclsXWZ+tbJA/C++oJjnBjayygp1R9z/lgJRQ+aKvLYSfIpX3bvvIGu5wcsH
 02epuVgq0UunJKgw8pevzcS/5NKxCIx/+Y3aJOu7b2Jdh0VXFPrYFshHgbZYUQTU8osC
 87cQ==
X-Gm-Message-State: AOAM531N7NQmBZdC9LerEJNrQJgNyTtKRJxPRLW1f56x2OyM4XTWnVCp
 DAZgu/ePQeLVzixAL3mKJSlTejR4PbSgAxo2b30=
X-Google-Smtp-Source: ABdhPJwulrqs2A1OwJl/ciD0ZDmCvYFr1xNNHp0xX0kyXd17jU0DVKvM+U1lUNcFP/8HGFI3MD3JXtZv7707iMXArNI=
X-Received: by 2002:a19:40ca:: with SMTP id n193mr1250337lfa.96.1602681935224; 
 Wed, 14 Oct 2020 06:25:35 -0700 (PDT)
MIME-Version: 1.0
References: <20201013152648.438887-1-anant.thazhemadam@gmail.com>
 <d75dc535-00be-3aa7-addb-c2615b202b56@redhat.com>
In-Reply-To: <d75dc535-00be-3aa7-addb-c2615b202b56@redhat.com>
From: Fox Chen <foxhlchen@gmail.com>
Date: Wed, 14 Oct 2020 21:25:24 +0800
Message-ID: <CAC2o3DJ1qBO+dhFVgGk_u5X2K0_G-pxQVjT32z=dsPL=4jr1_w@mail.gmail.com>
To: Andrew Price <anprice@redhat.com>
Cc: Anant Thazhemadam <anant.thazhemadam@gmail.com>, agruenba@redhat.com,
 linux-kernel@vger.kernel.org,
 syzbot+a5e2482a693e6b1e444b@syzkaller.appspotmail.com,
 cluster-devel@redhat.com, rpeterso@redhat.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [Cluster-devel] [PATCH] fs: gfs2:
	prevent OOB access in gfs2_read_sb()
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

Hi Andrew,

On Wed, Oct 14, 2020 at 9:04 PM Andrew Price <anprice@redhat.com> wrote:
> Just a heads-up to avoid duplication of effort: Fox Chen (CCed) has
> attempted to fix this also[1], but I don't know if they plan to send
> another patch.

Oh, I thought it was solved by someone else as you've pointed out the
correct solution the other day. https://lkml.org/lkml/2020/10/5/538

I'm solving another bug right now, I will leave this to Anant. :)


thanks,
fox
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
