Return-Path: <SRS0=CGmO=AO=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20A01C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  3 Jul 2020 03:03:10 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA82F20890
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  3 Jul 2020 03:03:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZV3DqdoA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA82F20890
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 9316725492;
	Fri,  3 Jul 2020 03:03:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AEd-4mzGrTNT; Fri,  3 Jul 2020 03:03:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 997CF25E4C;
	Fri,  3 Jul 2020 03:03:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7F937C0888;
	Fri,  3 Jul 2020 03:03:06 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AA81AC0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  3 Jul 2020 03:03:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 7AA9825CFB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  3 Jul 2020 03:03:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VJ8tG1EAFhuf
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  3 Jul 2020 03:03:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by silver.osuosl.org (Postfix) with ESMTPS id A508A25492
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  3 Jul 2020 03:03:03 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id f3so14446107pgr.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 02 Jul 2020 20:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Pvp5GqQnObwsM2WQjJTtbVs7GSQZ7G4lQMiDZtzgLT0=;
 b=ZV3DqdoAbv0sFGAPIy2vkGDpPQM3nJTjXxSxp1azMqqhWwEFZ4MNgt6imgmKYn5em9
 I//8hxGOtjnFDUE87+sSiEPaqAZBuo1MA3v5wIJEkoKRw2uCndE3p0nq94bDdxm4GhAZ
 NIYLUq7Jb8NgNXvScBQUQn8HhKRwuhU085HiMk/G+Z+0GtfDsbGK5V+Nhq4O+r7Wv6WO
 3/Xdt/7xjKCGo0FyRtZ9AVsEbouMwK2gBxWlv9zi9XVjf/u99YBtc0DAUFdQ5fjkX1V7
 dnerw5o3FWksd0dsim81SKJkQu6qVj+pHFJgBMjFYxuuKn1G1aJm8sVPbNZycGvysmLF
 fBzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Pvp5GqQnObwsM2WQjJTtbVs7GSQZ7G4lQMiDZtzgLT0=;
 b=m2ty9XhbRnj3Ice95L1rk5FMfmY7vgkLafvGBOReIUub4M8CtXlggjphaDjHtPY2pZ
 dxMx0dAXDBK0s0OlymPNMVklfmEK4AiqaMGRuFjUZtrdEQZYoEW0fXdklS+sOtgE3Eut
 CGtxVS/d2KOWil6vaqp4LgxQilFWFnEUGro/pJyMkSgxLlzYId65ltpBqGq0+BS0cjc/
 tkOluYkJ+VpocWp7yw8uF24Q1EwlqBOrT7qNLyv3SKBC6nPTDT02vjT//I77Wtbto9aM
 d+ZUslX/ySmvCC2rti7kWTnhOZ7EeClgPFrsTFxVd3/lZTdHRY3YextCMPDRv1U1wvbJ
 qsgg==
X-Gm-Message-State: AOAM531WhqAJii4QyN2pz6MxR0NNjEWwMBz+Q+wfUKmWsmOy58AGV2is
 ndmT6gboULZQCM+KPkEHAIg=
X-Google-Smtp-Source: ABdhPJxqzBmZHDywKghAsAeSDH/TwjeYkBmOSJz/G1Ubh82iVyKdl/rlDNKTcaA6NcZxDscaEEpD3A==
X-Received: by 2002:a63:5821:: with SMTP id m33mr27669386pgb.43.1593745383084; 
 Thu, 02 Jul 2020 20:03:03 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.57])
 by smtp.gmail.com with ESMTPSA id h194sm9903223pfe.201.2020.07.02.20.02.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2020 20:03:02 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 bjorn@helgaas.com, Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Steve Glendinning <steve.glendinning@shawell.net>
Date: Fri,  3 Jul 2020 08:31:36 +0530
Message-Id: <20200703030138.25724-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v2 0/2] smsc: use generic power
	management
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

Linux Kernel Mentee: Remove Legacy Power Management.

The purpose of this patch series is to remove legacy power management callbacks
from smsc ethernet drivers.

The callbacks performing suspend() and resume() operations are still calling
pci_save_state(), pci_set_power_state(), etc. and handling the power management
themselves, which is not recommended.

The conversion requires the removal of the those function calls and change the
callback definition accordingly and make use of dev_pm_ops structure.

All patches are compile-tested only.

V2: Kbuild in V1, warning: variable 'err' is used uninitialized whenever 'if'
conditio is false in funcution .resume() .

Vaibhav Gupta (2):
  epic100: use generic power management
  smsc9420: use generic power management

 drivers/net/ethernet/smsc/epic100.c  | 19 +++++--------
 drivers/net/ethernet/smsc/smsc9420.c | 40 ++++++++--------------------
 2 files changed, 17 insertions(+), 42 deletions(-)

-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
