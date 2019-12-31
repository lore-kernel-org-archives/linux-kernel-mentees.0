Return-Path: <SRS0=22Qo=2V=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8511C2D0DC
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 31 Dec 2019 19:15:11 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A57FE206DA
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 31 Dec 2019 19:15:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fVT0/zuI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A57FE206DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6F12184DDD;
	Tue, 31 Dec 2019 19:15:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p47Mz7sHrYDJ; Tue, 31 Dec 2019 19:15:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0BD12838B8;
	Tue, 31 Dec 2019 19:15:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 06356C1D81;
	Tue, 31 Dec 2019 19:15:11 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EDFA2C077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Dec 2019 19:15:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id DA8B384AC5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Dec 2019 19:15:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yCTFHUl2BsE8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Dec 2019 19:15:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 6DD1684AA7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Dec 2019 19:15:09 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id kx11so1467704pjb.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Dec 2019 11:15:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=TbFdMRwsDwrVRhSr4fXNZgyq0tBrF3Naz329XDmz+JQ=;
 b=fVT0/zuIPIoa3+zheP+Xi4xB9iw8A+Ju2xLq4Amg+9jgoHVb/DtbfAGQRZQnFxjMIz
 zOjIO2eEV2tSIgvOZjfZ3Q16F/TmlIF+5yvcpuI7dt9MmG8IVlTle8D3W94Y1zkaNwjT
 jIrKJLr/6mp3FH+EgWMDws/5PmBlsbtT1UaKZfNO7kQk/ReTUUNNYnHyshA6VvHUEatj
 Yg+aQzwDyEVV0xRN+qrV+yrPC0loOHsBSL/K2OuRPY5iRxpuNkwxlh20PThnKhbFGAh2
 xeYeySGCKdDO1oLVc+dCKtQNDShM37mWx3xiW9GU5sQlCdBGFnJ3po4aGjo/k4lzQbat
 SF9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=TbFdMRwsDwrVRhSr4fXNZgyq0tBrF3Naz329XDmz+JQ=;
 b=YCzfnVpME0ta/fyMUfiy97slAhoE9W6F1QkzH4T4Jo5zd3QhUgULQQz5DqiF16YU5t
 Ff4x7c4tlMVViOm9InVZgOUHPyH/6tAqLTFteE0nfoFepXne/VRnQ6/nn7LfxcAzfVQ1
 CfLo5JinWfL6FeLwqzq17BW4OfL+PRb4m+fgwULhF3F2FbTZVpifYs0mB/8/C/YdZjST
 ZJLLS1voxMD3q/CmQYT9F03nOkZSWoU6tENNcgnVFJ7bQZuzpEK0QSX4UrRIAo7Vh1M3
 Ld63o+nD2Igwyjj5m8pG1+imU9wzRL0pAFhCSzAi7rxYlb0ZEvNwG2XnL+o1A81Q9vt0
 yAdg==
X-Gm-Message-State: APjAAAWgkhGwVfAWIqWe8XogAZUHsRGqo46xlVxX2QfuMKoVgI/1Ykdr
 sgIrTSIwpxXyB17Y9Jx5z15jdpEnE6o=
X-Google-Smtp-Source: APXvYqxJncWlLsvGB12dfYWmOfOGkuRhv6SWAyyjOAEhxEQ5ldop6Il/xKZrK9dDCaRlN0Nx8mBEgg==
X-Received: by 2002:a17:90a:6a81:: with SMTP id u1mr8122549pjj.4.1577819708890; 
 Tue, 31 Dec 2019 11:15:08 -0800 (PST)
Received: from ?IPv6:2804:14d:72b1:8920:a2ce:f815:f14d:bfac?
 ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
 by smtp.gmail.com with ESMTPSA id m45sm4488158pje.32.2019.12.31.11.15.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Dec 2019 11:15:08 -0800 (PST)
To: Jonathan Corbet <corbet@lwn.net>
References: <cover.1577681164.git.dwlsalmeida@gmail.com>
 <92be5a49b967ce35a305fc5ccfb3efea3f61a19a.1577681164.git.dwlsalmeida@gmail.com>
 <20191230121807.3a1f5f38@lwn.net>
 <47e2ea6e-a808-5012-6f9a-8800fbd3be00@gmail.com>
 <20191231083213.0786bda1@lwn.net>
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Message-ID: <ef2785ae-5205-9840-e0b1-3ab920b35482@gmail.com>
Date: Tue, 31 Dec 2019 16:15:05 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20191231083213.0786bda1@lwn.net>
Content-Language: en-US
Cc: mchehab+samsung@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2 2/8] Documentation:
	nfsroot.txt: convert to ReST
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

> Changing text in an existing paragraph can
> result in line lengths that are inconsistent and ragged, leading to a less
> pleasant appearance
> and the temptation to "refill" the paragraph so that the
> lines are all approximately equal in length.  The problem with yielding
> to that temptation is that it messes up
> the diff output so that you can no longer easily see the actual
> text changes that were made.
>
> Thus, when making such changes, it can be better to not refill the
> paragraphs - as, indeed, you did not.  But if the result becomes too
> difficult to read (as in, it creates lines that are waaaay to long), it
> can be good to create a second patch that makes only the cosmetic changes
> without any associated text changes.  I was suggesting doing that in this
> case.

> Does that help?

Yes, that's better!

Thank you.


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
