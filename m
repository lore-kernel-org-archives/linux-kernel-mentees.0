Return-Path: <SRS0=TljZ=NE=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B37A3C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 13 Aug 2021 18:26:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6808160EE5
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 13 Aug 2021 18:26:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6808160EE5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=anirudhrb.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30B3880DC0;
	Fri, 13 Aug 2021 18:26:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DlwUjGPpbXlE; Fri, 13 Aug 2021 18:26:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 6EBE980D68;
	Fri, 13 Aug 2021 18:26:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 51345C001A;
	Fri, 13 Aug 2021 18:26:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 93BA9C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Aug 2021 18:26:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 70B1340332
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Aug 2021 18:26:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=anirudhrb.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lmUz_FcA1fHz
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Aug 2021 18:25:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from sender4-of-o53.zoho.com (sender4-of-o53.zoho.com
 [136.143.188.53])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EC10A40310
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Aug 2021 18:25:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1628879154; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=bYgkrCYH3zK1URagQJNPlg4+VcLfq0KJccQfLnwyZnjlV/3AxyRI7q+UsEXfBin2Hag2ZroytsC6rPWr9Yd9fKDiSIFaMMpxHO6Ndd9x/lI0r0x9KFm2xFpCNqkfHlTcAKOLSu5t+P4wDBB73ZtZwXLSipse67u10y9SUtDs9F8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1628879154;
 h=Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
 bh=rkqSpWHxcNT/08FBNlrWnc/fZ2fr1FYNDLTrn31DMZQ=; 
 b=hqIJ9XxypZJEx9jiCqkUHEUszFzD7XeBfBlH21R79cM39tUBibHAPS3XxSdXqOWdXAPmAkkEow/W8j957jn2YB/QAoOFezIQ+IcEVrjs2TFZYwm9fvzSaN8y6CXqeLVKVjyteHwpDxLVAI8amggPaZTfJIqAAx/depfeuH06AsQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=anirudhrb.com;
 spf=pass  smtp.mailfrom=mail@anirudhrb.com;
 dmarc=pass header.from=<mail@anirudhrb.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1628879154; 
 s=zoho; d=anirudhrb.com; i=mail@anirudhrb.com;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Transfer-Encoding;
 bh=rkqSpWHxcNT/08FBNlrWnc/fZ2fr1FYNDLTrn31DMZQ=;
 b=c1aVd0NrxSmSMveT+CySdY+OEKffw4HIGfQ1rJdrgqMjgwXsMWQKiaYnAH9oaBeh
 CG5pyDBhf7DqR8nrzA2X1fO0PoB2ymU6h/nvs1fCFyKAIVjYFBifZboD2Zel5wb7zY2
 v5mipADKXImlrYTwxdhYvX3pbkUzrxd9/9tkuLvk=
Received: from localhost.localdomain (49.207.58.140 [49.207.58.140]) by
 mx.zohomail.com with SMTPS id 1628879151987781.9431947578596;
 Fri, 13 Aug 2021 11:25:51 -0700 (PDT)
From: Anirudh Rayabharam <mail@anirudhrb.com>
To: valentina.manea.m@gmail.com, shuah@kernel.org, gregkh@linuxfoundation.org
Subject: [PATCH v3 0/2] Fix syzkaller bug: hung task in hub_port_init
Date: Fri, 13 Aug 2021 23:55:06 +0530
Message-Id: <20210813182508.28127-1-mail@anirudhrb.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-ZohoMailClient: External
Cc: linux-kernel-mentees@lists.linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
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

This series fixes the hung task bug in hub_port_init reported by
syzkaller at:

https://syzkaller.appspot.com/bug?id=08f12df95ae7da69814e64eb5515d5a85ed06b76

The first patch in the series fixes the issue and the second patch does
some refactoring to avoid duplicate code.

Changes in v3:
- Split the patch into two patches
- Remove the convenience wrappers as suggested by Shuah
- Remove the WARN as suggested by Greg

Changes in v2:
Use WARN_ON() instead of BUG() when unlink_list is neither unlink_tx nor
unlink_rx.
v2: https://lore.kernel.org/lkml/20210806181335.2078-1-mail@anirudhrb.com/

v1: https://lore.kernel.org/lkml/20210806164015.25263-1-mail@anirudhrb.com/

Anirudh Rayabharam (2):
  usbip: give back URBs for unsent unlink requests during cleanup
  usbip: eliminate duplicate code in vhci_device_unlink_cleanup

 drivers/usb/usbip/vhci_hcd.c | 31 ++++++++++++++++++-------------
 1 file changed, 18 insertions(+), 13 deletions(-)

-- 
2.26.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
