Return-Path: <SRS0=A5MH=7A=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 359A0C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 18 May 2020 15:03:17 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3086207D4
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 18 May 2020 15:03:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CYFJWDsE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3086207D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id BE9348861F;
	Mon, 18 May 2020 15:03:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wrvuTESAxQag; Mon, 18 May 2020 15:03:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5337C87FEA;
	Mon, 18 May 2020 15:03:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 43B49C0881;
	Mon, 18 May 2020 15:03:16 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 55E5DC07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 May 2020 15:03:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 4556187658
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 May 2020 15:03:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FhScO7n5nq1k
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 May 2020 15:03:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by whitealder.osuosl.org (Postfix) with ESMTPS id A5A498768A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 May 2020 15:03:13 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id k7so5351654pjs.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 May 2020 08:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4vTekQhuHY9lAKdz6m7oQYFi8rFTF9tZZ83Zd0IQ7ww=;
 b=CYFJWDsEfiOaifGK1CWOjBUftQG5AWCsi4chqbFA4LLQBF4m8PKAezQ6Hf7gCXefKU
 7r+NcfdAS2zznOiR3Tkkrfe9979ZSei5IRDgT2+0CvB25rYuewUoDttmpo/4GiBMe6lh
 YFSf6AZ4dDQZKom1umIdhs+pJFFDx+8MpWRAl1PyoDKcD56iAW2MBLGx8AU126aE3Ldf
 f59taMLSyjDCq6ohz0/n40ZM4nndndCrERtWQ7h9pd4ZF+OcnNc8pXuJheY2hWz9V6Q6
 UrzNxU1SrjzHCtzOJNvTnxeXmeg+jDGAUzZ8djSsCNA+I4BEDo+sLhUq0G44zVLdCcqs
 DHrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4vTekQhuHY9lAKdz6m7oQYFi8rFTF9tZZ83Zd0IQ7ww=;
 b=sivJJGizwXBbBjNlxGk/bKFAbX5cFLMATiechsnWGCxbxL4a8Oaw+B1IXb41MGJIxg
 KQRmTnYviYPnTPAJOHY7W1LH++cf0nwunYCHjpnEARXAkB3rpufYE31/eiOrJcZ5N4C/
 IWUlR43+kI/vZ4dbPl/1pcTrZLfnvtHkM7G/D6ZWsw55nEyGtDwviCx9+VcspHi0gPjl
 Q8JEhvtOuD7yY3HWqp1LR4Z20ZSSKQ4NbVnlT1cb/rLuAAuVRSgX+asDz8zHDLbeLdZM
 lA0A+ppCh7y3DbzgG1DpUtHszs7oJQ9NfTgn7EUMZpbxEntBzEUwsyiKns1LaKSOWWl3
 K2FQ==
X-Gm-Message-State: AOAM532Ntdgdn8rNwt/dpHgXzzNXJHP8klfULsPdDNsym4vKgBuiyUv5
 LtVJ5Ikni3kDJ/qWdGdr+m8=
X-Google-Smtp-Source: ABdhPJwFZCQ71Tc10vG0Uf9SapqrNelBOBekbF1rdtm4LN/rq6dbbqi5HLKbSGohd2YBQZ0G8bym3g==
X-Received: by 2002:a17:90a:950d:: with SMTP id
 t13mr21093885pjo.102.1589814193156; 
 Mon, 18 May 2020 08:03:13 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.152.209])
 by smtp.gmail.com with ESMTPSA id k1sm7963142pgh.78.2020.05.18.08.03.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2020 08:03:11 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Heiner Kallweit <hkallweit1@gmail.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>, netdev@vger.kernel.org,
 Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 bjorn@helgaas.com, linux-kernel-mentees@lists.linuxfoundation.org,
 rjw@rjwysocki.net, "David S . Miller" <davem@davemloft.net>
Date: Mon, 18 May 2020 20:32:12 +0530
Message-Id: <20200518150214.100491-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Cc: linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH net-next v3 0/2] realtek ethernet :
	use generic power management.
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

All Changes are compile-tested only.

Vaibhav Gupta (2):
  realtek/8139too: use generic power management
  realtek/8139cp: use generic power management

 drivers/net/ethernet/realtek/8139cp.c  | 25 ++++++++-----------------
 drivers/net/ethernet/realtek/8139too.c | 26 +++++++-------------------
 2 files changed, 15 insertions(+), 36 deletions(-)

-- 
2.26.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
