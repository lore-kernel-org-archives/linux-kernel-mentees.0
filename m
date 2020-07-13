Return-Path: <SRS0=16qS=AY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF43BC433E8
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jul 2020 14:08:53 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99502206F0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jul 2020 14:08:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hiQgbcp1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 99502206F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 60A1020013;
	Mon, 13 Jul 2020 14:08:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jUAngpqO8glV; Mon, 13 Jul 2020 14:08:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 69AD32014B;
	Mon, 13 Jul 2020 14:08:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3F582C088E;
	Mon, 13 Jul 2020 14:08:50 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0A1FBC0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 14:08:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id EA5EE89655
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 14:08:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LR93y6Wdir3p
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 14:08:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
 [209.85.218.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 404C189670
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 14:08:48 +0000 (UTC)
Received: by mail-ej1-f65.google.com with SMTP id y10so17383274eje.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 07:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=jFx3xxix0F8ETQCtd//YrBkRHyNpSKt8DUbehu81nM0=;
 b=hiQgbcp1vIlX39x6+QVdnLHGJ77oa5e1fwPasSS2+sV8zK6rqOW6JJ5Z0pNLWQ3fyH
 odx7b6feIbBRhv8AmdyCvjpu0Er3BjW++icYFpMcdLmYGXMb77ApdSCFPHQ7PYZx99Pk
 I8Mkstkgkprd7gWz2X1JGLeP0HTASvNy6CqmbcfoqDEDZQChTyxcj63JpPe2R9IPFeT2
 /H1agutVggOmAMHTMBd1fVRznJhJOpwoIKMNSwMgPNuLntSS4oJmPdK6ISJkxSSBE833
 eVGo5j4lAbf7jgdbIbwlcZJzo8zXY3jvhHGQazORWLnEKzUgjRXdpzLO50YpqLvoskPU
 1YgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=jFx3xxix0F8ETQCtd//YrBkRHyNpSKt8DUbehu81nM0=;
 b=bx8/tG0+fCniY1KIUTQ2IM/tBl1W5+dvQEacslpoHYNYcR7iAxxqNYWsc3A2UaVYiE
 640XJ97bUKFYeCrY4aImVdMl3VXclTHnrZ+GIkNdcvIBwsCEPKqVXaoOxupZHhIU+cE/
 LrA2GL1Akz3aZjMNWQtiBCAtbixPzEUSm6bgebIFYk4MOQu9/rx7YrTrxtbKibTM8H9K
 MGqHqppbWTHrGkO6n1FZH282q7vrMoDAO4r2iplUJr35VF/mARIo2lCNkJN9SE+fDEqe
 op7mM6UVRtfLkPwpmCYcRweMcpOPWKJDLfE3CUujni5J2DYrGTQpgIVGPgDTQhWFyONa
 VxJw==
X-Gm-Message-State: AOAM532mqIUS677q/2Tl0z1zV+edma0HTXLIbRt+uYQHDcflRBxg3yOm
 CF0Oev13IAVQpRsVbh/t1wg=
X-Google-Smtp-Source: ABdhPJx6tmdfVPPqPXF73jvefigbV9HS5iNfnxRnmUOs/bTLDWDUL20JfnLrxQhjKR+rCuUnUBZ6NA==
X-Received: by 2002:a17:906:7017:: with SMTP id
 n23mr56573249ejj.262.1594649326677; 
 Mon, 13 Jul 2020 07:08:46 -0700 (PDT)
Received: from net.saheed (54007186.dsl.pool.telekom.hu. [84.0.113.134])
 by smtp.gmail.com with ESMTPSA id p4sm9800064eja.9.2020.07.13.07.08.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jul 2020 07:08:45 -0700 (PDT)
To: Heiner Kallweit <hkallweit1@gmail.com>, helgaas@kernel.org,
 Realtek linux nic maintainers <nic_swsd@realtek.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Russell King <linux@armlinux.org.uk>
References: <20200713122247.10985-1-refactormyself@gmail.com>
 <20200713122247.10985-13-refactormyself@gmail.com>
 <e6610668-4d16-cbaa-8513-9ca335b06225@gmail.com>
From: Saheed Bolarinwa <refactormyself@gmail.com>
Message-ID: <c42ddef7-d6b0-158d-8278-80a582d2cca4@gmail.com>
Date: Mon, 13 Jul 2020 15:09:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <e6610668-4d16-cbaa-8513-9ca335b06225@gmail.com>
Content-Language: en-US
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [RFC PATCH 12/35] r8169: Tidy
	Success/Failure checks
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Thank you for the review.

On 7/13/20 3:45 PM, Heiner Kallweit wrote:
>
> Patches 11 and 12 are both trivial, wouldn't it make sense to merge them?
> Apart from that: Acked-by: Heiner Kallweit <hkallweit1@gmail.com>

I separated them for easy review, I will merge them in the next version.

- Saheed

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
