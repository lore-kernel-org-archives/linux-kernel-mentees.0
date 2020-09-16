Return-Path: <SRS0=IxsT=CZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1473DC433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 16 Sep 2020 13:38:31 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52B3C22288
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 16 Sep 2020 13:38:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fHilp9TK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 52B3C22288
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C8BC7820C5;
	Wed, 16 Sep 2020 13:38:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K-A5ZLEkzjMo; Wed, 16 Sep 2020 13:38:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4256081A18;
	Wed, 16 Sep 2020 13:38:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 33C95C0859;
	Wed, 16 Sep 2020 13:38:29 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3882CC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Sep 2020 13:38:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 26CE886FC7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Sep 2020 13:38:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6oMxxe7jmtnD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Sep 2020 13:38:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 7CB6D86F66
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Sep 2020 13:38:27 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id z19so3978905pfn.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Sep 2020 06:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=RPMmBa/zuVIVa6YT0Ct/PRYo3W8xK4AI2YIowuyMAz8=;
 b=fHilp9TKndRfRIpIEW7pskStpJIx9tJimZ/y0pA9ypEvUHuYNm+18QlWmYOouD1tX0
 LCK9aNAEI5YK+8CxLy6PgjIyLZmIZKfqvdx8B+9dwUnu8GnDSki3ejFJDcxMtw4ZvZkD
 o58I2PumQyjbrEwCBsQvpOvIod2iRymYkDGLSlbDNe4W6UpmWWVqCwY2nBO6TgvF0l4g
 KHU2qC9MgZICr7bfyPlIUWcx9aqQb6z72coEyRXs4xC52mJuXIJ47/9zIuWZe9xlXciN
 rWrQ0jdnFJUZre4qzzTb/8uUrDgfCghNIQGgFqFdkhyrVn5mG75WLqiOFP8ZrHLbyxL8
 NelQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=RPMmBa/zuVIVa6YT0Ct/PRYo3W8xK4AI2YIowuyMAz8=;
 b=WxcVel8YD81l/zbd7n+UjSFbYw6X9oXcLxGOp4rmcF/gpxrC1EMhZZMTle8dKmIdJQ
 MC09zwWynAI6k4SNuskKqoDdfr+Xz3T/ZnVVU/7Iv9fIvBu1/kjJdzUoPNqJPxB2uUIb
 VOCXxEMr3a0xuleLaTAP3l5fHiQ6Ba76LrzpySeubiPCg9957jiZUNTX6hpp00pg91p7
 oBcMLOJOpeRhizYPauhl3g/m0BNQGYSKQrDmevmU2AVn3f885af8UjaXP2uono8o9ook
 RnIwxZSQmF5aH8KpL46EK3Lz43fCIf3btzsqlJYwe5IrC7989U762KCLrzrVtiDQSre4
 Z9nQ==
X-Gm-Message-State: AOAM531Vv8gHX9bB2Kb9+f/2+UrijgiUJEKY+ko3l33/m9twBGJTebt5
 ceA9AT3Q/N7KPR8jpEs3JVg=
X-Google-Smtp-Source: ABdhPJw8pDY+mq6BWskzMRd1QiEHrMA+qZcz43pBqGlrejs0IcKqbHwaajsxiVnJqEydNRZeG2HCHg==
X-Received: by 2002:a63:30c:: with SMTP id 12mr18613171pgd.66.1600263506704;
 Wed, 16 Sep 2020 06:38:26 -0700 (PDT)
Received: from [192.168.0.104] ([49.207.198.18])
 by smtp.gmail.com with ESMTPSA id e62sm16987968pfh.76.2020.09.16.06.38.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Sep 2020 06:38:26 -0700 (PDT)
To: Petko Manolov <petkan@nucleusys.com>
References: <20200916050540.15290-1-anant.thazhemadam@gmail.com>
 <20200916061946.GA38262@p310>
From: Anant Thazhemadam <anant.thazhemadam@gmail.com>
Message-ID: <780e991d-864d-0491-f440-12a926920a8a@gmail.com>
Date: Wed, 16 Sep 2020 19:08:21 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200916061946.GA38262@p310>
Content-Language: en-US
Cc: syzbot+abbc768b560c84d92fd3@syzkaller.appspotmail.com,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-kernel-mentees] [PATCH] rtl8150: set memory to all 0xFFs
 on failed register reads
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


On 16/09/20 11:49 am, Petko Manolov wrote:
> On 20-09-16 10:35:40, Anant Thazhemadam wrote:
>> get_registers() copies whatever memory is written by the
>> usb_control_msg() call even if the underlying urb call ends up failing.
> Not true, memcpy() is only called if "ret" is positive.
Right. I'm really sorry I fumbled and messed up the commit message
there. Thank you for pointing that out.
>> If get_registers() fails, or ends up reading 0 bytes, meaningless and junk 
>> register values would end up being copied over (and eventually read by the 
>> driver), and since most of the callers of get_registers() don't check the 
>> return values of get_registers() either, this would go unnoticed.
> usb_control_msg() returns negative on error (look up usb_internal_control_msg() 
> to see for yourself) so it does not go unnoticed.

When I said "this would go unnoticed", I meant get_register() failing would
go unnoticed, not that usb_control_msg() failing would go unnoticed.
I agree that get_registers() notices usb_control_msg() failing, and
appropriately returns the return value from usb_control_msg().
But there are many instances where get_registers() is called but the return
value of get_registers() is not checked, to see if it failed or not; hence, "this
would go unnoticed".

> If for some reason it return zero, nothing is copied.  Also, if usb transfer fail 
> no register values are being copied anywhere.

True.
Now consider set_ethernet_addr(), and suppose get_register() fails when
invoked from inside set_ethernet_addr().
As you said, no value is copied back, which means no value is copied back
into node_id, which leaves node_id uninitialized. This node_id (still
uninitialized) is then blindly copied into dev->netdev->dev_addr; which
is less than ideal and could also quickly prove to become an issue, right?

> Your patch also allows for memcpy() to be called with 'size' either zero or 
> greater than the allocated buffer size. Please, look at the code carefully.
Oh. I apologize for this. This can be reverted relatively easily.
>> It might be a better idea to try and mirror the PCI master abort
>> termination and set memory to 0xFFs instead in such cases.
> I wasn't aware drivers are now responsible for filling up the memory with 
> anything.  Does not sound like a good idea to me.
Since we copy the correct register values when get_register() doesn't fail,
I thought it might be a slightly better alternative to fill node_id with 0xFFs,
instead of leaving it go uninitialized in case get_registers() fails.

Also, what are the odds that a successful get_register() call would see
0xFFs being copied?
If that's very real scenario, then I admit this doesn't work at all.

The only other alternative approach I can think of that can handle the
issue I highlighted above, is to introduce checking for get_registers()'s
return values nearly everywhere it gets called.
Would that be a more preferable and welcome approach?

Thank you for your time.

Thanks,
Anant


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
