Return-Path: <SRS0=nXBU=32=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 254BAC2D0B1
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  6 Feb 2020 11:58:32 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9DF720661
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  6 Feb 2020 11:58:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XYt/uJEg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9DF720661
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 96B2785F4D;
	Thu,  6 Feb 2020 11:58:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WqDKyX8so6vF; Thu,  6 Feb 2020 11:58:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1D9B585F3E;
	Thu,  6 Feb 2020 11:58:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 053BDC1D81;
	Thu,  6 Feb 2020 11:58:31 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 55393C013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  6 Feb 2020 11:58:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 49DF52047B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  6 Feb 2020 11:58:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Oe-uIpJ-TQix
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  6 Feb 2020 11:58:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by silver.osuosl.org (Postfix) with ESMTPS id C4C2220372
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  6 Feb 2020 11:58:28 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id g6so2271301plt.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 06 Feb 2020 03:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=vZDWu0hisuBiJ1Oltuw8JrByh92q2F8SlvjmiuEPDJc=;
 b=XYt/uJEgRutP6xckcAck0RRpMfbNSa6CJ/+Y3aFAfrrt8bJxJeacm5Vc/WNTl0HLnT
 q8xI5/Wtp+QOjpQyeQ0psuRwQcX4VsCQ02mZv8gY4bu8qxEjw/X0gnLinsonbZ5HaJno
 6p12noTNXTny+82o7Tx2e50kBnFWrFL6AUhCm9npJgW+XFUr1YDH1NF7PwmUQrqNn/xs
 ol1CWqrUlyPSlvxPt8e8WFy+2gtqmE0wInJu/ngdSTHugDPwsp/gfklXp5mv08Hb9dyq
 VBHHDkenqhFZZ41rV20hxl2Y3LXKKQpLhfF65WW60audPkbQRIixTtmUUGw4k8RisKuW
 2GrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=vZDWu0hisuBiJ1Oltuw8JrByh92q2F8SlvjmiuEPDJc=;
 b=L7o7vWCpz1ENNJUmgqE/p8C40WpiBPczr9afWQuz71VkrvkKKHA8RtQ/RQdryxWu8p
 Msk2ZVZzm8D/E3wavkdwX8evpGks/p1YqW58gt9WYJsxdVqyZiYOyfttYlebLrLxsZqi
 XWOAEPJLMxXWxaTA2tPJK2euge+wBX3TRGnpUAFFi0/3zArpPG9PL8Rvl2Yykj2rdn+K
 XlLFrLDfEyl3v4gMWV9G5cDtS8Wx7EdtuI8Drr7DeLT1NDFyt9VW8Qjfzkf71sHWu05z
 d63k/TL+V/Bz1scqIIgfiSzgwSvqB+TovGOPHfZhujNiYYZYbERQiIPMSRjBgNgM/RH0
 ZKzQ==
X-Gm-Message-State: APjAAAXddoI6IYTcw2TQg9TKSVIpA3B8TWctYoGz/zaTXX0MMcNMBbbs
 xyZQirywcDnDWClDAYocF48=
X-Google-Smtp-Source: APXvYqygfJic+daovqKvub5/+UtE6+ltJrudkFwaQOKHEKliAa3dQ/IylpL7fk9PQcz2oCo7KMkHnQ==
X-Received: by 2002:a17:902:e789:: with SMTP id
 cp9mr3290745plb.85.1580990308274; 
 Thu, 06 Feb 2020 03:58:28 -0800 (PST)
Received: from localhost.localdomain ([2405:204:30e:4a31:b268:7a3:7dc6:f288])
 by smtp.gmail.com with ESMTPSA id
 b65sm3663359pgc.18.2020.02.06.03.58.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2020 03:58:27 -0800 (PST)
Message-ID: <f7da90d8cc0e609a2a81e7a041cc98afedb215b6.camel@gmail.com>
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 06 Feb 2020 17:28:23 +0530
In-Reply-To: <132f414d-397f-fb9a-ff6e-5360df827147@web.de>
References: <132f414d-397f-fb9a-ff6e-5360df827147@web.de>
User-Agent: Evolution 3.32.5 (3.32.5-1.fc30) 
MIME-Version: 1.0
Cc: Julia Lawall <julia.lawall@inria.fr>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "cocci@systeme.lip6.fr" <cocci@systeme.lip6.fr>
Subject: Re: [Linux-kernel-mentees] [Cocci] [PATCH 2/2] tests: Add test case
 for matching pointers to const pointers (and variants)
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

On Wed, 2020-02-05 at 19:55 +0100, Markus Elfring wrote:
> Would you like to avoid any abbreviations in the patch subject?
> 

I used abbreviations to keep the patch subject short but still clear.

Would the following be a better subject?

"tests: Add test case to match const pointer variants"

Cheers,
Jaskaran.

> 
> > These types would not match previously.
> 
> I imagine that this information can be improved for a nicer patch
> description,
> can't it?
> 
> Regards,
> Markus

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
