Return-Path: <SRS0=tsT7=6J=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	TVD_SUBJ_WIPE_DEBT,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82ED7C55185
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 25 Apr 2020 07:16:56 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 411E420728
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 25 Apr 2020 07:16:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L3UMABgw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 411E420728
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 175EE85E95;
	Sat, 25 Apr 2020 07:16:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7_JaVx1orDDO; Sat, 25 Apr 2020 07:16:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A5CCF85D54;
	Sat, 25 Apr 2020 07:16:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 83964C1AE8;
	Sat, 25 Apr 2020 07:16:55 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 92104C0175
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 25 Apr 2020 07:16:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 77F8C87858
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 25 Apr 2020 07:16:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i9uZaT1Y-22r
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 25 Apr 2020 07:16:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 6E93B87DF9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 25 Apr 2020 07:16:52 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id z1so4263489pfn.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 25 Apr 2020 00:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TmxpJsxXAhcqB+ToVZExhvip4vVPdz5UbfhJp3pb3Rg=;
 b=L3UMABgw2IoNEe9P7TbrpLCTX54x0TtfWjEnjuGlesuN38ZgnFSoP7xUms5rlb95R1
 2kjj/6rzJQ5AtySZGy/THaz6AagKn6a3KGhuCdpHC+tiwhwyvM/6S1z8pBcYvsJTWf9z
 2lDQfw5X3iumVBkWyjyeUcfL36wTd3rXFT+4gE3H/mT6lBUhIgxLiInlqEoXthI7KeEt
 6YxxQssHVi6HhPMw7YIZ8TXxVCck+yC8CgT0XWNkBxViTV46NAo43wQlG6G8BpnwZWBC
 bN0CnsSyO1ZlL/MI31lLg4GG+aPguIxf7lPxEew7bn5Jf+0njlVv9Cn3FSFWPx5IzLhG
 vkkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TmxpJsxXAhcqB+ToVZExhvip4vVPdz5UbfhJp3pb3Rg=;
 b=qBha4gEqfr8jhPSzreektvQ0KKrOHjb4Eq6Cd6iSfjkC5EbHIZknuVqqsV9pDpspBs
 tZPXrB7eiV1Cv6cMN3w9PHFFn/zzW0++lDXWbvkWMuwcwRu7NqCG35w9HUj0GM1zqMFv
 5nN4BR9F8xU7vk7ggLXA+a9+7UO+oY310lSmUHra12fjh17MzjB3J2PQbxsUvpCmEbV9
 5h+ByIhkOuIawgqsD7kASX+SBboWW92y4xjhSQJFQyEqwDUzZo94W8HdcLHaI4ZaqwUI
 4hNpaNKvhsic61jsrWhM1dCdBeesgbSA+FUkTHUeX8mNTdA4xUOAiu8/8PFmBk8T7kRA
 bpRQ==
X-Gm-Message-State: AGi0PuZIDasGHZAK2dcqWiKQ0cr4fruk/y8bWKvJxRWlPKtudDERyRLS
 AIKkVg2G4SEtoBTbMa00n+2UX77XkBY=
X-Google-Smtp-Source: APiQypIRgDYp446rQ6xLwtSozoiSArK3gS1klN5XNI34EiGZbQhhnPoHSuACG5uqpOdsT8B/iMa+0g==
X-Received: by 2002:a63:5c06:: with SMTP id q6mr12629591pgb.187.1587799011434; 
 Sat, 25 Apr 2020 00:16:51 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.152.47])
 by smtp.gmail.com with ESMTPSA id x13sm6668365pgh.63.2020.04.25.00.16.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Apr 2020 00:16:50 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: linux-kernel-mentees@lists.linuxfoundation.org, bjorn@helgaas.com,
 skhan@linuxfoundation.org, rjw@rjwysocki.net
Date: Sat, 25 Apr 2020 12:45:55 +0530
Message-Id: <20200425071557.84850-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Cc: Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v2 0/2] realtek ethernet : remove
	legacy power management callbacks.
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

The purpose of this patch series is to remove legacy power management callbacks
from realtek ethernet drivers.

The callbacks performing suspend() and resume() operations are still calling
pci_save_state(), pci_set_power_state(), etc. and handling the powermanagement
themselves, which is not recommended.

The conversion requires the removal of the those function calls and change the
callback definition accordingly.

Vaibhav Gupta (2):
  realtek/8139too: Remove Legacy Power Management
  realtek/8139cp: Remove Legacy Power Management

 drivers/net/ethernet/realtek/8139cp.c  | 25 +++++++------------------
 drivers/net/ethernet/realtek/8139too.c | 26 +++++++-------------------
 2 files changed, 14 insertions(+), 37 deletions(-)

-- 
2.26.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
