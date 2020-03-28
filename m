Return-Path: <SRS0=0uWt=5N=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FAKE_REPLY_C,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79A81C2D0EE
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 28 Mar 2020 19:59:37 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 420B320714
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 28 Mar 2020 19:59:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ram8R/hV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 420B320714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 202DA8885B;
	Sat, 28 Mar 2020 19:59:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LDIubZbK9R5Z; Sat, 28 Mar 2020 19:59:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9F53C88856;
	Sat, 28 Mar 2020 19:59:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 86839C18DA;
	Sat, 28 Mar 2020 19:59:36 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3FA98C0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Mar 2020 19:59:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 2AEBE87899
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Mar 2020 19:59:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 39pIatQG1k0l
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Mar 2020 19:59:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id A40418788C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Mar 2020 19:59:34 +0000 (UTC)
Received: from localhost (mobile-166-175-186-165.mycingular.net
 [166.175.186.165])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 19A06206E6;
 Sat, 28 Mar 2020 19:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585425574;
 bh=Qj/IrxEUrTlO01aVKjX/HLCY5OaDZhl6OPgn/ojV58k=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=ram8R/hVH3t8q4JC9mluTDr9CBxoglo0di72qnNIZtRoirOglWN8O6nWs7oK2JgiC
 nRbgMGdqri5yFMz0cvwDUcDyRinRKWUeNG286NCjrV6yP7aS9Gmaaz7U8x9f/vomgX
 Kj+VnbjVWjPKMiQbdf7WIt6hXEhiYwjMBuKKpUQw=
Date: Sat, 28 Mar 2020 14:59:32 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Kelsey <skunberg.kelsey@gmail.com>
Message-ID: <20200328195932.GA96482@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFVqi1R0Cc4+wqwCr9-8HoTU+6cShzorD44YzDNyex+jv1dztA@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Cc: linux-pci@vger.kernel.org, Kelsey Skunberg <kelsey.skunberg@gmail.com>,
 rbilovol@cisco.com, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 stable <stable@vger.kernel.org>, Don Dutile <ddutile@redhat.com>,
 Ruslan Bilovol <ruslan.bilovol@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Bodong Wang <bodong@mellanox.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v2] PCI: sysfs: Change bus_rescan
 and dev_rescan to rescan
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

On Thu, Mar 26, 2020 at 12:29:11AM -0600, Kelsey wrote:
> On Wed, Mar 25, 2020 at 4:10 PM Bjorn Helgaas <helgaas@kernel.org> wrote:

> > Thanks for taking care of this!  Two questions:
> >
> > 1) You supplied permissions of 0220, but DEVICE_ATTR_WO()
> > uses__ATTR_WO(), which uses 0200.  Shouldn't we keep 0200?
> >
> 
> Good catch. Before changing to DEVICE_ATTR_WO(), the permissions used
> was (S_IWUSR | S_IWGRP), which would be 0220. This means the
> permissions were mistakenly changed from 0220 to 0200 in the same
> patch:
> 
> commit 4e2b79436e4f ("PCI: sysfs: Change DEVICE_ATTR() to DEVICE_ATTR_WO()")
> 
> To verify DEVICE_ATTR_WO() is using __ATTR_WO() can be seen in
> /include/linux/device.h
> To verify permissions for __ATTR_WO() is 0200 can be seen in
> /inlcude/linux/sysfs.h
> 
> These attributes had permissions 0220 when first being introduced and
> before the above mentioned patch, so I'm on the side to believe that
> 0220 should be used.

I'm not sure it was a mistake that 4e2b79436e4f changed from 0220 to
200 or not.  I'd say __ATTR_WO (0200) is the "standard" one, and we
should have a special reason to use 0220.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
