Return-Path: <SRS0=DonT=C4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=3.0 tests=BAYES_00,DATE_IN_PAST_03_06,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71A42C43463
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 19 Sep 2020 17:03:58 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA2092100A
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 19 Sep 2020 17:03:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qx/oIGre"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA2092100A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A47CA85D94;
	Sat, 19 Sep 2020 17:03:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sDgLXqloyY_I; Sat, 19 Sep 2020 17:03:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3166485C28;
	Sat, 19 Sep 2020 17:03:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1B0DAC0859;
	Sat, 19 Sep 2020 17:03:57 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EE9C7C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Sep 2020 17:03:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id E980185D4C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Sep 2020 17:03:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id syY4owZsBJ0n
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Sep 2020 17:03:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 75A7B85C28
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Sep 2020 17:03:55 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id 7so5374391pgm.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Sep 2020 10:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=0w8QbwM4kvqqRSaS1CHSdmOE6xRTZzX0zjgQjqhKDF0=;
 b=qx/oIGreK31Y6ETNGs/oln3jQ0qx9pvT8TBNtkNN19nR4lNugF6enbJTX4d0iWk7Ms
 dPvb2UoEnAjmBcHnjynt8u7rFvxEUYM3+iEvgVwr2hW4PEgfdCu1B4Ueribxo7hfy9SR
 HnxwBFa3s3kdu2CiWYcABCW2IhFzbwWQnn0JYqZkYaAcmN7HE2HNDH4aKDaE+K2S+zoK
 geUinYva8s+J8N2Yib7FDRNdPTOa27AUEEechVAdPKMaqQQM5wT36mRuNmS81b6PtfYf
 E1S5hl4+R68/og0k0Jn8qnZaNcYUvKHb3FYR4lJ/3N9LJwURlyGGCZrFxrGePMyc1ALN
 enZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=0w8QbwM4kvqqRSaS1CHSdmOE6xRTZzX0zjgQjqhKDF0=;
 b=k3TI1eofDYlEEV9ct2HYNY+Wf/Z/VNjd9QydPw1/rNvQfEGMGv0+cnzIkvr9T3wGT5
 dT+oVvjJV6KpyDCxiaMlovEGm2eOtbwqEvhE85uNiaRr7DhxE/dwLevgIPNnnBPUJ266
 nbf5xR+bI+9g9kYJglxu7QpsVFHOkOTzUQiBpKW68SrWSrWu9u8ZtxwBAPI9BP6/iZpE
 nMt+t+ARoYkZjVPDWonJxxDU0ir/MPNykL+IZbnPcPxUD4aWf33NHkP41azlr+Pxo333
 AVnapvfwf2IlbkGOTzshvgpD7TUn6ReFVB0hWNB0F06cz6LFBF9fxMfIXPWmybZo45Zt
 U5XQ==
X-Gm-Message-State: AOAM532Jzshh7fBwBTxU+BhN9U5nw+DRjttN+ZgL8eNdtpu/DFhmM0rg
 ViSyMskwCw87bNY9wvePRXw=
X-Google-Smtp-Source: ABdhPJxexXsrnXptAxi5so8K363t5vhAMff8n1qfJ44WUX0aS/CL9GTAnnqtJntEjZjKUhVbBRFdjg==
X-Received: by 2002:a63:485c:: with SMTP id x28mr31998096pgk.289.1600535034888; 
 Sat, 19 Sep 2020 10:03:54 -0700 (PDT)
Received: from [192.168.0.104] ([49.207.212.24])
 by smtp.gmail.com with ESMTPSA id k28sm6958398pfh.196.2020.09.19.10.03.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Sep 2020 10:03:54 -0700 (PDT)
To: Al Viro <viro@zeniv.linux.org.uk>, Greg KH <gregkh@linuxfoundation.org>
References: <20200916052657.18683-1-anant.thazhemadam@gmail.com>
 <20200916054157.GC825@sol.localdomain>
 <20200917002238.GO3421308@ZenIV.linux.org.uk>
 <20200919144451.GF2712238@kroah.com>
 <20200919161727.GG3421308@ZenIV.linux.org.uk>
 <20200919165558.GH3421308@ZenIV.linux.org.uk>
From: Anant Thazhemadam <anant.thazhemadam@gmail.com>
Message-ID: <26d881e5-f68a-b3b7-4cb0-04a3c6c384ac@gmail.com>
Date: Sat, 19 Sep 2020 17:03:50 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <20200919165558.GH3421308@ZenIV.linux.org.uk>
Content-Language: en-US
Cc: Eric Biggers <ebiggers@kernel.org>, linux-fsdevel@vger.kernel.org,
 syzbot+4191a44ad556eacc1a7a@syzkaller.appspotmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH] fs: fix KMSAN uninit-value bug
 by initializing nd in do_file_open_root
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


On 19-09-2020 22:25, Al Viro wrote:
> On Sat, Sep 19, 2020 at 05:17:27PM +0100, Al Viro wrote:
>
>> Lovely...  That would get an empty path and non-directory for a starting
>> point, but it should end up with LAST_ROOT in nd->last_type.  Which should
>> not be able to reach the readers of those fields...  Which kernel had
>> that been on?
> Yecchhh...  I see what's going on; I suspect that this ought to be enough.
> Folks, could somebody test it on the original reproducer setup?

Sure. I can do that.

Thanks,
Anant
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
