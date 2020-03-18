Return-Path: <SRS0=wOYV=5D=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32361C1975A
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 18 Mar 2020 01:50:44 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F317F206EC
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 18 Mar 2020 01:50:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="qgSndENZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F317F206EC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=massaru.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id EF9378886E;
	Wed, 18 Mar 2020 01:50:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uBAo8aUPHzLl; Wed, 18 Mar 2020 01:50:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4E9968886C;
	Wed, 18 Mar 2020 01:50:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3E5ECC1D74;
	Wed, 18 Mar 2020 01:50:42 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 94AF6C013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Mar 2020 01:50:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 8360A20396
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Mar 2020 01:50:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TgWrcLJYb4O4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Mar 2020 01:50:40 +0000 (UTC)
X-Greylist: delayed 00:07:27 by SQLgrey-1.7.6
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
 [209.85.222.193])
 by silver.osuosl.org (Postfix) with ESMTPS id C724A2038F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Mar 2020 01:50:40 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id s11so24914131qks.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Mar 2020 18:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=massaru-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=L0b5WLsdgfiR/hAFOY1sB2eFKdHn+83f5OZv1AD8it0=;
 b=qgSndENZddrIR2I4cydy7JaMW73b0CxPToIjxG1ZE0TTzbN2xWQkQgAB/xpbnei++o
 8+ebYrUn4HIId2ID/7hF/AT+Py0Cc51GHAs1RWc1vIiTAdFv8daz1CDkgCdfuRTLAEJJ
 vSbTLizg2KByfTFCtEKLzEypie6jjTJfLM3jP7Y8Cafouwlpj7hsDhIZCqGGCaMmccqU
 uJGQ+Xaj1pDqnqXaCVL8fQiVRKzSrFa50cCMrZuLfYEOuyvk5B6cYrQDbc4pqZniw/G7
 bflk1ORZkn5pn4F5zVGX1og+bhSnpOoc/FHNp8IKXCqmP21ru52ngcV3/jJRP7h3Pbek
 BNYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=L0b5WLsdgfiR/hAFOY1sB2eFKdHn+83f5OZv1AD8it0=;
 b=jZmJmCIxGcX+gUVX59HqY3ib9uHZJa6ksko1OluoZfLqsnsoaDRMvpKHBIBiTjWFM2
 eINXGohnhKD+EB+r25PqQAbmBFj8+P7z/vlRx5TahOuDhoauObKxo0hw7QFn1OO7ma0J
 /ajKQ1HYMOE0IO3vO76ZtkM01bXLVdmuAXkS07mUkdS/+6otltw8ajXbKxB13HwC19qK
 CNmsit5xyt2e8GUImXEl+6dfL9dGq9RLBpA2DUAgvrq3SJEXBzl+jA8dQwitgYrVrTCp
 oiSiDlXVq0TWUJpsqhodr9OuMazY696L0JbKPhmy0eVo4oqQ4LjILR10nnho3xWcZGJg
 q15A==
X-Gm-Message-State: ANhLgQ3NE8KtC/5xCGgMMId4msKnGbEwCj57V5tiJvtAK4XdelVs0fLj
 1cz6Z+DERvKFQOiP9/w9g23qZ7Bf4EeV9Q==
X-Google-Smtp-Source: ADFU+vt4qdtqYNp0md5miZ5EokE2sD2apk116S3hvJDV9bEIEBdSJqnmsCcM5zkMCg2rdg2MlKSUKA==
X-Received: by 2002:aed:2ee1:: with SMTP id k88mr2212557qtd.268.1584495786865; 
 Tue, 17 Mar 2020 18:43:06 -0700 (PDT)
Received: from bbking.lan ([2804:14c:4a5:36c::cd2])
 by smtp.gmail.com with ESMTPSA id m1sm3740883qtm.22.2020.03.17.18.43.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Mar 2020 18:43:06 -0700 (PDT)
From: Vitor Massaru Iha <vitor@massaru.org>
To: 
Date: Tue, 17 Mar 2020 22:43:01 -0300
Message-Id: <cover.1584494902.git.vitor@massaru.org>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Cc: linux-fsdevel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 willy@infradead.org
Subject: [Linux-kernel-mentees] [PATCH 0/2] xarrary: Fix warnings reported
	by checkpatch
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

Hi,

This patch series fixes checkpatch warnings in xarray.h:

 * Add identifier names for function definition arguments;
 * Add missing blank line after declaration;

Vitor Massaru Iha (2):
  xarray: Add identifier names for function definition arguments
  xarray: Add missing blank line after declaration

 include/linux/xarray.h | 88 +++++++++++++++++++++---------------------
 1 file changed, 45 insertions(+), 43 deletions(-)

-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
