Return-Path: <SRS0=FEGG=EN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A52AC388F9
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  7 Nov 2020 18:55:54 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EAC7520888
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  7 Nov 2020 18:55:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="awC5Ydbv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EAC7520888
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AB8CE84799;
	Sat,  7 Nov 2020 18:55:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hgkkD43fHaNV; Sat,  7 Nov 2020 18:55:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 347C484516;
	Sat,  7 Nov 2020 18:55:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 157FDC088B;
	Sat,  7 Nov 2020 18:55:53 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D8830C0889
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Nov 2020 18:55:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id BF7E2871BF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Nov 2020 18:55:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5CmB3tm-mLGa
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Nov 2020 18:55:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 5E128871B8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Nov 2020 18:55:51 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id 13so4528050pfy.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 07 Nov 2020 10:55:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VAO8QCQbhPM5Qyv1PtukB43h6cU7UMKfCSaDJGMt/dc=;
 b=awC5YdbvOvwsQbUzO4qA1dWk/MxancfzfAOR3f2R0kMcmxVV+K0Q2f7220rYtPLQSq
 kK8bwneVDv7jCygrpnOOwrN4NY+kYoqLin03ZeBd8l79D/e1w6Vc4Pd3hehK/QYWe4Zm
 SCpvHfO0mbx5bHUURwe390Wi661GIy7COASSEhWFS7jIdEG7y1rYElyq1EUrZkqWZ3cc
 6dN6vXRnedzs/KqKJI/rEGvaPzvfiQQCvyd/UCAZ/5OojQVxjDkJgfgXpNeulH/Ma8n0
 2Opm9Lz6pO0+jiERxia/fMdqcn+xGFQoTpi84Jv6tQyHTS8h9fHcYdZExWBk+sDPF8Eh
 DmYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VAO8QCQbhPM5Qyv1PtukB43h6cU7UMKfCSaDJGMt/dc=;
 b=UFJ9eqBWEdpJipS2Al3B9e0dhC8DKurV3vNuufPIOBGRI0MNoLU+Yvgg2ZI5jsFAiR
 Sy3qQjkjf2K6IBI9Ac5ztOlmsnEoeLPELiJcsUyOXP/hibBT71sTjhrm1+rgVI+Oy1HJ
 yfyZU10rZyrC23/jBEme8fNFtnjnU2UZ3feWHJdzSdJEbZt9YLq5aoUATV0hk5xLtu/B
 Zyfuhx2M0SGPoyYlHmiXsVsQ1iyFSfpqu83NrpvTPzQ+VdqB//5LH7B5A8zkhsJjfTC3
 LBzE7/xcEbMTWpqWqkybQYvzim/8iDQNprGQ4aVEHeAWglrPiIa0uSrhQbJMCq2rGPcn
 kwJQ==
X-Gm-Message-State: AOAM531RW3ht1jnGbyqixAOmykjuHqXnlcjXKtoF8a6+Oonf+Qis6gh7
 TB1ekAY1bdvzToud/y8R7q10nXHOlojRNg==
X-Google-Smtp-Source: ABdhPJxXNzmaVOsmmSKsBamzQDmhzjKbid4iO/42onPvvLK0ob0RpxP+xbXMTrAQ8SqzHsenkt+qcA==
X-Received: by 2002:a63:4866:: with SMTP id x38mr6480167pgk.228.1604775350689; 
 Sat, 07 Nov 2020 10:55:50 -0800 (PST)
Received: from ?IPv6:2402:3a80:42d:7bb5:3470:9721:ad9d:115e?
 ([2402:3a80:42d:7bb5:3470:9721:ad9d:115e])
 by smtp.gmail.com with ESMTPSA id x30sm5688674pgc.86.2020.11.07.10.55.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Nov 2020 10:55:50 -0800 (PST)
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <20201103151858.25375-1-yashsri421@gmail.com>
 <CAKXUXMzx=UacWsoPyiD5AVtfBpVDCcJpAFMo8OpXrf+KNpBFww@mail.gmail.com>
 <6fca02c0-4c4d-c6bd-67b2-35304cf25499@gmail.com>
 <CAKXUXMygzqgiCm+1SCaA5daO5HkoUXyhXS=QEE2d8GKUO4nypg@mail.gmail.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <b8aac750-e460-74ad-674c-a340a1e4f188@gmail.com>
Date: Sun, 8 Nov 2020 00:25:45 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKXUXMygzqgiCm+1SCaA5daO5HkoUXyhXS=QEE2d8GKUO4nypg@mail.gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: add fix for
	BAD_SIGN_OFF
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

On 8/11/20 12:08 am, Lukas Bulwahn wrote:
> 
> Can you share the six commits?
> 
> Then we check if the fix is really the right fix of if something different
> is wrong with these commits.
> 


These are the commits where this warning for BAD_SIGN_OFF was getting
triggered(over 4.13..5.8):
1) Commit 1d1f898df658 ("rcu: Do RCU GP kthread self-wakeup from
softirq and interrupt")
2) Commit 6e88559470f5 ("Documentation: Add section about CPU
vulnerabilities for Spectre")
3) Commit a35d16905efc ("rcu: Add basic support for kfree_rcu() batching")
4) Commit b7e4aadef28f ("locking/spinlocks: Document the semantics of
spin_is_locked()")
5) Commit 621df431b0ac ("Documentation/memory-barriers.txt:
Cross-reference "tools/memory-model/"")
6) Commit 1c27b644c0fd ("Automate memory-barriers.txt; provide
Linux-kernel memory model")

> This certainly needs to be mentioned in the commit message.
>
Okay.


Thanks
Aditya

>
> Lukas
>
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
