Return-Path: <SRS0=nqa8=D4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A964AC388F9
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 21 Oct 2020 14:36:29 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06CE42224E
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 21 Oct 2020 14:36:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="byoqvTcf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 06CE42224E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7D16086C7C;
	Wed, 21 Oct 2020 14:36:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bHwi3sQitjHa; Wed, 21 Oct 2020 14:36:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id B050E86C51;
	Wed, 21 Oct 2020 14:36:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A826FC0052;
	Wed, 21 Oct 2020 14:36:27 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 79B8BC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 14:36:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 4C6702EC2A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 14:36:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A4Cni35Xv3j5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 14:36:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by silver.osuosl.org (Postfix) with ESMTPS id 6792D3164A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 05:01:59 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id e7so744075pfn.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 20 Oct 2020 22:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=Kcp/VwY0QnWBoCWdpGQK9BsMlqOR/l67fk5ERrlCXNI=;
 b=byoqvTcfb3uB/9rGsIrl7Z5M/5rn9zF/T/3yeCOBmywJjgr/eb6GFQKGhzsaToxI4d
 litahLa0r4vR3j13XiJYNDf/Wi5680MuFWjpgnIkMKqwEaNeeJ36QicEt/j5WKNk6wIv
 QqwK6fhLK02TsWP9LDAdPi99xeC9fYg4CuW8TIhwjEvFCgwgHOYd0K60HSiG9iuJr1b3
 czcQr+89KZEvsZ1xH68RIyVR3YC6F3xjRHP+i6pXaO3CCMhZIjO3tSmMupu07Epo3JZ9
 EgQ4aBLzNyTY2OZzULhqEM2wJGpbwU168VoCMu2DR7CK0IEyvaPzv75/sxh1TDZNC1L3
 B8nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Kcp/VwY0QnWBoCWdpGQK9BsMlqOR/l67fk5ERrlCXNI=;
 b=J59K1EpQkF008ViLm2ospE3yeQUp3Hr0vdhQimj6t45UvkqeW1LTvvLjg/PrzFYWTj
 P5sEtm0EtyGQYVZL97dTpu3HBg9eekepyHSpSsEXWEs5dCHS53yEkq/kpF8oKaz7CoNd
 f4pNeERFgv1z3ODQWmXg7H38FJy2a5TpNfdlYvPEwZwxT50UFQa8BjTUvtgh2yZSa9BW
 fynePtjIPDhaWkbV1eIHZCL7SnomzWDoNG9FUVWBqiTE1gl47T0YsirurVqAkf1LPQib
 flyLaFU55bZ4k1Bz2BCjiU1mad7BCqE0z73k7B3TJ6SBn07kP0gulb7djHy0wijGKgkA
 4vkw==
X-Gm-Message-State: AOAM532soNA2y6zA9fsISLFBzM1QVXxZfl/w1kEQVklAoJPylQg5WKtb
 4QiERrgPQcEuv90Vd9PXagc=
X-Google-Smtp-Source: ABdhPJyVQY0YksUzG622uw+He6OjfsseUN18EBeIAtqTuLnizSR6Wx3rNoCBr9ybsjK/42twDulpIg==
X-Received: by 2002:a63:f80f:: with SMTP id n15mr1608145pgh.267.1603256518749; 
 Tue, 20 Oct 2020 22:01:58 -0700 (PDT)
Received: from localhost.localdomain ([2402:3a80:425:f573:8cb2:c45f:197:35d9])
 by smtp.googlemail.com with ESMTPSA id
 y4sm816599pgl.67.2020.10.20.22.01.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2020 22:01:58 -0700 (PDT)
From: Aditya Srivastava <yashsri421@gmail.com>
To: lukas.bulwahn@gmail.com
Date: Wed, 21 Oct 2020 10:30:27 +0530
Message-Id: <20201021050027.13253-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 Aditya Srivastava <yashsri421@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH] checkpatch: fix false positive for
	REPEATED_WORD warning
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

Presence of hexadecimal address or symbol results in false warning
message by checkpatch.pl.

For example, running checkpatch on commit b8ad540dd4e4 ("mptcp: fix
memory leak in mptcp_subflow_create_socket()") results in warning:

WARNING:REPEATED_WORD: Possible repeated word: 'ff'
    00 00 00 00 00 00 00 00 00 2f 30 0a 81 88 ff ff  ........./0.....

Here, it reports 'ff' to be repeated, but it is infact part of some
address or code, where it has to be repeated. Thus the warning seems
unnecessary in this case.

To avoid all such reports, add an additional regex check for a repeating
pattern of 4 or more 2-lettered words separated by space in a line.

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
 scripts/checkpatch.pl | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 9b9ffd876e8a..181c95691715 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3052,7 +3052,9 @@ sub process {
 
 # check for repeated words separated by a single space
 		if ($rawline =~ /^\+/ || $in_commit_log) {
-			while ($rawline =~ /\b($word_pattern) (?=($word_pattern))/g) {
+			# avoid repeating hex occurrences like 'ff ff fe 09 ...'
+			while ($rawline !~ /((\s)*[0-9a-z]{2}( )+){4,}/ &&
+				$rawline =~ /\b($word_pattern) (?=($word_pattern))/g) {
 
 				my $first = $1;
 				my $second = $2;
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
