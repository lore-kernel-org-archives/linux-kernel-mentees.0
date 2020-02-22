Return-Path: <SRS0=qNNM=4K=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ECB4C35672
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 Feb 2020 17:20:22 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14EAC20702
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 Feb 2020 17:20:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AhvXtgXr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 14EAC20702
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D9E5985625;
	Sat, 22 Feb 2020 17:20:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2BMPFEUER457; Sat, 22 Feb 2020 17:20:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 777428560E;
	Sat, 22 Feb 2020 17:20:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6AA1BC1AE2;
	Sat, 22 Feb 2020 17:20:21 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 000C6C013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Feb 2020 17:20:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id E05EB85A90
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Feb 2020 17:20:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rGwSLb032rio
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Feb 2020 17:20:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 462068628E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Feb 2020 17:20:19 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id b22so2200784pls.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Feb 2020 09:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=76mGlpp6BFJSmPDHJW6kprv/8C2HQ3fa7ORMT87pipU=;
 b=AhvXtgXr8v/7hcsVNalXOtAMxUQGg+OE/SI9/59KpjrJJKTzdFu6gUOq/LuJRpqBY0
 FYwSgXktGDhXnxJhU2U90NIxa+7RN66/jwTwRNLQhjLZWDu4ngBO04tPrP5ZGeqWwsa4
 Sby6zAhTXe+ZJh0Ro82a7S+HR0pUgR6wT4d0onSlnyKCWfcSG35Jr22+4olJ7iiexMQx
 qFkGQxPKNG65rZfE0ngObnTGSx4jRB2mrHaLqMMerAIcn3pm+dOIofsrj0NE5RO03RW+
 OcXxr6GO++1LxMqSozC0UQxPEgpBW2CNB/gtyo6QKlW3lwjmFII7A9faa5wJet69n5lo
 6yGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=76mGlpp6BFJSmPDHJW6kprv/8C2HQ3fa7ORMT87pipU=;
 b=JBDI+1rxLXHaBj1eGHfFHOhSk9H+A0myi6ZxoebIpZdCCIzlnrhE2vLbpxjg1iQR3h
 aIQRKx1ynwe9VmW3ffSp2zva3lZm2sOH1UPx5BwoHSucqPyLSNq8iOk32do/1Bw229Jy
 zZg1KCKsGBJ3GpwT3I2ZTpAISY1WsRH/IaB0wGbM9eLYdqReqevbFpyop9P/5sfMIVlp
 yYyNCueJyJFC576fW+Z58oOL4K3bfNfQIkLzGur80tqFyIkW2XGFo1gS7bXVixPaVd6U
 klxxmMlV3IiAlJuyuavsqjYSlqPol+DCKePshFEx6FhBUDmhFtyPeHkt5rAnqu+XlqAl
 n85Q==
X-Gm-Message-State: APjAAAVFHw0SlYl5jMBX2MF8YLuDEOFRzZReMhtBY1XD2Qr6ItdWnpFC
 2345p5m2oFjXI6vOdRIgG8g=
X-Google-Smtp-Source: APXvYqw9ScUK576eJpHRzjT0V+dYpENY1q/4Limxa/EmkHyr08VAeeRcRXsUX3jm2jzFKbuhC3jelw==
X-Received: by 2002:a17:90a:ca12:: with SMTP id
 x18mr10118744pjt.66.1582392018775; 
 Sat, 22 Feb 2020 09:20:18 -0800 (PST)
Received: from localhost.localdomain ([103.87.57.201])
 by smtp.googlemail.com with ESMTPSA id o19sm10305622pjr.2.2020.02.22.09.20.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Feb 2020 09:20:18 -0800 (PST)
From: Amol Grover <frextrite@gmail.com>
To: James Morris <jmorris@namei.org>,
	"Serge E . Hallyn" <serge@hallyn.com>
Date: Sat, 22 Feb 2020 22:49:39 +0530
Message-Id: <20200222171938.14339-1-frextrite@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Cc: "Paul E . McKenney" <paulmck@kernel.org>, linux-kernel@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>,
 linux-security-module@vger.kernel.org, Joel Fernandes <joel@joelfernandes.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] device_cgroup: Fix RCU list
	debugging warning
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

exceptions may be traversed using list_for_each_entry_rcu()
outside of an RCU read side critical section BUT under the
protection of decgroup_mutex. Hence add the corresponding
lockdep expression to fix the following false-positive
warning:

[    2.304417] =============================
[    2.304418] WARNING: suspicious RCU usage
[    2.304420] 5.5.4-stable #17 Tainted: G            E
[    2.304422] -----------------------------
[    2.304424] security/device_cgroup.c:355 RCU-list traversed in non-reader section!!

Signed-off-by: Amol Grover <frextrite@gmail.com>
---
 security/device_cgroup.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/security/device_cgroup.c b/security/device_cgroup.c
index 7d0f8f7431ff..b7da9e0970d9 100644
--- a/security/device_cgroup.c
+++ b/security/device_cgroup.c
@@ -352,7 +352,8 @@ static bool match_exception_partial(struct list_head *exceptions, short type,
 {
 	struct dev_exception_item *ex;
 
-	list_for_each_entry_rcu(ex, exceptions, list) {
+	list_for_each_entry_rcu(ex, exceptions, list,
+				lockdep_is_held(&devcgroup_mutex)) {
 		if ((type & DEVCG_DEV_BLOCK) && !(ex->type & DEVCG_DEV_BLOCK))
 			continue;
 		if ((type & DEVCG_DEV_CHAR) && !(ex->type & DEVCG_DEV_CHAR))
-- 
2.24.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
