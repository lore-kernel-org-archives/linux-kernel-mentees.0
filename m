Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEFFCEE4982
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 18 Aug 2023 17:37:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B22A615C7;
	Fri, 18 Aug 2023 17:37:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B22A615C7
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=DwiSePEz
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QrLeTnExifcv; Fri, 18 Aug 2023 17:37:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id EB2D460BB5;
	Fri, 18 Aug 2023 17:37:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB2D460BB5
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C71C9C0071;
	Fri, 18 Aug 2023 17:37:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CA6F7C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Aug 2023 17:37:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AC284840B1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Aug 2023 17:37:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC284840B1
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=DwiSePEz
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NRMRqAe0dLOs
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Aug 2023 17:37:10 +0000 (UTC)
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 01556840AE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Aug 2023 17:37:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 01556840AE
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-5657add1073so816561a12.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Aug 2023 10:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692380229; x=1692985029;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YW52+wyDUyO2L5rIdP1Yu5xGuH4Mp8hYAuSlf8LZHvM=;
 b=DwiSePEzdv2Jzdf8G0tfzoEBlouteK03XQFLxNmRdABq75AEyO1/tGBNELJ3TLN7mt
 nPt8KL5cAKVc5BKX30S6+vARVT4wnMWrknfCcKcpS9FsITrtbc7GxHfMWy9At3teawA3
 CgtIuJ9oBog9hBKQW1mWEVLFoixdipsTwxBAJ2s4WeYTM1dYG6grIRlJ62vQvTxd4PIu
 K5Qg55Li9JLIFxS9+MYYAIysbWOPTZZdSHc4pFFwgS+W9lqlYLr6l3Mqd6+j9vj1z8/j
 USUy3nFKBtHYg50KztR968edZMerwqa5/asMwnvpnQjWjk8Slr+qzgCIPoG+hwqxZiYo
 8U3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692380229; x=1692985029;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YW52+wyDUyO2L5rIdP1Yu5xGuH4Mp8hYAuSlf8LZHvM=;
 b=Z0vx+9aZUoBejEBxAMo2B0hOXyj6FT6qGNKZm8eVuH9FAWSvIJlLQue2RKCDBQP0wp
 j1wNr+gotR7tD7ldRIlRtN2rR7tQG37tZDCl3iVLeBiyBMgyoTxZ4+EXJM2fOYaWQdBi
 2WSuEt903UoNs7rfAtFN3flQdijJaEyqZkn0I0Ki3giO2MPS7RAxzUmkYnY6CQwfKfvc
 SukWUQ4nOloP2PcJOLSibLoU+T1GJ8TRkDdzXiDsPAIPc8hZfHTCcKPK2mPIzs104dQS
 p7GSn+8hpCxgA22VcshKaqRxS0uhYFZ5+AzVy/N7xfDeam0EZhZLx/75msRcCwVapOvO
 GKXg==
X-Gm-Message-State: AOJu0Ywjj65o2ScLoREcZ5g7GkQtO31rZPywVduBjcI9jrHm4GYKVdlA
 8GDHMJwJ4sSGGupPfQWJBTY=
X-Google-Smtp-Source: AGHT+IHSa6TLwReCiv37Ufbq5NLyr7Ge9qIPIA+NlyZtg5Togo2BH2TlRRmtDi/ha7A/2yjOEwmN0w==
X-Received: by 2002:a17:90a:31c2:b0:268:8ff2:5c0d with SMTP id
 j2-20020a17090a31c200b002688ff25c0dmr4246579pjf.17.1692380229059; 
 Fri, 18 Aug 2023 10:37:09 -0700 (PDT)
Received: from fanta-System-Product-Name.. ([222.252.65.171])
 by smtp.gmail.com with ESMTPSA id
 1-20020a17090a19c100b00267ae12b80bsm3785031pjj.34.2023.08.18.10.37.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Aug 2023 10:37:08 -0700 (PDT)
From: Anh Tuan Phan <tuananhlfc@gmail.com>
To: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, shuah@kernel.org
Subject: [PATCH v1] selftests/net: Add log.txt and tools to .gitignore
Date: Sat, 19 Aug 2023 00:37:02 +0700
Message-Id: <20230818173702.216265-1-tuananhlfc@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kselftest@vger.kernel.org, Anh Tuan Phan <tuananhlfc@gmail.com>
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

Update .gitignore to untrack tools directory and log.txt. "tools" is
generated in "selftests/net/Makefile" and log.txt is generated in
"selftests/net/gro.sh" when executing run_all_tests.

Signed-off-by: Anh Tuan Phan <tuananhlfc@gmail.com>
---
 tools/testing/selftests/net/.gitignore | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/selftests/net/.gitignore b/tools/testing/selftests/net/.gitignore
index 501854a89cc0..2f9d378edec3 100644
--- a/tools/testing/selftests/net/.gitignore
+++ b/tools/testing/selftests/net/.gitignore
@@ -15,6 +15,7 @@ ip_local_port_range
 ipsec
 ipv6_flowlabel
 ipv6_flowlabel_mgr
+log.txt
 msg_zerocopy
 nettest
 psock_fanout
@@ -45,6 +46,7 @@ test_unix_oob
 timestamping
 tls
 toeplitz
+tools
 tun
 txring_overwrite
 txtimestamp
-- 
2.34.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
