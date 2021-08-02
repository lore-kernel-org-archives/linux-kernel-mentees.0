Return-Path: <SRS0=D/cX=MZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D92CC4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Aug 2021 11:01:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE39860EFF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Aug 2021 11:01:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BE39860EFF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B29282D45;
	Mon,  2 Aug 2021 11:01:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z_1ogJrSwoUM; Mon,  2 Aug 2021 11:01:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 96F4381AAB;
	Mon,  2 Aug 2021 11:01:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 71FCDC001B;
	Mon,  2 Aug 2021 11:01:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9736EC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Aug 2021 11:01:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8687F402FE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Aug 2021 11:01:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xAne6SoQaBG7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Aug 2021 11:01:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C9E64402EC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Aug 2021 11:01:06 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id l19so24742466pjz.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 02 Aug 2021 04:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+4PUslbRzXQEVcyLjM1+XzzP75b9QIYpCs6ACXDfVsQ=;
 b=PBNkxN6DWeczRn2gcRqifa1l8gMQiDGvhZH1FXQiXg2ttbO/odOC1ivcBqr8H01S0D
 jfsgV37/i8xj5A2z76bc+oO9ZiUJfPVGooTQzts+RmNLoQnUiSTCT/IOzHCYZ6yL6EQM
 cosIIp29pDNN1sbFff32hpjqpysYBO8OevzObUWgHJkyaoRN+pQMa6JSXmbMbWiY+z1r
 QmYH3s1ahk2DAjyNQuRCJ+0Nk4O55ASJjPnCD1sPHF3w09+As/JtRMHCHHjH0USSWBkI
 Pbnt60nBbzlkLd12fNE1rlrDN7KxV5ZOcIH0y243fIkNxLQT/aePqQtbY6syJf8z+A1u
 PSHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+4PUslbRzXQEVcyLjM1+XzzP75b9QIYpCs6ACXDfVsQ=;
 b=ZrK5zk8uq833EN9N/+25L9NL3VUEo5rpASsd/AOU/0eR8Rf+3VjQ4REWzbZ9l9P2R4
 ht2HhuPi1Mw4/SvoqX82zwhW17QdYu5BUvVnbdvo2eh6LDRs6wQcg05QiTOEFT0LBbY9
 TaMWz530LdyHvcbtCRQ3sXqESgTA3SagWb4Us9fM6lF585fFyTscgzwM6eC9CVoOMbf5
 u834HUQyBNeI6wmXs6iIo7PGn7U4eMQjanaChVtQMLatbgcdQB1/jdmq4FtwTs+luSxM
 kKbH4iagMkq/HwcDEzl9R7WwkiUk4En3d0Yvsqose+99nxnEvsSIPGSztUomZ8Ms9zDS
 x1XQ==
X-Gm-Message-State: AOAM531tu+km6AFU6WSSRv56TpIiC6ZHLm/ewf/L8yYqYysJ+j0nTuRO
 LTUBL5EuwdUZtiqJ3cum8YE=
X-Google-Smtp-Source: ABdhPJxYoSbH1KU580oT99tsfY14kH5fvF22HdTQpqe2O21iFrCt95Z3GnyJlCAhxGz0r3wEDKlm0A==
X-Received: by 2002:a17:903:22c6:b029:12c:8da8:fd49 with SMTP id
 y6-20020a17090322c6b029012c8da8fd49mr13360743plg.79.1627902066166; 
 Mon, 02 Aug 2021 04:01:06 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id v30sm9709158pgk.25.2021.08.02.04.01.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 04:01:05 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, peterz@infradead.org, mingo@redhat.com,
 will@kernel.org, longman@redhat.com, boqun.feng@gmail.com,
 sumit.semwal@linaro.org, christian.koenig@amd.com
Subject: [RESEND PATCH v2 0/2] locking/lockdep,
 drm: apply new lockdep assert in drm_auth.c
Date: Mon,  2 Aug 2021 18:59:55 +0800
Message-Id: <20210802105957.77692-1-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-media@vger.kernel.org
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

Hi all,

My bad for the resend. Adding cc: intel-gfx, and the maintainers and
mailing lists for include/drm/drm_file.h.

Following a discussion on the patch ("drm: use the lookup lock in
drm_is_current_master") [1], Peter Zijlstra proposed new lockdep_assert
helpers to make it convenient to compose lockdep checks together.

This series includes the patch that introduces the new lockdep helpers,
then utilizes these helpers in drm_is_current_master_locked in the
following patch.

v1 -> v2:
Patch 2:
- Updated the kerneldoc on the lock design of drm_file.master to explain
the use of lockdep_assert(). As suggested by Boqun Feng.

Link: https://lore.kernel.org/lkml/20210722092929.244629-2-desmondcheongzx@gmail.com/ [1]

Best wishes,
Desmond

Desmond Cheong Zhi Xi (1):
  drm: add lockdep assert to drm_is_current_master_locked

Peter Zijlstra (1):
  locking/lockdep: Provide lockdep_assert{,_once}() helpers

 drivers/gpu/drm/drm_auth.c |  6 +++---
 include/drm/drm_file.h     |  4 ++++
 include/linux/lockdep.h    | 41 +++++++++++++++++++-------------------
 3 files changed, 28 insertions(+), 23 deletions(-)

-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
