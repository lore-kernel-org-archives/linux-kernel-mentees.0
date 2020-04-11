Return-Path: <SRS0=yCHA=53=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 531B3C2D0EC
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 11 Apr 2020 00:23:18 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10C8820936
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 11 Apr 2020 00:23:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="XoxhyoMh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 10C8820936
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id DEFDD20491;
	Sat, 11 Apr 2020 00:23:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cLfxCRUv1VIo; Sat, 11 Apr 2020 00:23:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 0B96520346;
	Sat, 11 Apr 2020 00:23:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E45A3C089F;
	Sat, 11 Apr 2020 00:23:16 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A104CC0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 11 Apr 2020 00:23:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 9C6DA88002
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 11 Apr 2020 00:23:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZkVfDDrWAWNl
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 11 Apr 2020 00:23:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id CEE3087FCC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 11 Apr 2020 00:23:12 +0000 (UTC)
Received: from localhost (mobile-166-170-220-109.mycingular.net
 [166.170.220.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D96FF20936;
 Sat, 11 Apr 2020 00:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586564592;
 bh=FARqdX+GaBf5FcPQFajNGokyR/e7xk3P4078Qxn1Q6U=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=XoxhyoMhIUqKBZBzaIQb+1KWVnZNlI4CfJgbia1WrhJVDAXvZe5C5NfBWBPUXeiPw
 d98Tl37TdeBia4O/DvR2XpZ1zzfT3XP8R507RUAIzokf/K0imEp9UOeF6lIT6cl1rD
 fdH5WiH3sy2czlT6kz8PHVEot7RO9UiTVF2ql9ao=
Date: Fri, 10 Apr 2020 19:23:10 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Vaibhav Gupta <vaibhavgupta40@gmail.com>, rjw@rjwysocki.net
Message-ID: <20200411002310.GA44923@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200410124418.34640-1-vaibhavgupta40@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v1] ethernet: intel: e1000:
 Convert to dev_pm_ops
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

On Fri, Apr 10, 2020 at 06:14:19PM +0530, Vaibhav Gupta wrote:
> Convert the legacy callback .suspend() and .resume()
> to the generic ones.

>  drivers/net/ethernet/intel/e1000/e1000_main.c | 47 +++++--------------

> @@ -5068,12 +5065,6 @@ static int __e1000_shutdown(struct pci_dev *pdev, bool *enable_wake)
>  		e1000_down(adapter);
>  	}
>  
> -#ifdef CONFIG_PM
> -	retval = pci_save_state(pdev);
> -	if (retval)
> -		return retval;
> -#endif

__e1000_shutdown() is used in both by both e1000_suspend() and
e1000_shutdown().  Suspend is obviously for power management, but I
don't understand the connection between shutdown and PM.  Why would
something in the shutdown path would depend on CONFIG_PM?

If we're in the shutdown path, we're either going to power off the
whole machine or reboot (or kexec a new kernel).  In any event, I
don't think the pci_save_state() is needed, so removing it shouldn't
hurt shutdown.

But I'm curious about this common idiom in e1000 and other network
drivers:

  e1000_shutdown()
  {
    ...
    if (system_state == SYSTEM_POWER_OFF) {
      pci_wake_from_d3(pdev, wake);
      pci_set_power_state(pdev, PCI_D3hot);
    }
  }

The pci_wake_from_d3() part sort of makes sense -- we want to
configure the device for wake-on-lan.  But all the drivers that do
this are network drivers.  USB, keyboard, etc drivers also need that
functionality, but none of them use pci_wake_from_d3().  Why?

And why do we need the pci_set_power_state()?  Seems like if we're
going to power off the whole machine we wouldn't need to set devices
to D3hot.  Almost all the pci_set_power_state(pdev, PCI_D3hot) calls
are from legacy suspend functions (which makes sense to me) or network
driver shutdown functions, and I don't understand why network drivers
do this differently than others.

Bjorn
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
