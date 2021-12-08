Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2C30C433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  8 Dec 2021 19:33:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5890E8275A;
	Wed,  8 Dec 2021 19:33:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x-bz4FdeIjW6; Wed,  8 Dec 2021 19:33:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 5808E82813;
	Wed,  8 Dec 2021 19:33:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3BA89C002F;
	Wed,  8 Dec 2021 19:33:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E0F71C0012
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  8 Dec 2021 19:33:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CADE360B99
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  8 Dec 2021 19:33:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pP4tqMB7h30Q
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  8 Dec 2021 19:33:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D001860B94
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  8 Dec 2021 19:33:21 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id ABD90CE2142;
 Wed,  8 Dec 2021 19:33:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 651CDC341C7;
 Wed,  8 Dec 2021 19:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638991997;
 bh=oDjg3WZFbjc9s4BCNu9jYA1XTiqP2A+Ud1hq6kK3QZc=;
 h=From:To:Cc:Subject:Date:From;
 b=GCuXTRFOhr0ZtgOZs+KKJKO8fcDtj2LiVC4ZabdxyT6HmoZsdhcM17Q6Z/FrZ1let
 dZ4aVswVERKPAkcOVqq0JnNx4e644M4cRt024zTuXfhcYiI5JATbwTp86y3iDiDmrs
 VwBCGNokrczzwx03Gbo0tbM6OQUtXpYIRzTZ0tSvd456eNg5GFC3LNUitlZZ+8j7rK
 l+ogcOtBlpeW7bsfH/RFQAIxMnMl6cKySziE+QOS9RFUq/7aLoP6jrIGRQM5Z9e4hL
 BXOVRDcCnwH6ypDhuDqpM0wtIiBmHcWKhFdXBycGUn54M7AVcKKm09ySK5qZz5TT2X
 RuNZH0UbTpZQw==
From: Bjorn Helgaas <helgaas@kernel.org>
To: David Airlie <airlied@linux.ie>
Subject: [PATCH v3 0/3] agp: convert to generic power management
Date: Wed,  8 Dec 2021 13:33:02 -0600
Message-Id: <20211208193305.147072-1-helgaas@kernel.org>
X-Mailer: git-send-email 2.25.1
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

From: Bjorn Helgaas <bhelgaas@google.com>

Vaibhav has converted around 180 drivers to generic power management, and
over 100 of those conversions have made it upstream.  If we can finish off
the remaining ones, we'll be able to remove quite a bit of ugly legacy code
from the PCI core.

This is a repost of Vaibhav's patches for AGP.  I rebased them to v5.16-rc1
and updated the commit logs to try to make it easier to verify them.

In the most recent posting here:

  https://lore.kernel.org/linux-pci/20211201025419.2797624-1-helgaas@kernel.org/

my commit log updates were incorrect.  This v3 has updates that I believe
to be correct, but of course I'd be grateful for more corrections.

Vaibhav Gupta (3):
  amd64-agp: convert to generic power management
  sis-agp: convert to generic power management
  via-agp: convert to generic power management

 drivers/char/agp/amd64-agp.c | 24 ++++++------------------
 drivers/char/agp/sis-agp.c   | 25 ++++++-------------------
 drivers/char/agp/via-agp.c   | 25 +++++--------------------
 3 files changed, 17 insertions(+), 57 deletions(-)

-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
