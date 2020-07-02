Return-Path: <SRS0=sA50=AN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2561EC433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  2 Jul 2020 06:38:10 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2EC12070C
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  2 Jul 2020 06:38:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kPsjRRlw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2EC12070C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id B72808AA59;
	Thu,  2 Jul 2020 06:38:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sZcwFknZeWaR; Thu,  2 Jul 2020 06:38:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4BB8C8AA49;
	Thu,  2 Jul 2020 06:38:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3D716C0865;
	Thu,  2 Jul 2020 06:38:09 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 37C74C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Jul 2020 06:38:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 1DDF5890CE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Jul 2020 06:38:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gQ5P5CuZXpp0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Jul 2020 06:38:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id B74AD890CA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Jul 2020 06:38:06 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id u9so7299177pls.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 01 Jul 2020 23:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XyjnEdFZxF+tDKS9P8wBrY80ec4OJRjyUgQsd0cpcww=;
 b=kPsjRRlwZxwcP4I/Diji+FaejQzGmwkib0r4PN8AiBzHdwIPOxR7YBeqZfwcrT77Qo
 7WgvYpFGKn72xLv4xCfFpP9gAyFfvavwK6jcKKBJjMooeZKK91iq82rl9LHYn2vHM+wu
 5O8uJAg4VFi5iyDh0sZBjd1HfqYyjf5HhPsLt0GSL5EkLWjKBvEGHgpCiKWXVOePM319
 7h+OcTPC93YVzYZVY2JIBCYt7qB7uNmF5tEeYRN6di8kayaQOb2/UuOyMfhZ3Y3DWaKu
 uLMEoZUvkqMeDB0ZnNuutkEHIQ4B73NzyQYLwSuAt2AvSSgN6VFf/lLoI3uqP2BHC7Tw
 k2BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XyjnEdFZxF+tDKS9P8wBrY80ec4OJRjyUgQsd0cpcww=;
 b=cB2gcEDNLmFFeRxGPbmvBYpBf9x/jsLpV49Z/Wg/NlEvc1r64Qp/2+mYTjJShXRph3
 XhqbLHA/DY/9x79K10u4K7eyGhA7XCviB9Stq7V5Cxbf3ji8m+kJ55lEqLLklh1vLaeL
 K/iQtVhJXFVYxSyykNOuywUCImC/tdQwazKHKFYif+US9eFs6AR48OmKgswp8Vy+JePo
 lxRyKOrV8b8UQwvaNyuVIwOXAsOKC9eMHcnXLsFJMMlj77IsaAqqx8bmjH/Anky1c1y5
 K4dtzNFjoNQQ6HNLqgJJJve4bvlu3RS/9bB0YjO0+W5hulHmkQtTeZCzv9O5vsclYznT
 Re/A==
X-Gm-Message-State: AOAM532WxyEOQzNmJHMMdfSKVA7Ac8yCuiwGhpIH1j8EQyxdJYSVdBwA
 nuKYBWkp/1ZLPbZH3Hk30ZE=
X-Google-Smtp-Source: ABdhPJzupBNpZFCBC2aKsQl7FOtxVyyRwJFpYSwVtclOE1dKRuI2i0q07HrjplUoYPW75RI/d+KYeA==
X-Received: by 2002:a17:90a:ea84:: with SMTP id
 h4mr20199016pjz.128.1593671886197; 
 Wed, 01 Jul 2020 23:38:06 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.57])
 by smtp.gmail.com with ESMTPSA id l12sm7523549pff.212.2020.07.01.23.37.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jul 2020 23:38:05 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 bjorn@helgaas.com, Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Manish Chopra <manishc@marvell.com>, Rahul Verma <rahulv@marvell.com>,
 GR-Linux-NIC-Dev@marvell.com, Shahed Shaikh <shshaikh@marvell.com>
Date: Thu,  2 Jul 2020 12:06:30 +0530
Message-Id: <20200702063632.289959-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v1 0/2] qlogic: use generic power
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
from qlogic ethernet drivers.

The callbacks performing suspend() and resume() operations are still calling
pci_save_state(), pci_set_power_state(), etc. and handling the power management
themselves, which is not recommended.

The conversion requires the removal of the those function calls and change the
callback definition accordingly and make use of dev_pm_ops structure.

All patches are compile-tested only.

Vaibhav Gupta (2):
  netxen_nic: use generic power management
  qlcninc: use generic power management

 .../ethernet/qlogic/netxen/netxen_nic_main.c  | 59 +++++++++----------
 .../net/ethernet/qlogic/qlcnic/qlcnic_hw.c    | 10 +---
 .../net/ethernet/qlogic/qlcnic/qlcnic_main.c  | 33 +++--------
 3 files changed, 37 insertions(+), 65 deletions(-)

-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
