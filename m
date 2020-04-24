Return-Path: <SRS0=nCKz=6I=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: *
X-Spam-Status: No, score=2.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	TVD_SUBJ_WIPE_DEBT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 203A3C55191
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Apr 2020 14:05:57 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBF732075A
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Apr 2020 14:05:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s66pNgE/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DBF732075A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A36BB86B59;
	Fri, 24 Apr 2020 14:05:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z2De3pi58pBG; Fri, 24 Apr 2020 14:05:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8C13686B15;
	Fri, 24 Apr 2020 14:05:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7AB70C1AE2;
	Fri, 24 Apr 2020 14:05:55 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 481A2C0175
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 14:05:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 4417986B59
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 14:05:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4vWBzTCD2CxO
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 14:05:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 25F8E86B15
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 14:05:52 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id y26so560732ioj.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 07:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rFPhC2c4vZk1BqE2hqB/6b3CBe0r+otCLNW3IvNRPIk=;
 b=s66pNgE/iPYYwT5WN8KW1P6G6XaJESkB/Yz7YVHVM4h4t7z+6+VuPQsHUE8BUhteCj
 xyfZRAQPDIKtTqYhssb3BCs2SdoSvab4y+E9cbhJgU+tGtyuvPiGM4HavaO3Frpl7YQs
 8ZQgiQN1U1O3krXPIpgcRpHsm/k9wn7OoNjf64qgwChKivFXN4xaPkWsblvYPpbOmDcP
 0VZgW9lv1jC0VaKhGLv/6WxIH2OtvWsE1Yomh0NPEoDPcU3YcKe/mELPrHaJtkEA4ouP
 tEcfQ5k+j7DnIyZ1yFQ4axFL+O0IHaEej2Ufn448+ifvxv6FV3N1KpI9lbabwUGuZ+5W
 ZCGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rFPhC2c4vZk1BqE2hqB/6b3CBe0r+otCLNW3IvNRPIk=;
 b=j4Aa3EW0I/n4OFzobhl6rl+EBiHjrEx/A0BWGxMOjhaG2/EUP2I+bW7/0R9E2SVnQ9
 kf6ainNY+QetBzV4hj2ZgdYrOD3b1tdv6+r4VxOtwK7An/ueaqvRIeKe/1zT7Qz9j0BZ
 z1Z8rvBP5L/qATQmUu61Y4XuZ07qScuxg/Zk/IkcPF/lL/JLIRY7Xh3I9hjMIphhGr+5
 uTMemswTSFfmSLBgoHsvySy2jHnKULVuTRNLa69HXNEjHhvKak1Ee/eSn8EskDI1d3Xy
 rZxeVf+XSqF/I5KzrEa4veZEQWTJrzrJ0dU3GOjCR79WlCck8OnZx8ntVgFHCH17qpBd
 AMbQ==
X-Gm-Message-State: AGi0PuZEPJwe5thEn6A8RYJVIM/QdHSsavbEOAcsO4wiPbTXKDzNCOep
 SBPkFRCD+mOv4Uf3kjNeV/l4FPlvstJ4GIT11CA=
X-Google-Smtp-Source: APiQypKeJLv42OOnxUBlKCfM8oVT7S0BNNutQ0k9LXzKryM6q9TfLMPUVDqPIvoY5CEONj5BG5wFIjfmNF8mhvqBsis=
X-Received: by 2002:a05:6638:22a:: with SMTP id
 f10mr8564988jaq.59.1587737151348; 
 Fri, 24 Apr 2020 07:05:51 -0700 (PDT)
MIME-Version: 1.0
References: <CAPBsFfARrVF1Ch-gMT6fbnBhdigY+qQKSZV8P_h3bZw5bXiFrg@mail.gmail.com>
 <20200424135910.GA118662@google.com>
In-Reply-To: <20200424135910.GA118662@google.com>
From: Vaibhav Gupta <vaibhav.varodek@gmail.com>
Date: Fri, 24 Apr 2020 19:34:50 +0530
Message-ID: <CAPBsFfDvP2zGUbGj8nNZcBfTRhTeAsxMZtS1Kea_p9V9dWBYbA@mail.gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v1 2/2] realtek/8139cp: Remove
 Legacy Power Management
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

> >
> > But in case of "__maybe_unused", we don't keep a check while binding
> > ".driver.pm".
> > Hence, if CONFIG_PM_SLEEP is not defined, still the ".driver.pm" is
> > bind with a structure
> > with some random initial values.
> >
> > We can use the mix of both?
> > __maybe_unused xyz_suspend(){}
> > __maybe_unused xyz_resume(){}
> > ...
> > #ifdef CONFIG_PM_SLEEP
> > .driver.pm = &xyz_pm_ops;
> > #endif
>
> I don't think we need the mix because when CONFIG_PM_SLEEP isn't
> defined, SIMPLE_DEV_PM_OPS() compiles to:
>
>   const struct dev_pm_ops xyz_pm_ops = { }
>
> and the xyz_pm_ops struct should be zero-filled.  The #ifdef around
> ".driver.pm = &xyz_pm_ops" doesn't buy us anything -- the space for
> the driver.pm pointer is there regardless, so we don't save any space,
> and the default initialization is zero-filled, so the result is the
> same.

Then, I guess my step to remove "#ifdef CONFIG_PM" won't go complete
waste, I should just use "__maybe_unused" with suspend() and resume()
to suppress warnings. Right?

-- Vaibhav Gupta
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
