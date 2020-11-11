Return-Path: <SRS0=RhO4=ER=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08FF0C5517A
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 11 Nov 2020 17:00:16 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D8BD2072C
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 11 Nov 2020 17:00:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MOh286pQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D8BD2072C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9E63B870EB;
	Wed, 11 Nov 2020 17:00:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HEHzDpdWbydt; Wed, 11 Nov 2020 17:00:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1A8EC870B5;
	Wed, 11 Nov 2020 17:00:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 12F72C0889;
	Wed, 11 Nov 2020 17:00:14 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3C8A7C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Nov 2020 17:00:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 28986870B5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Nov 2020 17:00:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f7RtVkDjrtV7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Nov 2020 17:00:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 6C589870EB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Nov 2020 17:00:09 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id w14so1958045pfd.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Nov 2020 09:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c94lztZhO2eT008D4pkLhU43B72yvq0WPJWvKsO0hew=;
 b=MOh286pQVrJTTVD8HcoPhcqT8q2yYoTL3bit4sDU9Mx5LKGgm5C8Ug8g0J6cNTUac2
 tsuqG1uOT1cVJaLGmgl9TCVBn9lAkM/KOgQS3/MGhJg7aCfJ5Q1kicPjfxOtMzP73kOy
 C69ar9hvwULSb6x6X2ojXTxGVhtRrXKoA4jCbGcFId4odlcU0lSSjOtUBQIM2VUanjlL
 FtkxvSMiY5DThI3jgfnZaVl7jd/sJnnfnsz6z9PGheLKZJse9vdUc/uJAopZ2VaBYjk5
 +Ni8MPJ/tXGN3WLucmZRebzS2Q6ifsk3YQVvbd/lG7mZXTm7MOrg1bQOp1qG6UZ/WLlp
 ltbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c94lztZhO2eT008D4pkLhU43B72yvq0WPJWvKsO0hew=;
 b=IGWI6mm3GLaq+9ypirfJ7VKtX6P0oPpxrxYKjbNLg4G2MUOWHvFMUP4q6CS/5RO5rp
 ciy1s24rNZdhuReceMb5a+e4A7q4cRnr3gtd5saM9AoVDqEiGHyFzqQSNIVDx4SMNPg4
 25wYhUdKzjlO3cAaiIJpQcmNVs0gB56fev9TxbZ6ndUF1CngNbKJ2OgH8NZRBCFmqkna
 pJFz+nzvgTQZAY6fMRqHsVn2DZkXgdTukNpsFLWuxKOqlvg6VM4ixi57ftRIR8c/xR92
 BTmW8bzIgEp2BUZRyPqNb5xTkgYcGCNx+KRrYccyfLpySaeR886iMAXLLx+uBTnqVRRV
 q3lg==
X-Gm-Message-State: AOAM533zLrreBQZvF0GgjSxTDw1DlkQpGLdce5AiJIQqnJdnFVTs+O8O
 Kj849EnBec2L34IphmwhZJY=
X-Google-Smtp-Source: ABdhPJwfkvk/d3fU+yUTkhmcjaJx1E8XyqQCovjkXeem1RMt/jK/7gE1oAMERAynWBom8fmf3hQFlg==
X-Received: by 2002:a62:1d83:0:b029:160:b9b1:470a with SMTP id
 d125-20020a621d830000b0290160b9b1470amr24129648pfd.32.1605114008894; 
 Wed, 11 Nov 2020 09:00:08 -0800 (PST)
Received: from localhost.localdomain ([45.118.167.196])
 by smtp.googlemail.com with ESMTPSA id h5sm3074114pfn.12.2020.11.11.09.00.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 09:00:08 -0800 (PST)
From: Anmol Karn <anmol.karan123@gmail.com>
To: ralf@linux-mips.org,
	davem@davemloft.net,
	kuba@kernel.org
Date: Wed, 11 Nov 2020 22:29:54 +0530
Message-Id: <20201111165954.14743-1-anmol.karan123@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201110194518.GA97719@Thinkpad>
References: <20201110194518.GA97719@Thinkpad>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org,
 syzbot+a1c743815982d9496393@syzkaller.appspotmail.com, saeed@kernel.org,
 linux-hams@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v4 net] rose: Fix Null pointer
	dereference in rose_send_frame()
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

rose_send_frame() dereferences `neigh->dev` when called from
rose_transmit_clear_request(), and the first occurrence of the
`neigh` is in rose_loopback_timer() as `rose_loopback_neigh`,
and it is initialized in rose_add_loopback_neigh() as NULL.
i.e when `rose_loopback_neigh` used in rose_loopback_timer()
its `->dev` was still NULL and rose_loopback_timer() was calling
rose_rx_call_request() without checking for NULL.

- net/rose/rose_link.c
This bug seems to get triggered in this line:

rose_call = (ax25_address *)neigh->dev->dev_addr;

Fix it by adding NULL checking for `rose_loopback_neigh->dev`
in rose_loopback_timer().

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Reported-by: syzbot+a1c743815982d9496393@syzkaller.appspotmail.com
Tested-by: syzbot+a1c743815982d9496393@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?id=9d2a7ca8c7f2e4b682c97578dfa3f236258300b3
Signed-off-by: Anmol Karn <anmol.karan123@gmail.com>
---
Changes in v4:
	- Free `dev`(on dev_hold()), when neigh->dev is NULL. (Suggested-by: Jakub Kicinski <kuba@kernel.org>)
Changes in v3:
        - Corrected checkpatch warnings and errors (Suggested-by: Saeed Mahameed <saeed@kernel.org>)
        - Added "Fixes:" tag (Suggested-by: Saeed Mahameed <saeed@kernel.org>)
Changes in v2:
        - Added NULL check in rose_loopback_timer() (Suggested-by: Greg KH <gregkh@linuxfoundation.org>)

 net/rose/rose_loopback.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/net/rose/rose_loopback.c b/net/rose/rose_loopback.c
index 7b094275ea8b..6a71b6947d92 100644
--- a/net/rose/rose_loopback.c
+++ b/net/rose/rose_loopback.c
@@ -96,10 +96,12 @@ static void rose_loopback_timer(struct timer_list *unused)
 		}

 		if (frametype == ROSE_CALL_REQUEST) {
-			if ((dev = rose_dev_get(dest)) != NULL) {
+			dev = rose_dev_get(dest);
+			if (rose_loopback_neigh->dev && dev) {
 				if (rose_rx_call_request(skb, dev, rose_loopback_neigh, lci_o) == 0)
 					kfree_skb(skb);
 			} else {
+				dev_put(dev);
 				kfree_skb(skb);
 			}
 		} else {
--
2.29.2
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
