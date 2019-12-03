Return-Path: <SRS0=o3A5=ZZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B1FDC432C0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Dec 2019 07:15:12 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EAEB20726
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Dec 2019 07:15:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rYVX22ng"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3EAEB20726
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0B91586223;
	Tue,  3 Dec 2019 07:15:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xCjb1X06lq2i; Tue,  3 Dec 2019 07:15:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9EE4D861AB;
	Tue,  3 Dec 2019 07:15:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 92974C1799;
	Tue,  3 Dec 2019 07:15:09 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 46D67C087F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Dec 2019 07:15:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 359A787F5A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Dec 2019 07:15:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ITYbKN6LWoZk
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Dec 2019 07:15:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by hemlock.osuosl.org (Postfix) with ESMTPS id AC63987E8B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Dec 2019 07:15:07 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id r67so1156461pjb.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 02 Dec 2019 23:15:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=N5dhLN6ZUdZy7qbcrhFqRDkTAyaEydaPR0KSp4d1Kkw=;
 b=rYVX22ng5y9nwctMuRjTWiQ78ZIhUqR2NFU5z0/XMqLENE+whBXd2uL4Bga8Gt9nWW
 T3LTOWRj6vsp050f6x6dTqL6QIJ0NqpG4EUwbukpiHaaGk3XIP1d6tfJ/Jj3SQTLSYDc
 CSZDKqGaP/B3ClQPOFh4sSNj+0/3bAAf8lcFNsO6jLS78Ps+w/ZCpXfNKYUEP30nmWMt
 LXVfSvzQ3vValVOtMVBjOjQtl9c35c8bvrsoU2kv7YzItEILFKRaZD4+x6apZbAuw5BD
 hRhZ1/0OO9W8zrbmwrCtMVJJS2Ct6m9eDsmJvb3htNkl6g9x9uFwezApA62G7lFwZl3m
 Lk4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=N5dhLN6ZUdZy7qbcrhFqRDkTAyaEydaPR0KSp4d1Kkw=;
 b=qZ3d6nOTMHfSM0EcRKJc/paBbuYAwYmlVsy9CfB4nePVF9fh4jkxDkxugJs+CgAsC+
 LueasaHOPiUv6PU35poNsXPIBVSr0vvtUKwTBBUPDN4GRiDnfQA/SyCMqBf5Q68J+Huj
 /yJXW1IwEEZNTMnd0/ovx2gB4ShtodsUzfBqcItMaJV9n7mEaFE99/Trr+url12cYVTQ
 uSmfnE0Q8TPBs/7jz0l2S2bH8Xg+D5VprNxEPoMyPiE9pKi5v0+CmcvQ7BlhCuRg7a9j
 n1X/plJki9gjDfN/D2nb82mfOIeTmS4WjmsnPbqZKMudxe+1MnzYe7/3eRzqn31kv53f
 nHeA==
X-Gm-Message-State: APjAAAWOcPvBj3MN6N8NW3eVq2zL0AUjimJgpX/ZrL02ZbDq/nhGm1fs
 jE6N6GTJiKTTT8+MbYmoMQg=
X-Google-Smtp-Source: APXvYqyTkUDH0DmgvUPwBfGldopMG8dI8qMv8/QU5E5sVhn1JWvVmo07QrR7aU3udiAnvAuD7l14VA==
X-Received: by 2002:a17:90a:8685:: with SMTP id
 p5mr3964852pjn.92.1575357307187; 
 Mon, 02 Dec 2019 23:15:07 -0800 (PST)
Received: from workstation-portable ([139.5.253.93])
 by smtp.gmail.com with ESMTPSA id u65sm2054215pfb.35.2019.12.02.23.15.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2019 23:15:06 -0800 (PST)
Date: Tue, 3 Dec 2019 12:44:15 +0530
From: Amol Grover <frextrite@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Message-ID: <20191203071415.GA9640@workstation-portable>
References: <20191203062503.GA3467@workstation-kernel-dev>
 <20191203064052.GA1788679@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191203064052.GA1788679@kroah.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Cc: linux-kernel-mentees@lists.linuxfoundation.org, stable@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [STABLE TEST] 5.3.13
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

On Tue, Dec 03, 2019 at 07:40:52AM +0100, Greg KH wrote:
> On Tue, Dec 03, 2019 at 11:55:03AM +0530, Amol Grover wrote:
> > Compiled, Booted, however I'm getting the following errors when running
> > "make kselftest"
> > 
> > sudo dmesg -l alert
> > 
> > [34381.903893] BUG: kernel NULL pointer dereference, address: 0000000000000008
> > [34381.903904] #PF: supervisor read access in kernel mode
> > [34381.903908] #PF: error_code(0x0000) - not-present page
> 
> Which test causes this problem?

IIRC I didn't run make kselftest with summary=1 option. Is there any
other way to get that information? The logs that kselftest generated
also don't seem to help in this.

> 
> ANd is it new in 5.3.13?
> 

I previously ran kselftest on 5.4-rc7 and 5.3.9 (default kernel shipped
by openSUSE), both were fine. However, a bit of backstory:

A day ago I used kselftest from the linux/next branch and ran it (w/o
sudo).  It showed me the exact same error. However, I was running a
modified version of 5.3.13, but those modifications were actually
trivial (5 lines changed) and shouldn't have resulted in this kernel
error. So, I switched to the vanilla 5.3.13 and ran kselftest (w/o sudo)
again. I ran it 3 times (w/o any errors), switched back to the modified
kernel and ran kselftest (w/o root) 2 more times and everything was
fine. Then I decided to test the vanilla one again for the 4th time, but
this time I ran kselftest as root where this BUG popped again.

Thanks
Amol


> thanks,
> 
> greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
