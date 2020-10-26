Return-Path: <SRS0=aL4C=EB=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81F2DC388F9
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 26 Oct 2020 18:19:21 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 135932222C
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 26 Oct 2020 18:19:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c6YDidei"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 135932222C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B907085FAC;
	Mon, 26 Oct 2020 18:19:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jLGkBDW9yUyO; Mon, 26 Oct 2020 18:19:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6700C83970;
	Mon, 26 Oct 2020 18:19:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4098AC0859;
	Mon, 26 Oct 2020 18:19:20 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C9E0FC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Oct 2020 18:19:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id C474883970
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Oct 2020 18:19:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oxy0wkYJbkWP
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Oct 2020 18:19:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 593C58588A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Oct 2020 18:19:18 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id h6so6524311pgk.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Oct 2020 11:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0DNJ0t/C1pzRa+JekKOelQmdqY3jAoAvJFAIIwjzcxI=;
 b=c6YDideimVC9ltOEOo02MEpJTj4DfpF8esGdeorn6b8AKxkF2pvnqUpE2QT2H0erxX
 JoRwY66KYwZpVjGGuFaiKtUdcK1R875E38C++N6APPb6fh37p/ISu9OpW3OFJs3l55Gc
 2BSdnrzHCzSj6cBpdG3Nnhs/EFC+eu7Rh5cO0hesmHY6IW/xm5CVqaWmiCegmyrdUFcf
 Fsm8Nn6CPL3CZwXwunfBaZPVDe9wuDPlMlYK7mI6LsBq+xxaGzUS0VExrUKeLPbFOQWm
 6hNrp5T6GQ3lz0sXYDGDXjxHAr74WIyJhsmVJmkvE9KXA6Lf3VQQOuSzoI+Sr1B7Khjr
 3CAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0DNJ0t/C1pzRa+JekKOelQmdqY3jAoAvJFAIIwjzcxI=;
 b=Fy9LkuJGZwNJWzXj0HvMpvmVdEL6Mu+VGtYklQHooFRCXNQdIB6zu5hGOUJkH75+x+
 HLsNdyp5WHZlty76us2jmlg+iodtPK911qotYYl42ecbDn5GRPE1iArSol1KJFQnTdcY
 cLeeD7frgzKD0yeNHIOg5dcwudfJ9xGm3FTZNbMz5rTtuoMxX8vJAwSrCSpqscjYf2Ge
 jL1L6p0PatHLCLAOddGv24dY7Jle2OfZx+dlLiAQY5osFXdTGKXXpprFyEOzcqKtI26Y
 UtOCXXYTV7qaWj8l7ynyeSL3faiEPbV02C1f4HibuPGrBajfxgd54UjGgTWmtqOznNr4
 XL5A==
X-Gm-Message-State: AOAM530lvwckVXtSC0em5dt25kWczIMGeJMOArg1ITaOTkBmrV8OT+p/
 pVLS32QJDLPUc1sQCwinOrY=
X-Google-Smtp-Source: ABdhPJxICrpTjoswgcTyvvddScL1O78vUFhyOoRXNVbMst8q0gBSG2wFlklT73LGt3dE4sOW1OvFKw==
X-Received: by 2002:a63:4c55:: with SMTP id m21mr18174458pgl.305.1603736357935; 
 Mon, 26 Oct 2020 11:19:17 -0700 (PDT)
Received: from [192.168.86.81] ([106.51.240.100])
 by smtp.gmail.com with ESMTPSA id q13sm12604702pfg.3.2020.10.26.11.19.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Oct 2020 11:19:16 -0700 (PDT)
To: Iurii Zaikin <yzaikin@google.com>
References: <20201023150536.282568-1-98.arpi@gmail.com>
 <20201023150634.282631-1-98.arpi@gmail.com>
 <CAAXuY3q6c3d5kkLOqsG2LBmBYS4d9qRuEeZ2ChpJF1OVTkV5gw@mail.gmail.com>
From: Arpitha Raghunandan <98.arpi@gmail.com>
Message-ID: <d3e31145-9286-a81d-3e76-8f23d6f6211f@gmail.com>
Date: Mon, 26 Oct 2020 23:49:10 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAAXuY3q6c3d5kkLOqsG2LBmBYS4d9qRuEeZ2ChpJF1OVTkV5gw@mail.gmail.com>
Content-Language: en-US
Cc: Marco Elver <elver@google.com>, Theodore Ts'o <tytso@mit.edu>,
 Brendan Higgins <brendanhiggins@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Ext4 Developers List <linux-ext4@vger.kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 KUnit Development <kunit-dev@googlegroups.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v2 2/2] fs: ext4: Modify
 inode-test.c to use KUnit parameterized testing feature
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

On 26/10/20 11:41 pm, Iurii Zaikin wrote:
>> +static struct timestamp_expectation test_data[] = {
> Can you mark this and the rest of the hardcoded values as the const they are?
> 

Sure, I will make this change for the next version.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
