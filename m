Return-Path: <SRS0=+n2V=LO=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C272C49361
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 20 Jun 2021 19:45:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B889E61001
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 20 Jun 2021 19:45:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B889E61001
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 71929400C9;
	Sun, 20 Jun 2021 19:45:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qqoe-Qa4BZ1t; Sun, 20 Jun 2021 19:45:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id AC55940025;
	Sun, 20 Jun 2021 19:45:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 83FABC000E;
	Sun, 20 Jun 2021 19:45:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4CAB4C000C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 20 Jun 2021 19:45:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B7B783163
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 20 Jun 2021 19:45:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W8_OSjzKtOUe
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 20 Jun 2021 19:44:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6C1AF80FBC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 20 Jun 2021 19:44:59 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id d16so18994725lfn.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 20 Jun 2021 12:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7p5HEGqVeMErSYe7rEIAAwOp1ZmyshLqSPpzV13r4lI=;
 b=C/0EPLb+pY6Fnyoz17LGQrhKk8Ipq/PIUAZ3z3XPf4UKwuxTAsb+dOLIes9ax6Sl4/
 KDq07cjwsTMkfw9Qh6X19svGo2m4XP9cTfksmSniAtV2wfLpLR0McJ0dfcJBSa8Efi3U
 TUzzHkwWvOFwQAx/oW+1hKsVKe04ugRSctc1RLtOWn2FiqY2kFmrac+0+JHM7wX/rojM
 W2zwhEBLLX6MPjB5p/nMy7q3u/BiRwBRhUvVEepkdvp9ITnHRE/33OSD4iV7TTidfAO0
 IhxgBmt9oaxmu+8YvDPGneX4sOcGhIqeHWGN6palFh0+e2HI4Em/VrmhbMLIktM4sWZ3
 VkXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7p5HEGqVeMErSYe7rEIAAwOp1ZmyshLqSPpzV13r4lI=;
 b=W/Wqx2VZA059flBRm/DSWDgwbNCVkjtFnXRWWEL/GiquVFzKBD3xwx7NI3/txoZQfg
 +HqkH9Er6/eDeSv3yF+pJHih7h/L5cC739KiVFUzfbz5ApZAmCSrmKxYLVg1xZZOPvb1
 mq1EolWTY2XbYWKAgX2sjkVoLY9NOQZv6EPdEoANLtrKf26vkwRdBO6ezJCrRf5s6ZZO
 2ustq/FdkIsuJ70sgelunZ3KaQScC4ssz2Ncv6b0z4HTFzeYlzLuUpHRT7EeAyVZiy+x
 kIsw7HJ1/AYFGRObeWqZZ3aMQsMgYmM0FS7zWwS6345KL7g+NAgJhbQ4n4nAcEgu6x2g
 3YoA==
X-Gm-Message-State: AOAM531M24i0yZyfx8weQff97zXhfDgjR7dzZKUFu49mWeN8EgWKYoMP
 4VSBeiUqcLyJkV4SlDFO5MY=
X-Google-Smtp-Source: ABdhPJzg4aw3Q5wWLo8BCL/I3aIxrBqjsNilTKEzaHAcKxlO04p5AWoaCfyrUgcC7Bs0QPQ1IFNuyw==
X-Received: by 2002:a19:ed14:: with SMTP id y20mr11583264lfy.479.1624218297302; 
 Sun, 20 Jun 2021 12:44:57 -0700 (PDT)
Received: from localhost.localdomain ([94.103.229.24])
 by smtp.gmail.com with ESMTPSA id d23sm1620195lfe.183.2021.06.20.12.44.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jun 2021 12:44:56 -0700 (PDT)
From: Pavel Skripkin <paskripkin@gmail.com>
To: hverkuil-cisco@xs4all.nl, mchehab@kernel.org, oneukum@suse.com,
 gregkh@suse.de
Subject: [PATCH 0/2] media: go7007: code improvment and bug fixes
Date: Sun, 20 Jun 2021 22:44:33 +0300
Message-Id: <cover.1624217907.git.paskripkin@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
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

In this patch series, I fixed memory leak reported by my
local syzkaller instance and increased go7007_alloc() execution
speed by removing reduntant zeroing members in kzalloc allocated
structure.


Pavel Skripkin (2):
  media: go7007: fix memory leak in go7007_usb_probe
  media: go7007: remove redundant initialization

 drivers/media/usb/go7007/go7007-driver.c | 26 ------------------------
 drivers/media/usb/go7007/go7007-usb.c    |  2 +-
 2 files changed, 1 insertion(+), 27 deletions(-)

-- 
2.32.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
