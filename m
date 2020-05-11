Return-Path: <SRS0=cT8e=6Z=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 200E4C54E4B
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 May 2020 10:09:29 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6A2920720
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 May 2020 10:09:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gYqQtwVN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6A2920720
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CA50B86A11;
	Mon, 11 May 2020 10:09:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yAgC0uNaphxb; Mon, 11 May 2020 10:09:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 54E2486990;
	Mon, 11 May 2020 10:09:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5102EC0892;
	Mon, 11 May 2020 10:09:23 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 861AEC0176
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:09:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 6BEDE24B59
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:09:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aSe2AL4yZ2JE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:09:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by silver.osuosl.org (Postfix) with ESMTPS id 9CD992050E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:09:19 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id p25so4521351pfn.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 03:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Rrzz3VKyAplkiQoSTk8Ir4A1V86JltGAz16X3d5PyBk=;
 b=gYqQtwVNfi/qI9rSvlM6nRyefd+yF2IW6iR6I1BOCn8AimdnnkQpEmBMnagSW7re7L
 XbCHpBjwShuVdV4lUV7BjIQv9qnWOyIaj6QZPbRUtiYRji9ZLcUF1HnnUJkwh2txEnrM
 cEpOPwPkTBQzZ+eis0rrZZDTPHSxPweW5twMTTlmoaJ+/xZi+PadBR1pid492qHHtADq
 nmkAj1SyQOXQEk3cZwYGqqyDCuCuotioHrAX/J/wyijm/mAb06NVEU16Qy83Xn+X6xAG
 B04GJrV9rKl6oXgpFNSVir+kDI3UXSkudrrTN5GX3QtlhUH1vukR1ZBfW+rqJisPWKEv
 ko5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Rrzz3VKyAplkiQoSTk8Ir4A1V86JltGAz16X3d5PyBk=;
 b=mYiuDyViqNfQQVloRQ3rjVFnF8vMqSRoswc6tlqVQCWT5Y7tYfPrxS5rdn5ut8UbNW
 uHBiDPtIBEK5t5dvX66Ru14vFd8rQpGDtosppPcGqoU0NRNgjik2srLXQRa+s0t7BKyP
 0vUL7V/OW+3x4TVS6ZWA58E0cCS8Ek6d+rJzdfAoojJWAnZvGCu/LHX6N1B6sSxHieA/
 HkHQcI0F2HxHUCSUj9Kswtfh0eRqGLnPrBxoN/EXiPTQRQvT1CLo4UczljisB6syuUGb
 yaRgYLBnbpljzgZOXqcDcgnMSXgdcBhuuC2hg3+ikO1Cw7+u+vYTW3IRc4PLtj+Qpe65
 ZXhg==
X-Gm-Message-State: AGi0PuaKk8XASHoBwwOPhWV45zmPbXbfPPSD9li6SPDE7+nr/MCKd4tN
 JlvaltpyXDNPqQWr+OAtVk0=
X-Google-Smtp-Source: APiQypIjzRFzAWBGb/Qu3UbwTKWxBKMVNttmUo1J+8JvWnjOtoH3IKYaYJuBrAh/vpohzETOJIN+Lw==
X-Received: by 2002:a62:3006:: with SMTP id w6mr15555845pfw.29.1589191759165; 
 Mon, 11 May 2020 03:09:19 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:382:66db:4729:1ab8:2139:8945])
 by smtp.gmail.com with ESMTPSA id
 o99sm9772994pjo.8.2020.05.11.03.09.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 03:09:18 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 11 May 2020 15:37:09 +0530
Message-Id: <20200511100715.19819-27-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200511100715.19819-1-jaskaransingh7654321@gmail.com>
References: <20200511100715.19819-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v2 26/32] engine:
	check_exhaustive_pattern: Reflect Cast attributes
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

Cast attributes are added to the SmPL AST. Reflect these changes in
check_exhaustive_pattern.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 engine/check_exhaustive_pattern.ml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/engine/check_exhaustive_pattern.ml b/engine/check_exhaustive_pattern.ml
index 903c32ff..d7785fc7 100644
--- a/engine/check_exhaustive_pattern.ml
+++ b/engine/check_exhaustive_pattern.ml
@@ -123,7 +123,7 @@ let dumb_astcocci_expr = function
  | A.ArrayAccess (ea1, _, ea2, _) -> ()
  | A.RecordAccess (ea, _, ida) -> ()
  | A.RecordPtAccess (ea, _, ida) -> ()
- | A.Cast (_, typa, _, ea) -> ()
+ | A.Cast (_, typa, attra, _, ea) -> ()
  | A.SizeOfExpr (_, ea) -> ()
  | A.SizeOfType (_, _, typa, _) -> ()
  | A.TypeExp (typa) -> ()
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
