Return-Path: <SRS0=tqep=BJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A43D5C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Jul 2020 19:22:04 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69FBA2072A
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Jul 2020 19:22:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FyRMSHJb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 69FBA2072A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 2A11422C6B;
	Thu, 30 Jul 2020 19:22:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 74HlETsPy4VL; Thu, 30 Jul 2020 19:22:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 4CB9B2011B;
	Thu, 30 Jul 2020 19:22:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2915EC004F;
	Thu, 30 Jul 2020 19:22:01 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BD6BCC004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 19:21:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id AC309870B3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 19:21:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QtoTky5vD6UJ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 19:21:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
 [209.85.222.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 0053E86FBB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 19:21:58 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id h7so26662454qkk.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 12:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=agaThPhartfIHs0CEVdT0S0oqKuMNdJA/yYlXtKqgNk=;
 b=FyRMSHJbJlHdwbK7O7cNCShcgYOjQ/O59qUAUFfx4KS+mcIV0USH78zqh+JpriUN4P
 zUT87eXfKUEjQk6A+SJdwFOHRQ246AByRhfbIUWJtIIj27EJz78aucu4KRz3Ge6LzRzC
 5zD16l0ZqNaGBSbPH/V4IJrgHRlSuAgKV8OTIM/GBnQMGBg/No74TCnfKfX5SyySLuzv
 EmRaQtgF4mDtZBY9cB9aMePCezuNGr27rLbcFhvMIG2t7lwDGfSmTTTJlNoBhDxmxFjP
 i+u5Y2joONJm3KIpGVfSbUhLHLRNEtA0ZcqI5h/7kSe0/1k0cCmI2ZRfQ5EsUF8Rut2P
 DtUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=agaThPhartfIHs0CEVdT0S0oqKuMNdJA/yYlXtKqgNk=;
 b=TchlBHG0pUZmfO0NUwW8XM0F4dRCh4AdTwY7hdniSjR9HNqzfYIf8O4vvIKqGKSx0N
 YqC5rC5xTLLnUfVMZayKKty8h4G6Wamr274Dk9EnhOAGiVfZC7ly6kY3wV0olHbYW02c
 mUJw1ScBYu2FON/5ZGYTPd/1hn8YPDTC3ttDaBM6hp0I05Qq0NpDqupzckMPZQST3KXi
 8IKcCQJ8L40FF0nuVtxBYaSMvaqcEwp6YUT7IPXeG+j4cVdVx5ACpLw+8jT1nf6zzw9W
 lSEDKf/8CXuiE8Fygl0tG0PsAWdL7Vgy4F7PwbOOTwefICo8cjGy5djEoAXLRHwdMp7p
 2fIQ==
X-Gm-Message-State: AOAM533WW01NfxHfNF1mL6Vs9jwaqr0VT4EeD781nyeOd66nsGmPIKAR
 jzn/Kg4InNd8bmgUvesc1w==
X-Google-Smtp-Source: ABdhPJwWCgUMsoFCCaoH1/xFyEBTGW5Q+V6fazGvqkm22JCMJGkInRBxDqiFpodkc6+juDwBXBZwtg==
X-Received: by 2002:ae9:e507:: with SMTP id w7mr730223qkf.264.1596136918051;
 Thu, 30 Jul 2020 12:21:58 -0700 (PDT)
Received: from localhost.localdomain (c-76-119-149-155.hsd1.ma.comcast.net.
 [76.119.149.155])
 by smtp.gmail.com with ESMTPSA id c205sm4994572qkg.98.2020.07.30.12.21.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jul 2020 12:21:57 -0700 (PDT)
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Santosh Shilimkar <santosh.shilimkar@oracle.com>
Date: Thu, 30 Jul 2020 15:20:26 -0400
Message-Id: <20200730192026.110246-1-yepeilin.cs@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: rds-devel@oss.oracle.com, Arnd Bergmann <arnd@arndb.de>,
 linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Peilin Ye <yepeilin.cs@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>
Subject: [Linux-kernel-mentees] [PATCH net] rds: Prevent kernel-infoleak in
	rds_notify_queue_get()
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

rds_notify_queue_get() is potentially copying uninitialized kernel stack
memory to userspace since the compiler may leave a 4-byte hole at the end
of `cmsg`.

In 2016 we tried to fix this issue by doing `= { 0 };` on `cmsg`, which
unfortunately does not always initialize that 4-byte hole. Fix it by using
memset() instead.

Cc: stable@vger.kernel.org
Fixes: f037590fff30 ("rds: fix a leak of kernel memory")
Fixes: bdbe6fbc6a2f ("RDS: recv.c")
Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
---
Note: the "real" copy_to_user() happens in put_cmsg(), where
`cmlen - sizeof(*cm)` equals to `sizeof(cmsg)`.

Reference: https://lwn.net/Articles/417989/

$ pahole -C "rds_rdma_notify" net/rds/recv.o
struct rds_rdma_notify {
	__u64                      user_token;           /*     0     8 */
	__s32                      status;               /*     8     4 */

	/* size: 16, cachelines: 1, members: 2 */
	/* padding: 4 */
	/* last cacheline: 16 bytes */
};

 net/rds/recv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/rds/recv.c b/net/rds/recv.c
index c8404971d5ab..aba4afe4dfed 100644
--- a/net/rds/recv.c
+++ b/net/rds/recv.c
@@ -450,12 +450,13 @@ static int rds_still_queued(struct rds_sock *rs, struct rds_incoming *inc,
 int rds_notify_queue_get(struct rds_sock *rs, struct msghdr *msghdr)
 {
 	struct rds_notifier *notifier;
-	struct rds_rdma_notify cmsg = { 0 }; /* fill holes with zero */
+	struct rds_rdma_notify cmsg;
 	unsigned int count = 0, max_messages = ~0U;
 	unsigned long flags;
 	LIST_HEAD(copy);
 	int err = 0;
 
+	memset(&cmsg, 0, sizeof(cmsg));	/* fill holes with zero */
 
 	/* put_cmsg copies to user space and thus may sleep. We can't do this
 	 * with rs_lock held, so first grab as many notifications as we can stuff
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
