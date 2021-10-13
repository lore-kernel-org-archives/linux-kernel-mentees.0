Return-Path: <SRS0=TY1r=PB=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89440C433F5
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 13 Oct 2021 22:13:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 251C061151
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 13 Oct 2021 22:13:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 251C061151
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E95FA60B16;
	Wed, 13 Oct 2021 22:13:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VxscmdnusNIf; Wed, 13 Oct 2021 22:12:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 547E560ADA;
	Wed, 13 Oct 2021 22:12:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 20046C000F;
	Wed, 13 Oct 2021 22:12:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9F6FCC000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Oct 2021 22:12:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 73D14833AF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Oct 2021 22:12:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9O4cLfssYgpr
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Oct 2021 22:12:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 11F2F82974
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Oct 2021 22:12:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5A64161151;
 Wed, 13 Oct 2021 22:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634163175;
 bh=u/bQLZfhgnTnBbANf/qHToPTgbfBAr7b4QRmI0DM+VQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=Pucg75TZ34Ae7T9jQ+XgW7e3rakhnRpGxYCSWvo2KxWvClG4ZbIKbtjeC2UVH+oO7
 iVoNz/cLB6cSajRUNncbKcrPGbXD+ShoH15SzmVOLk+06vQmt6Z/lB063sUIpLOTmw
 R1laj0u3CVt86yKRk6JI9fS1kR5UQXiBp7dmZdRiInrPT8zKXLqikFm+SUZILmBlek
 41SxPxZsmdwemO4Ok3cqgzGZGIl2UTjmWHhgRpCimk10jJ02LX/h899Uur3nfBbMeH
 coJjsSJGtt5f3YMjTcOCBHPuG+mnNeFJ3lz3CO5q4I8oPbVyKrgmbMtI3WATZIFq6J
 SQrjktw55/ahg==
Date: Wed, 13 Oct 2021 17:12:53 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 02/22] PCI: Unify PCI error response checking
Message-ID: <20211013221253.GA1928518@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAL_JsqL0d4qOR+wsnpdRUc+EQ6_diUzPbMj3Tv-Ly29or6Asvw@mail.gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
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

On Wed, Oct 13, 2021 at 04:47:43PM -0500, Rob Herring wrote:

> Presumably, there could be some register somewhere where all 1s is
> valid? So I think we need the error values.

We have to assume ~0 is a valid value for any config registers except
the few defined by the spec that have bits required to be 0.  There
can be all kinds of vendor-defined stuff in config space that can be
anything.

> Also, I seem to recall only the vendor/device IDs are defined to be
> all 1s for non-existent devices. Other errors are undefined?

I think this case is actually an instance of the PCI controller
fabricating ~0 because a PCI/PCIe error occurred (I think on PCI it's
a Master Abort when nothing responds; on PCIe the read terminates as
an Unsupported Request (PCIe r5.0, sec 2.3.2)).
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
