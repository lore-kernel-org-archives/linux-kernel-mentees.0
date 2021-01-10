Return-Path: <SRS0=byAB=GN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29804C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 10 Jan 2021 12:15:39 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82BE2206C1
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 10 Jan 2021 12:15:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 82BE2206C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id DAF91203FF;
	Sun, 10 Jan 2021 12:15:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2Fs4Fmsn61V0; Sun, 10 Jan 2021 12:15:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 0D67C20381;
	Sun, 10 Jan 2021 12:15:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E7A25C0893;
	Sun, 10 Jan 2021 12:15:36 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CB65CC013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 10 Jan 2021 12:15:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id B867986890
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 10 Jan 2021 12:15:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 28HCxwf7PfTM
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 10 Jan 2021 12:15:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 059248685E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 10 Jan 2021 12:15:35 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id j13so8759884pjz.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 10 Jan 2021 04:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=q8foebQUtGdCypSWJHLEUtXdb+11eXd3D5tTzSpdHi4=;
 b=vNDO9XhNgi/jOXglfVW3ZDrJ5XjA2pAAJAQldBivQ6k/3l0t/ppYVQf1WyZRo7D+Hz
 yTpy3C5ucWyI0VaCiJ3riJ2WkfebApRChkHJjaRXPdU5ke5SpEbHFCeXKy7HNxgQUShj
 Nt+veaMh37f22kyJdF49JHLJSIdg/c4QOnhzLsiuIK+51luEOEtYZoJcXLUJE+K2ZsMC
 o4aeb9hdQB7ROZMI/vD85fp5OQ6nfw8rerbgnKqrEYfxbSiU5CNIUAI75M7vsl9i+EPn
 EdBeXtGNzID7aurrJFumDCc6Jd5xLhxXA5eVtcsbroX69D8EM3BcricRUP+a7ANu7Tvd
 X58A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=q8foebQUtGdCypSWJHLEUtXdb+11eXd3D5tTzSpdHi4=;
 b=l9QvcPIdG9xko4sxrxdyfNemt/zOU//Hsau2uIfj5nsgEUhljt58PZ7r0slmn/B1uo
 g4VflUBU6JC6Gnp2fW7arTO6T9ZeVVTJ3s1OToipp3DWs3odNbAOmWWNkKbzQqJVuIiE
 LvDO9x0/dbeSMhJlhDw+6vy6ZF82avitzgWSxAZrxBPK2F6lYYAXsLCh4t+dhLPidzuk
 2LpCAH8N9E+bhzhIMGrGW1XQHjAX/4kC1XBdpNMGBQuphQq4uJHCNpalw4WHrFcxDzmG
 0ZQ9mt+T0jYNwSdkmPFgzzZV1xQ8l7DSpIw+YFgiHTPYtbD2q9rpNityyW6hjsXPz0xr
 KzSw==
X-Gm-Message-State: AOAM530qjPzm2z2mJB7835ltd4P+4erVDIwAjL1BRaCvNN6a/Bqt7ajS
 ZGnvQjEcNjoW/iKU4h6BS0E=
X-Google-Smtp-Source: ABdhPJy2YzfzC41j6G3vg4QRgtbHlF/H61TP8HB26CIho8E4kTDY1jTU3xlowlN1CWMlCMlTo96GgQ==
X-Received: by 2002:a17:902:228:b029:da:6be8:ee22 with SMTP id
 37-20020a1709020228b02900da6be8ee22mr12244804plc.44.1610280934403; 
 Sun, 10 Jan 2021 04:15:34 -0800 (PST)
Received: from localhost.localdomain ([2405:201:600d:a089:381d:ba42:3c3c:81ce])
 by smtp.googlemail.com with ESMTPSA id y5sm10959791pjt.42.2021.01.10.04.15.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jan 2021 04:15:33 -0800 (PST)
From: Aditya Srivastava <yashsri421@gmail.com>
To: linux-wireless@vger.kernel.org
Date: Sun, 10 Jan 2021 17:45:20 +0530
Message-Id: <20210110121525.2407-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <3c121981-1468-fc9d-7813-483246066cc4@lwfinger.net>
References: <3c121981-1468-fc9d-7813-483246066cc4@lwfinger.net>
Cc: pkshih@realtek.com, yashsri421@gmail.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, kuba@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, davem@davemloft.net,
 kvalo@codeaurora.org
Subject: [Linux-kernel-mentees] [PATCH 0/5] rtlwifi: fix bool comparison in
	expressions
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

This patch series fixes the bool comparison in conditional expressions
for all the drivers in rtlwifi.

There are certain conditional expressions in rtlwifi drivers, where a
boolean variable is compared with true/false, in forms such as
(foo == true) or (false != bar), which does not comply with checkpatch.pl
(CHECK: BOOL_COMPARISON), according to which boolean variables should be
themselves used in the condition, rather than comparing with true/false

E.g., in drivers/net/wireless/realtek/rtlwifi/rtl8188ee/dm.c,
"if (mac->act_scanning == true)" can be replaced with
"if (mac->act_scanning)"

Fix all such expressions with the bool variables appropriately for all
the drivers in rtlwifi

* The changes made are compile tested.
* The patches apply perfectly on next-20210108

Aditya Srivastava (5):
  rtlwifi: rtl_pci: fix bool comparison in expressions
  rtlwifi: rtl8192c-common: fix bool comparison in expressions
  rtlwifi: rtl8188ee: fix bool comparison in expressions
  rtlwifi: rtl8192se: fix bool comparison in expressions
  rtlwifi: rtl8821ae: fix bool comparison in expressions

 drivers/net/wireless/realtek/rtlwifi/ps.c                 | 4 ++--
 drivers/net/wireless/realtek/rtlwifi/rtl8188ee/dm.c       | 8 ++++----
 drivers/net/wireless/realtek/rtlwifi/rtl8188ee/hw.c       | 4 ++--
 drivers/net/wireless/realtek/rtlwifi/rtl8192c/dm_common.c | 4 ++--
 drivers/net/wireless/realtek/rtlwifi/rtl8192se/hw.c       | 4 ++--
 drivers/net/wireless/realtek/rtlwifi/rtl8821ae/phy.c      | 8 ++++----
 6 files changed, 16 insertions(+), 16 deletions(-)

-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
