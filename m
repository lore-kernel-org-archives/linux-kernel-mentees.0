Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0AB7C433FE
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  8 Dec 2021 19:25:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8761C4091D;
	Wed,  8 Dec 2021 19:25:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cZes9uZ_1-wS; Wed,  8 Dec 2021 19:25:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id CA0FB408FA;
	Wed,  8 Dec 2021 19:25:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A5FFAC002F;
	Wed,  8 Dec 2021 19:25:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4B6B4C0012
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  8 Dec 2021 19:25:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 395C460B94
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  8 Dec 2021 19:25:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sF1eENB9sIBu
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  8 Dec 2021 19:25:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 27E0160B8D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  8 Dec 2021 19:25:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 20B41CE22BB;
 Wed,  8 Dec 2021 19:25:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD8FFC00446;
 Wed,  8 Dec 2021 19:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638991502;
 bh=oSILA5JRSWyhwLLRJf0zlbR7eHgbv9S0Wl5DNCBoeJk=;
 h=From:To:Cc:Subject:Date:From;
 b=QwBVXpu2zThzLZ9ZvmcOFQCW4j663oc7ofJUxIBabGfhpWwOWSOlffUtk+fVU7WQI
 wK67+yKRopTuOorBSrCEmdOD3OZzjnNvNLYcITIoYWWbFZyu35u77JzwiJAAS6ODy5
 j/XJk/PUzKaszscbXyE9/8LehzuLvZR4wAN4gP12Aa5wZ4L4MB5Lil8IlCvHsIix78
 XQ0NLdvvtaVPkf+342UFGQ6gaN9jcdFY7OWyryPpP6gS+hnDzuX7RAqBQrS0+DKNqQ
 0v5a9IrOJamud6AVzFQibkcWuxPHcF3YG9XCfjvH3YW+FY3FwE5PPkJ6xWtgcy1N14
 umdwcdgl4zATQ==
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jens Axboe <axboe@kernel.dk>, Joshua Morris <josh.h.morris@us.ibm.com>,
 Philip Kelleher <pjk1939@linux.ibm.com>
Subject: [PATCH v5 0/4] block: convert to generic power management
Date: Wed,  8 Dec 2021 13:24:45 -0600
Message-Id: <20211208192449.146076-1-helgaas@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, linux-pci@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>,
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

From: Bjorn Helgaas <bhelgaas@google.com>

This is a repost of patches from Vaibhav to convert from legacy PCI power
management to generic power management.  The most recent posting is here:

  https://lore.kernel.org/all/20210114115423.52414-1-vaibhavgupta40@gmail.com/

Vaibhav has converted around 180 drivers to generic power management, and
over 100 of those conversions have made it upstream.  If we can finish off
the remaining ones, we'll be able to remove quite a bit of ugly legacy code
from the PCI core.

I updated the commit logs to try to make it easier to verify these.

I also added a couple trivial mtip32xx cleanup patches in the same area and
changed the rsxx patch to completely drop the PM ops since the driver
doesn't support PM at all.

Bjorn Helgaas (3):
  mtip32xx: remove pointless drvdata checking
  mtip32xx: remove pointless drvdata lookups
  rsxx: Drop PCI legacy power management

Vaibhav Gupta (1):
  mtip32xx: convert to generic power management

 drivers/block/mtip32xx/mtip32xx.c | 86 ++++++++-----------------------
 drivers/block/rsxx/core.c         |  7 ---
 2 files changed, 22 insertions(+), 71 deletions(-)

-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
