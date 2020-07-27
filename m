Return-Path: <SRS0=tUVd=BG=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B0D6C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 18:23:47 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 568212073E
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 18:23:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel-dk.20150623.gappssmtp.com header.i=@kernel-dk.20150623.gappssmtp.com header.b="I1T7nVAH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 568212073E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 00A702206D;
	Mon, 27 Jul 2020 18:23:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nsZ4fvCmqsQd; Mon, 27 Jul 2020 18:23:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id EC09D203D6;
	Mon, 27 Jul 2020 18:23:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B9CF6C004F;
	Mon, 27 Jul 2020 18:23:45 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0C160C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 18:23:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 07C4C87F5C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 18:23:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HMsNoFPnbFbW
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 18:23:43 +0000 (UTC)
X-Greylist: delayed 00:17:14 by SQLgrey-1.7.6
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 052FE87F38
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 18:23:43 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id y22so15124471oie.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 11:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mFDUQmogg46Posu3w903aMyaH9JFMPS/SgmwZ4I8ccU=;
 b=I1T7nVAHC3vzto7UQ9hEUXPS9L7N6JIHGvzV+CxpjYgmTe+ds1sKddaNfOp5Lz3zFa
 gwq29Ta3R+Ik6gTSzyHZj/QZTNGF+3YjxvH/oCQsmR39XPWWUgXlruApbZuRv4+UO6m+
 F+qJsD58I3vBK2wxxeMXuf1z2fVrikDTjLjbR3nvBVLAacLbU8HVbI0K7jV8MOuA6Bxz
 4oT6R6utDcWVEFQn1fppwmwQNvzuhRptA2GEPRg7km6J4qyewnJSZB9xyCMkLRSxVBOr
 HSqr07ARxowQi2ya25mF7GPbk4Gk2mFcDQT0lHnrh3jPX2oUlHgOexqhi5yZie7+ZxLf
 N3HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mFDUQmogg46Posu3w903aMyaH9JFMPS/SgmwZ4I8ccU=;
 b=icuOBKbgbFZJTlyZXEYzcX6ygWJ0JsqoLp9c8xrRnVMQuzh1IaBIBrnWayVAUEb625
 lVI5O+X5PKqZRVyMtnkks4q0bi56X/CmV7lBfepvi7nzZSZa6XHMgaaqFT0I75lfeSjS
 DpHkbGQTOaFY8j73jKlKFBS3WURGsnASxTSnbLfFmK0q2AOjHWzGhsJREZwKLYGwypCo
 5foQ9Op9nQ4SkZM/kq/uXXN+tLLZH1gr9xFbpJF06JOGwPlDSngbVipLwbUdNCzSGjNb
 cmO24ZfODj90tHX7kT2kB61lMdpwR1r5l+KecjPFl3kfzth4/q9ZCwy/2wmwn6QsPRlP
 vm6w==
X-Gm-Message-State: AOAM532oummXj+UxTLi86ZagiNB7oy0xbntPRlvqXm7bhl5/qO+y50Zx
 O+lhf1TPKbNeZOXFuwjKeZAc2do6scI=
X-Google-Smtp-Source: ABdhPJxmYU88VTup/scAe1Pwy/mPgv3UJuWHJtQ3YU8xLR7QKaHQ2gI4MwOQdpbgduq0ybJfvL0uCg==
X-Received: by 2002:a17:90b:1116:: with SMTP id
 gi22mr495293pjb.8.1595872748151; 
 Mon, 27 Jul 2020 10:59:08 -0700 (PDT)
Received: from [192.168.1.182] ([66.219.217.173])
 by smtp.gmail.com with ESMTPSA id w70sm8378070pfc.98.2020.07.27.10.59.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jul 2020 10:59:07 -0700 (PDT)
To: Vaibhav Gupta <vaibhavgupta40@gmail.com>
References: <20200727173923.694872-1-vaibhavgupta40@gmail.com>
 <20200727174012.GA696265@gmail.com>
 <2b4738b0-5c2c-8ee2-83f9-10b961a5d0d3@kernel.dk>
 <20200727175119.GA700880@gmail.com>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <99b7cc57-1b4f-6c0b-00c6-08e22021c373@kernel.dk>
Date: Mon, 27 Jul 2020 11:59:05 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200727175119.GA700880@gmail.com>
Content-Language: en-US
Cc: linux-ide@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-kernel@vger.kernel.org, Bjorn Helgaas <helgaas@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2] ata: use generic power
	management
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

On 7/27/20 11:51 AM, Vaibhav Gupta wrote:
> On Mon, Jul 27, 2020 at 11:42:51AM -0600, Jens Axboe wrote:
>> On 7/27/20 11:40 AM, Vaibhav Gupta wrote:
>>> The patch is compile-tested only.
>>
>> Please test and verify actual functionality, if you're serious about
>> potentially getting this into the kernel.
>>
> Hello Jens,
> 
> Sadly I don't have the hardware. This upgrade is part of my Linux Kernel
> Mentorship Program project. Like other PCI drivers which I have updated, I could
> do compile-testing only. Though this patch covers 54 drivers but the actual
> change is done only in drivers/ata/libata-core. Since rest of the drivers
> make use of the same ata_pci_device_suspend/resume(), it was a chain reaction. I
> only had to change variable binding in "struct pci_driver" variable of dependent
> drivers.

That's understandable, but you should find at least some hardware (maybe remotely
accessible) to test this on. I'm not going to apply this without some confidence
that it actually works, and compile only testing is a far cry from that. Lots of
code compiles, but fails miserably at runtime.

While it's touching 54 drivers, at least basic coverage of the most popular
choices will give everybody some confidence that it works in general.

-- 
Jens Axboe

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
