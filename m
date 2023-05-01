Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A5DEC77B61
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  1 May 2023 10:16:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E58B840576;
	Mon,  1 May 2023 10:16:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E58B840576
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=sTjGdt9k
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FkDfczbWnNJR; Mon,  1 May 2023 10:16:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id B1779400CC;
	Mon,  1 May 2023 10:16:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1779400CC
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 93F1EC0037;
	Mon,  1 May 2023 10:16:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 73E30C002A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 May 2023 10:16:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 499BD409FA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 May 2023 10:16:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 499BD409FA
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=sTjGdt9k
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 75NF9G_IGvgO
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 May 2023 10:16:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33ADB408C2
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 33ADB408C2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 May 2023 10:16:40 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-9594916df23so77544866b.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 01 May 2023 03:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682936198; x=1685528198;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=93TBlzDzoT1wtp8An/95IHkU2ENlETSYZYDB2GGro8w=;
 b=sTjGdt9kxizaGq0cMEqXozsjwqpOak96bF/ispjSAjjx4TKex54FFHoU/aAjHUsfg6
 6pVl8lftP6u6eVu70MR+0R2D22wu+YgwMBnRranzfrwhmUAl1f5MKxdqUMivO8avT4Fe
 J419B8HhXlx5Gmazxy5Wd16J7qFfwYvarFpEXnPSy3JDndmi3LjdH/9uEFv23Io3d+3G
 9/2E++rzy5Q+mQNp7KOB1Lfriig1kocdJ7G9S8V/0QZdCbu/OJJloGXeMaAKr+gdIHTC
 9toKT170vXKOMzu8kpTz9gz60c9lyPxabrdBXojpy1q6g6P6WAOJzkRd/ekRX7Z/IGZu
 Sayw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682936198; x=1685528198;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=93TBlzDzoT1wtp8An/95IHkU2ENlETSYZYDB2GGro8w=;
 b=iVpeGAmNh+iojv9N3rSSWu9sdqb6BoAATw90WLdO+GnGQyIy2NalIswpOCq2GrP5sp
 Godx5Sc86WeFS+Osb5BSc1MfSO18ZNLXWYugUbUjUYGoWLjs9e7dI3cxXgHWRAZbD1lb
 sQO/dKc8cCS0xOgv8JKeiHFSmr/+ktn7gmP27xWne0r2SazEIv5PvHNev27Bw29UOcGP
 T7LYWqadghiT29IPiu72qa21e3KMoQJQ6dmgdmqcr2w6A7dgIMxDJ5DLwHUL87FKjQk1
 Ma41+PMQkHkFhFZ8faLAefYltg6s8NP875hfjMIh0E4noHdiCY2U55Vp0jhQZXpR/JUp
 xWVw==
X-Gm-Message-State: AC+VfDwK0FcVOWKSjMhyLTUjtrvYkFQ1gO7hW7E/KBiQjB9LTduW2hsV
 EZp/iv8VLyDGaiRUFQ4s8XE=
X-Google-Smtp-Source: ACHHUZ5JCVLg6Vd1xQS7WcqurRX9+ZHoyD7a601rkTEbwcCPZpjAT/5x0iwRqtZAY7lHlu7F9o6owA==
X-Received: by 2002:a17:906:5352:b0:94f:4ec3:f0e7 with SMTP id
 j18-20020a170906535200b0094f4ec3f0e7mr11395200ejo.2.1682936198106; 
 Mon, 01 May 2023 03:16:38 -0700 (PDT)
Received: from ivan-B550MH.. ([37.252.94.55]) by smtp.gmail.com with ESMTPSA id
 gq18-20020a170906e25200b0094eeda0df09sm14749458ejb.179.2023.05.01.03.16.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 May 2023 03:16:37 -0700 (PDT)
From: Ivan Orlov <ivan.orlov0322@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com,
	corbet@lwn.net
Subject: [PATCH] ALSA: docs: Extend module parameters description
Date: Mon,  1 May 2023 14:16:34 +0400
Message-Id: <20230501101634.476297-1-ivan.orlov0322@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Ivan Orlov <ivan.orlov0322@gmail.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
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

Common ALSA module parameters look a little bit confusing because of the
description lacking, and it took me a while to understand the purpose of
their existence. To figure it out I asked the question about them to the
"alsa-devel" mailing list, and Takashi Iwai answered me with the text I
appended to the ALSA documentation in this patch.

These common module parameters aren't used a lot nowadays, but as I
understand they are important for providing compatibility with some
existing user-space apps. So in my opinion it is a good idea to document
why we need them.

Signed-off-by: Ivan Orlov <ivan.orlov0322@gmail.com>
---
 Documentation/sound/alsa-configuration.rst | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/sound/alsa-configuration.rst b/Documentation/sound/alsa-configuration.rst
index af71c68f1e4e..829c672d9fe6 100644
--- a/Documentation/sound/alsa-configuration.rst
+++ b/Documentation/sound/alsa-configuration.rst
@@ -133,6 +133,19 @@ enable
     enable card;
     Default: enabled, for PCI and ISA PnP cards
 
+These options are used for either specifying the order of instances or
+controlling enabling and disabling of each one of the devices if there
+are multiple devices bound with the same driver. For example, there are
+many machines which have two HD-audio controllers (one for HDMI/DP
+audio and another for onboard analog). In most cases, the second one is
+in primary usage, and people would like to assign it as the first
+appearing card. They can do it by specifying "index=1,0" module
+parameter, which will swap the assignment slots.
+
+Today, with the sound backend like PulseAudio and PipeWire which
+supports dynamic configuration, it's of little use, but that was a
+help for static configuration in the past.
+
 Module snd-adlib
 ----------------
 
-- 
2.34.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
