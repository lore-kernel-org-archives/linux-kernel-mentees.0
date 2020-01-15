Return-Path: <SRS0=QLdQ=3E=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48E61C33CB1
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 15 Jan 2020 12:42:23 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F9E222522
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 15 Jan 2020 12:42:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="auOyDPgV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F9E222522
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id E017D824DC;
	Wed, 15 Jan 2020 12:42:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8VUF-P-BZL5I; Wed, 15 Jan 2020 12:42:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 228E881C62;
	Wed, 15 Jan 2020 12:42:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0AF74C1D82;
	Wed, 15 Jan 2020 12:42:18 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7CCC2C077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jan 2020 12:42:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 69B5482FF1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jan 2020 12:42:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sUcAqdqDyHVB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jan 2020 12:42:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 4659682EE5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jan 2020 12:42:09 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id ay11so6815768plb.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jan 2020 04:42:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=S3wXxo3Bh9oayGWM8jZCD/Gnpt0hNiPJrwn1QYGnm2M=;
 b=auOyDPgVe8RTFRbA5W4EWOXH32dZQVkLy+zdkE2NamNJ/gwg8H60PNu7Lv559iQMy8
 +Uf1+gYH+3O1bRayk3SvFe+zasRl5E+RgFunTFI3s7zr7bU7UuUa1QBxGBGG0LzjsDze
 bQi12uwfRkAMQ5ouovUAbj1CdKvwlrV11g8viM4XpvGwjw2uUTQyDBK5JpP66aykCgEz
 vY4fGSxWClC5AyfgITKjn2lhV5F/HnF4oPzRneGRvIa3bOxw9iqRyEE2i+Uo3Kw/jc2L
 Y+091uGOMmax/zqpjYMMcGDh7guRcl1dBh8eCVyHEDYj1tDqyt/XpXF5PcMLIDmaHqeV
 6Ijg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=S3wXxo3Bh9oayGWM8jZCD/Gnpt0hNiPJrwn1QYGnm2M=;
 b=cEwL6/+MRKuP9YfTm4lfjT8sjPJ+6tCqgp5eXWFR+4SntG92snKtuAxsNGDsnEWq4p
 pucHzzfoDdgpF2R9eBdrrGseQQfrWHa5F8otDHfKazuHhvGk7bCVElHVKC9oS3sIKguq
 0vSXPgv0/WV2PAR/eFOXwHsE5xLF66DXOHdcn20YwGDl6QHe8qidYBIJadvWycsZe1B9
 80h327Sxwdh9ZfLMDeGP8O33on4f+yYCgMrKuoWnvo/E3vM1Z2/vlKBiOLvQsDSmHbyv
 reRho4dmfhwm7/k/wLKNZI15qUd0JWP8TaLemBFV0hD1It3PqvFhGgCNJcBgqAFxMkqv
 1iuA==
X-Gm-Message-State: APjAAAVGAO/J/cie4x4hPPmaK9OkfSyBmpovhvGHBhGLjTxIJE15Xy8/
 2qsPMCg7KrKZqpa1AreiGH0=
X-Google-Smtp-Source: APXvYqzyYSD1kqH06PWZT5j+hjPxOJVeYfDpiBoVq5NBAlR42H2eqCY0MexVhcMO00FKLXtnuMtjCw==
X-Received: by 2002:a17:902:bd08:: with SMTP id
 p8mr31051161pls.39.1579092128653; 
 Wed, 15 Jan 2020 04:42:08 -0800 (PST)
Received: from madhuparna-HP-Notebook.nitk.ac.in
 ([2402:3a80:1ee2:fbb9:75ba:e01f:bdbc:c547])
 by smtp.gmail.com with ESMTPSA id y23sm12638990pjj.3.2020.01.15.04.42.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2020 04:42:08 -0800 (PST)
From: madhuparnabhowmik04@gmail.com
To: wei.liu@kernel.org,
	paul@xen.org,
	davem@davemloft.net
Date: Wed, 15 Jan 2020 18:11:28 +0530
Message-Id: <20200115124129.5684-1-madhuparnabhowmik04@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: paulmck@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 joel@joelfernandes.org, xen-devel@lists.xenproject.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] net: xen-netbank: hash.c: Use
	built-in RCU list checking
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

From: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>

list_for_each_entry_rcu has built-in RCU and lock checking.
Pass cond argument to list_for_each_entry_rcu.

Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
---
 drivers/net/xen-netback/hash.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/xen-netback/hash.c b/drivers/net/xen-netback/hash.c
index 10d580c3dea3..30709bc9d170 100644
--- a/drivers/net/xen-netback/hash.c
+++ b/drivers/net/xen-netback/hash.c
@@ -51,7 +51,8 @@ static void xenvif_add_hash(struct xenvif *vif, const u8 *tag,
 
 	found = false;
 	oldest = NULL;
-	list_for_each_entry_rcu(entry, &vif->hash.cache.list, link) {
+	list_for_each_entry_rcu(entry, &vif->hash.cache.list, link,
+							lockdep_is_held(&vif->hash.cache.lock)) {
 		/* Make sure we don't add duplicate entries */
 		if (entry->len == len &&
 		    memcmp(entry->tag, tag, len) == 0)
@@ -102,7 +103,8 @@ static void xenvif_flush_hash(struct xenvif *vif)
 
 	spin_lock_irqsave(&vif->hash.cache.lock, flags);
 
-	list_for_each_entry_rcu(entry, &vif->hash.cache.list, link) {
+	list_for_each_entry_rcu(entry, &vif->hash.cache.list, link,
+							lockdep_is_held(&vif->hash.cache.lock)) {
 		list_del_rcu(&entry->link);
 		vif->hash.cache.count--;
 		kfree_rcu(entry, rcu);
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
