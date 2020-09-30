Return-Path: <SRS0=42xI=DH=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 542E4C47425
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 30 Sep 2020 14:18:30 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C693020709
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 30 Sep 2020 14:18:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VGn/rFmL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C693020709
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 61B4081FEE;
	Wed, 30 Sep 2020 14:18:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nji8VYNM9OL7; Wed, 30 Sep 2020 14:18:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1E6E781FA0;
	Wed, 30 Sep 2020 14:18:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0AA16C016F;
	Wed, 30 Sep 2020 14:18:28 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1B84AC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 14:18:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 05E5E8700F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 14:18:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2qUwLTWsChQl
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 14:18:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 8727F8719E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 14:18:26 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id jw11so1048279pjb.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 07:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TwJdx0lIfhHir6Nqx17GvuwpEA6xq9365oCpCop+vGs=;
 b=VGn/rFmLYPyMEMwlJDY0UTwwEY0T48qfEF3k+SblEi1HXQFUc4gB314tq8+0SCK+ty
 +0qmpjsXwfWbRflf2ym2DBnbqiIaJnJdj1fqwwQ8Obl9Hn+PpXhvl2ccyZDFSN0KxVrl
 0wYcNfXqPQS7NB7QPRT7LnEGHXxRUOVS/l7BLECFMP4PIF7uhstzuYY1IpaGE0iczKhx
 Y0H5RhMs04NrIMJaG1HYIGK7JiUk4AAIBUvvjN7j4xaRBSX5T78mFLKCT7Ss4GPwJy6a
 /OYW5BFqpPECa8BfLJEFm/m+yMknHQcZZP72LylqFoHHhQ4o6Sm2v1v/0SWMUiAbTLVP
 0zeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TwJdx0lIfhHir6Nqx17GvuwpEA6xq9365oCpCop+vGs=;
 b=EzYg8cjehOYXqu16XOxZM6/pn/L57Ik16hmqJ2aYuyrOtsqdjJYplG6YT2/hPuX/qp
 wLnJYwlwaqB/UkSVosHslIRnGMLauEq4OGIua0lqWYPRNV6vxjrjMOeSwMmO8s25T0VE
 9phxiXsaBcBKXX+mSb9+mvpo2hDwl2C/Mt3s508KlFZdU1dZeoJPExHL8mEIuElq01jp
 nP3eqxYivcH9l73CI8zvim80OrvSL01D1v2onh35TNEbh+RvUn0DHXF56v63kbONpa5V
 HE9UiMI9roAJZkZqqF0hd2bWV7No0HBWRowxcopB/nkTZa64ROpbqi0E7jEzqAeuPONz
 n8iw==
X-Gm-Message-State: AOAM531q9X/Qpb3dV43zlb9vCnC/6MHegEKegd+eRopyakGal5mkwmPp
 7smUtAam8r4kZHoUxd8K5R0=
X-Google-Smtp-Source: ABdhPJyU3iDeeonfLrCyZS8ZegFFDuTux5IsDvMQ8QoTTjVYYmJpmE38dykd4LCzMzGk2yDNKMIRRA==
X-Received: by 2002:a17:90a:d18b:: with SMTP id
 fu11mr2678375pjb.203.1601475505953; 
 Wed, 30 Sep 2020 07:18:25 -0700 (PDT)
Received: from localhost.localdomain ([45.118.167.204])
 by smtp.googlemail.com with ESMTPSA id 34sm2460770pgp.5.2020.09.30.07.18.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2020 07:18:24 -0700 (PDT)
From: Anmol Karn <anmol.karan123@gmail.com>
To: marcel@holtmann.org,
	johan.hedberg@gmail.com
Date: Wed, 30 Sep 2020 19:48:13 +0530
Message-Id: <20200930141813.410209-1-anmol.karan123@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200929173231.396261-1-anmol.karan123@gmail.com>
References: <20200929173231.396261-1-anmol.karan123@gmail.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org,
 syzbot+0bef568258653cff272f@syzkaller.appspotmail.com,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, kuba@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, davem@davemloft.net
Subject: [Linux-kernel-mentees] [PATCH] net: bluetooth: Fix null pointer
	dereference in hci_event_packet()
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

AMP_MGR is getting derefernced in hci_phy_link_complete_evt(), when called from hci_event_packet() and there is a possibility, that hcon->amp_mgr may not be found when accessing after initialization of hcon.

- net/bluetooth/hci_event.c:4945
The bug seems to get triggered in this line:

bredr_hcon = hcon->amp_mgr->l2cap_conn->hcon;

Fix it by adding a NULL check for the hcon->amp_mgr before checking the ev-status.

Fixes: d5e911928bd8 ("Bluetooth: AMP: Process Physical Link Complete evt")
Reported-and-tested-by: syzbot+0bef568258653cff272f@syzkaller.appspotmail.com 
Link: https://syzkaller.appspot.com/bug?extid=0bef568258653cff272f 
Signed-off-by: Anmol Karn <anmol.karan123@gmail.com>
---
Change in v3:
  - changed return o; to return; (Reported-by: kernel test robot <lkp@intel.com>
)

 net/bluetooth/hci_event.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
index 4b7fc430793c..bbe0ca42cad2 100644
--- a/net/bluetooth/hci_event.c
+++ b/net/bluetooth/hci_event.c
@@ -4936,6 +4936,11 @@ static void hci_phy_link_complete_evt(struct hci_dev *hdev,
 		return;
 	}
 
+	if (!hcon->amp_mgr) {
+		hci_dev_unlock(hdev);
+		return;
+	}
+
 	if (ev->status) {
 		hci_conn_del(hcon);
 		hci_dev_unlock(hdev);
-- 
2.28.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
