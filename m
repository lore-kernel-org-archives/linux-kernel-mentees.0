Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C75C5C433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  8 Dec 2021 20:02:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62DB860BA1;
	Wed,  8 Dec 2021 20:02:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LMgUKz8U-qoQ; Wed,  8 Dec 2021 20:02:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 8B76460651;
	Wed,  8 Dec 2021 20:02:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 44DB1C002F;
	Wed,  8 Dec 2021 20:02:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 43B96C0012
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  8 Dec 2021 20:02:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 30DBA81020
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  8 Dec 2021 20:02:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ErZfet8l99ZY
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  8 Dec 2021 20:02:46 +0000 (UTC)
X-Greylist: delayed 00:07:33 by SQLgrey-1.8.0
Received: from gir.skynet.ie (gir.skynet.ie [193.1.99.77])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3F16080FBC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  8 Dec 2021 20:02:45 +0000 (UTC)
Received: from skynet-temp.skynet.ie (unknown [193.1.99.76])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by gir.skynet.ie (Postfix) with ESMTPS id 95B95101BD;
 Wed,  8 Dec 2021 19:55:08 +0000 (GMT)
Date: Wed, 8 Dec 2021 19:55:08 +0000 (UTC)
From: Dave Airlie <airlied@linux.ie>
X-X-Sender: airlied@skynet-temp.skynet.ie
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH v3 0/3] agp: convert to generic power management
In-Reply-To: <20211208193305.147072-1-helgaas@kernel.org>
Message-ID: <alpine.DEB.2.20.2112081942330.32242@skynet-temp.skynet.ie>
References: <20211208193305.147072-1-helgaas@kernel.org>
User-Agent: Alpine 2.20 (DEB 67 2015-01-07)
MIME-Version: 1.0
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
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


On Wed, 8 Dec 2021, Bjorn Helgaas wrote:

> From: Bjorn Helgaas <bhelgaas@google.com>
> 
> Vaibhav has converted around 180 drivers to generic power management, and
> over 100 of those conversions have made it upstream.  If we can finish off
> the remaining ones, we'll be able to remove quite a bit of ugly legacy code
> from the PCI core.
> 
> This is a repost of Vaibhav's patches for AGP.  I rebased them to v5.16-rc1
> and updated the commit logs to try to make it easier to verify them.
> 
> In the most recent posting here:
> 
>   https://lore.kernel.org/linux-pci/20211201025419.2797624-1-helgaas@kernel.org/
> 
> my commit log updates were incorrect.  This v3 has updates that I believe
> to be correct, but of course I'd be grateful for more corrections.

Hi Bjorn,

Do you want to merge these via your tree?

if so,
Acked-by: Dave Airlie <airlied@redhat.com>

Dave.

> 
> Vaibhav Gupta (3):
>   amd64-agp: convert to generic power management
>   sis-agp: convert to generic power management
>   via-agp: convert to generic power management
> 
>  drivers/char/agp/amd64-agp.c | 24 ++++++------------------
>  drivers/char/agp/sis-agp.c   | 25 ++++++-------------------
>  drivers/char/agp/via-agp.c   | 25 +++++--------------------
>  3 files changed, 17 insertions(+), 57 deletions(-)
> 
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
