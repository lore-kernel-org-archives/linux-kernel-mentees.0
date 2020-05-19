Return-Path: <SRS0=ZD04=7B=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2831CC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 19 May 2020 22:32:47 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD05620674
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 19 May 2020 22:32:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD05620674
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=davemloft.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7E08A87C8C;
	Tue, 19 May 2020 22:32:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BcJV8dRv9+xg; Tue, 19 May 2020 22:32:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2304487BD9;
	Tue, 19 May 2020 22:32:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EE4CCC07FF;
	Tue, 19 May 2020 22:32:45 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 929C6C0176
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 19 May 2020 22:32:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 89AED87C30
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 19 May 2020 22:32:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cjEAIWEe2ECF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 19 May 2020 22:32:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from shards.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 258C587BD9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 19 May 2020 22:32:42 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 3A188128EDAAA;
 Tue, 19 May 2020 15:32:41 -0700 (PDT)
Date: Tue, 19 May 2020 15:32:39 -0700 (PDT)
Message-Id: <20200519.153239.1577517664546707472.davem@davemloft.net>
To: vaibhavgupta40@gmail.com
From: David Miller <davem@davemloft.net>
In-Reply-To: <20200518150214.100491-1-vaibhavgupta40@gmail.com>
References: <20200518150214.100491-1-vaibhavgupta40@gmail.com>
X-Mailer: Mew version 6.8 on Emacs 26.3
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Tue, 19 May 2020 15:32:41 -0700 (PDT)
Cc: linux-pm@vger.kernel.org, linux-pci@vger.kernel.org, rjw@rjwysocki.net,
 linux-kernel@vger.kernel.org, helgaas@kernel.org, netdev@vger.kernel.org,
 bhelgaas@google.com, linux-kernel-mentees@lists.linuxfoundation.org,
 hkallweit1@gmail.com
Subject: Re: [Linux-kernel-mentees] [PATCH net-next v3 0/2] realtek ethernet
 : use generic power management.
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

From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
Date: Mon, 18 May 2020 20:32:12 +0530

> The purpose of this patch series is to remove legacy power management callbacks
> from realtek ethernet drivers.
> 
> The callbacks performing suspend() and resume() operations are still calling
> pci_save_state(), pci_set_power_state(), etc. and handling the powermanagement
> themselves, which is not recommended.
> 
> The conversion requires the removal of the those function calls and change the
> callback definition accordingly.
> 
> All Changes are compile-tested only.

Series applied, thanks.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
