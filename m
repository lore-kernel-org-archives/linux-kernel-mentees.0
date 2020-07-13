Return-Path: <SRS0=16qS=AY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEEA7C433E4
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jul 2020 17:16:27 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A943D20663
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jul 2020 17:16:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gFu1qFbD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A943D20663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lwfinger.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 6A93727124;
	Mon, 13 Jul 2020 17:16:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6RGKRvgDLlcE; Mon, 13 Jul 2020 17:16:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id A6E3E24BDF;
	Mon, 13 Jul 2020 17:16:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 92E97C0888;
	Mon, 13 Jul 2020 17:16:26 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 52E0DC0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 17:16:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 3DCF8884DD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 17:16:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GTbi1gPU0LiZ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 17:16:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 43E44884BF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 17:16:24 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id 18so10090323otv.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 10:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zyBbRluQ5lYnUX7KFT5ZGZlRL0DFuI68QfOqM4RCzdA=;
 b=gFu1qFbDmtup0YSpFIfNaHM0a48eh0Ul1xSKNTnWGxWxCcBWiJ9n6R78PekE3f8A7p
 JtyBKwiVNIPBHsm1iLpcnuAI0d7JLvtXpcO2cPmP2Y/1z2LNW8bn0o3s7tgh3ZFU6b2s
 rYAWZryk+LgjPlE7o2+DXW7bCV12FqJAwCESb5liZr9Gxj0/Tl4/+tGlQjUz/iqYICFF
 R+RprQ6Xn5hWYnV3XgizYrw5LtuKlYa2H3jLOaZr2I4xgAgwckrkDkpSTcemOFp085ki
 yPBScHeFWTT5WT96kmmb5qlPZuhyRlVOk8bHWSEAQe+f2EQyzg9XgzSPG+7m3XzozbWW
 OJvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zyBbRluQ5lYnUX7KFT5ZGZlRL0DFuI68QfOqM4RCzdA=;
 b=IkeZ07vpCT8XhIS8fcmTp/UjqTUDdQkEY+ekeT2c/TPmJ8zHi+/XwP9cltAF3ADsge
 YIHVUc1eVJ6r5eM6sEd2coptfUUF5NK0ySgq/0nixc0i2xBXrGUgvek91J+NtXbHXzSt
 tzgvjoRppQA6AoSjhtH2OoRKubuDbS+zqxptZIC4N0ZNPX1rYANogB0yNZwQ1LzG2WJF
 I2Ow9dYKI3Jwn5ev+MQMcPmq44Tmpcswemj04k2hgsroqrq+0l/ecdi2u7xHkOYM9UG3
 FJSXXqR3AmmzeDio612369JMvJYtBjO1x4lQIh+cFs65WJUrzetcNsZhkBu3Yui34K0l
 O56Q==
X-Gm-Message-State: AOAM532Wnj4J/7Sfh7pCMv/vueJDWN8ESwBWhMlAWw5VpW8iGW/UzgfQ
 uQaQyzx3TB7IFYH7JM40bmQ=
X-Google-Smtp-Source: ABdhPJzJONrB+kPTWhVu9FhPTJ3Uhjr1/qB3HON7hdP7A8eAITLGJ3+s1k4xTNEcxUfwaaXa3lhIsg==
X-Received: by 2002:a9d:7a4c:: with SMTP id z12mr595958otm.126.1594660583279; 
 Mon, 13 Jul 2020 10:16:23 -0700 (PDT)
Received: from localhost.localdomain (cpe-24-31-245-230.kc.res.rr.com.
 [24.31.245.230])
 by smtp.gmail.com with ESMTPSA id a16sm2824303oid.14.2020.07.13.10.16.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jul 2020 10:16:22 -0700 (PDT)
To: "Saheed O. Bolarinwa" <refactormyself@gmail.com>, helgaas@kernel.org,
 Michael Buesch <m@bues.ch>
References: <20200713122247.10985-1-refactormyself@gmail.com>
 <20200713122247.10985-3-refactormyself@gmail.com>
From: Larry Finger <Larry.Finger@lwfinger.net>
Message-ID: <70e57af0-6a8c-a893-67c9-0181af16ae2b@lwfinger.net>
Date: Mon, 13 Jul 2020 12:16:21 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200713122247.10985-3-refactormyself@gmail.com>
Content-Language: en-US
Cc: linux-pci@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [RFC PATCH 02/35] ssb: Change
	PCIBIOS_SUCCESSFUL to 0
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

On 7/13/20 7:22 AM, Saheed O. Bolarinwa wrote:
> In reference to the PCI spec (Chapter 2), PCIBIOS* is an x86 concept.
> Their scope should be limited within arch/x86.
> 
> Change all PCIBIOS_SUCCESSFUL to 0
> 
> Signed-off-by: "Saheed O. Bolarinwa" <refactormyself@gmail.com>

Could you please tell me what difference this makes? It looks like source churn 
rather than a substantive change. The symbol is defined in pci.h and is used in 
many architures. Certainly, PCIBIOS_SUCCESSFUL indicates success even more 
clearly than 0 does.

Why is your name inside quotes in your s-o-b?

Larry
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
