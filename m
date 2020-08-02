Return-Path: <SRS0=RDF/=BM=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20752C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  2 Aug 2020 15:14:42 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1AB020759
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  2 Aug 2020 15:14:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="Uo+FOVwN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E1AB020759
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 91EEF203BA;
	Sun,  2 Aug 2020 15:14:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fJV7EJ5NwkeL; Sun,  2 Aug 2020 15:14:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 663E42033E;
	Sun,  2 Aug 2020 15:14:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4AAF5C0050;
	Sun,  2 Aug 2020 15:14:40 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2AC67C004C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  2 Aug 2020 15:14:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 139D387919
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  2 Aug 2020 15:14:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qjCp2ljI6Tbn
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  2 Aug 2020 15:14:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail29.static.mailgun.info (mail29.static.mailgun.info
 [104.130.122.29])
 by hemlock.osuosl.org (Postfix) with ESMTPS id CEF78877DB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  2 Aug 2020 15:14:34 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1596381278; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=MN8hv/xfsAGGdQUHt7lfq4izDzLjyVfS5K7dU+XV1Pw=;
 b=Uo+FOVwNk4XOH/oLSv4+1SwKAm/WqB/IJlFAjN5aCFt+aE/6jvYsu/B1ldVdaGnoeavQSkN4
 TIKycEj6tSwL9cO2qaenL2DFEZxoR781v8Dz7YVw1RN8rcw4BCVTXV/6mD7lwYxt6RpmtY71
 PvJKQQDQDY90C4AXeaVEBTGsAB8=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1ODQyZiIsICJsaW51eC1rZXJuZWwtbWVudGVlc0BsaXN0cy5saW51eGZvdW5kYXRpb24ub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n12.prod.us-west-2.postgun.com with SMTP id
 5f26d846eb556d49a63d2ed6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sun, 02 Aug 2020 15:14:14
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id A2E1BC4339C; Sun,  2 Aug 2020 15:14:14 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id B6038C433C6;
 Sun,  2 Aug 2020 15:14:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B6038C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=kvalo@codeaurora.org
MIME-Version: 1.0
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20200717110928.454867-1-vaibhavgupta40@gmail.com>
References: <20200717110928.454867-1-vaibhavgupta40@gmail.com>
To: Vaibhav Gupta <vaibhavgupta40@gmail.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.5.2
Message-Id: <20200802151414.A2E1BC4339C@smtp.codeaurora.org>
Date: Sun,  2 Aug 2020 15:14:14 +0000 (UTC)
Cc: Stanislaw Gruszka <stf_xl@wp.pl>, Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 linux-wireless@vger.kernel.org, Helmut Schaa <helmut.schaa@googlemail.com>,
 linux-kernel@vger.kernel.org, Bjorn Helgaas <helgaas@kernel.org>,
 netdev@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-kernel-mentees] [PATCH v1] rt2x00: pci: use generic
	power management
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

Vaibhav Gupta <vaibhavgupta40@gmail.com> wrote:

> Drivers using legacy PM have to manage PCI states and device's PM states
> themselves. They also need to take care of configuration registers.
> 
> With improved and powerful support of generic PM, PCI Core takes care of
> above mentioned, device-independent, jobs.
> 
> The callbacks make use of PCI helper functions like
> pci_save/restore_state(), pci_enable/disable_device() and
> pci_set_power_state() to do required operations. In generic mode, they are
> no longer needed.
> 
> Change function parameter in both .suspend() and .resume() to
> "struct device*" type. Use dev_get_drvdata() to get drv data.
> 
> The .suspend() callback is invoking rt2x00lib_suspend() which needs to be
> modified as generic rt2x00pci_suspend() has no pm_message_t type argument,
> passed to it, which is required by it according to its declaration.
> Although this variable remained unused in the function body. Hence, remove
> it from the function definition & declaration.
> 
> rt2x00lib_suspend() is also invoked by rt2x00usb_suspend() and
> rt2x00soc_suspend(). Thus, modify the functional call accordingly in their
> function body.
> 
> Earlier, .suspend() & .resume() were exported and were used by the
> following drivers:
>     - drivers/net/wireless/ralink/rt2x00/rt2400pci.c
>     - drivers/net/wireless/ralink/rt2x00/rt2500pci.c
>     - drivers/net/wireless/ralink/rt2x00/rt2800pci.c
>     - drivers/net/wireless/ralink/rt2x00/rt61pci.c
> 
> Now, we only need to bind "struct dev_pm_ops" variable to
> "struct pci_driver". Thus, make the callbacks static. Declare an
> "extern const struct dev_pm_ops" variable and bind PM callbacks to it. Now,
> export the variable instead and use it in respective drivers.
> 
> Compile-tested only.
> 
> Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>

Patch applied to wireless-drivers-next.git, thanks.

560a218d1ce6 rt2x00: pci: use generic power management

-- 
https://patchwork.kernel.org/patch/11669881/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
