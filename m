Return-Path: <SRS0=TY1r=PB=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B49BC433F5
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 13 Oct 2021 18:48:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9ED4C61130
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 13 Oct 2021 18:48:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9ED4C61130
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 707FA60D4F;
	Wed, 13 Oct 2021 18:48:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I7Wyr5PP6XjM; Wed, 13 Oct 2021 18:48:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id A379D6076A;
	Wed, 13 Oct 2021 18:48:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 79732C000F;
	Wed, 13 Oct 2021 18:48:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 76127C000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Oct 2021 18:48:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5747240341
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Oct 2021 18:48:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id reJvGsHXvi5q
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Oct 2021 18:48:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E7A0A40315
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Oct 2021 18:48:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3E79F61130;
 Wed, 13 Oct 2021 18:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634150921;
 bh=ivRTxznM3B+fLvy1toNw8cZLjifCIQrQ1rDrS3ccI+E=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=V453JicKZcGYgPq4fByKU5Dgtrq5jUXh+7vhrVI8shrdvlfkJKoNKblJKvKgrd08a
 gubNLdEfDffLiChOeFrQT64/4hUjpg4Pq5RvNbSdxI9DA3nf7TbY93m86TsDUQ0rQa
 rFfT4zoG0+g5iVkh2FgXV4QaJw2mchBDfAsVGEIDsuuDeky+mMo/KrpU0BIu1utqFj
 DLqRehcWdR1HaKSZBdHH6sdY2g1wyHn6WuCKbhw8dFBq5JVThnPDmzjTDXSqyW1c00
 eMXdgTMGayyRkD33tZy9iYHEzqQNMtNSO65uAasyPcjy1VVv/oOkOYwSoqMdWs/rij
 yBMNddXiJlFwg==
Date: Wed, 13 Oct 2021 13:48:39 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Naveen Naidu <naveennaidu479@gmail.com>
Subject: Re: [PATCH 02/22] PCI: Unify PCI error response checking
Message-ID: <20211013184839.GA1909162@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211013171653.zx4sxdzhvy2ujytd@theprophet>
Cc: Rob Herring <robh@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 PCI <linux-pci@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
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

On Wed, Oct 13, 2021 at 10:46:53PM +0530, Naveen Naidu wrote:

> 2. "Rework any callers expecting a positive return value"
>    
>    This means, find out the places where we have something like 
>      
>      err = pci_read_config_dword();
>         if (err > 0)
> 
>    Then change it to:
> 
>      err = pci_read_config_dword(pdev, PCI_REG_NPKDSC, &npkdsc);
>         if (err != PCIBIOS_SUCCESSFUL)

I'm sure this is obvious, but I would try hard not to add any new uses
of PCIBIOS_SUCCESSFUL.

>    Is there any easy way to search for these patterns, or should I look
>    for each instance of pci_read_config_* and other such variants and
>    see if such an case exists?

coccigrep might be able to find things like this, but I'ver never
really become friends with it.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
