Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3BB5C0032E
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 25 Oct 2023 12:27:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 560024F1DB;
	Wed, 25 Oct 2023 12:27:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 560024F1DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RI7fn4t5AOoE; Wed, 25 Oct 2023 12:27:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 3CB9C4F196;
	Wed, 25 Oct 2023 12:27:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3CB9C4F196
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1605EC0071;
	Wed, 25 Oct 2023 12:27:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 64223C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Oct 2023 12:27:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 28BE7432DC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Oct 2023 12:27:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 28BE7432DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lDBieVhFCwoi
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Oct 2023 12:27:31 +0000 (UTC)
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A49B44330C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Oct 2023 12:27:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A49B44330C
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1c9e072472bso40535135ad.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Oct 2023 05:27:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698236850; x=1698841650;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:dkim-signature:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wG0ZUl3gifsade13W7t1FoQuB4FnC3hvjN14YAls8W8=;
 b=kwahW+l4NBoWWw1ZlhzXZmkcIbD+5nqaMU3J3S7LOIMciU33yNme0msky2EAzlZvHZ
 eEUgfmDlM528Vgw6sd+TsBuEcODhVC6FMGcMdDhsAfCSzDBQIczB/CEpYnDkzcO3ZHJV
 oUML5Pzd1BqOj2Gb6Ut7i8+c+S73ncmQz1kdd7/kF87Fa/PGDDUwcYCL4CQxzujaBBso
 NAkzLTQs2y7Nuete9kictaBraYEnxzidA+wQ1ImQonsMWCzVgFdBsANBfnLj707IAMbC
 tiPg3KyUpJxgsbWeXYTnQZl+8lUDMPOOAPtW/wwelfUrznF0gDeQGAnqkQOddlsWrtlv
 K/Vw==
X-Gm-Message-State: AOJu0YzPxykaohlSPU2qvgZCICT4yovM+DAbULirJcdxmtShwZu1IaEy
 +2/dFJ1ZmfRM9JBSYHnekKw=
X-Google-Smtp-Source: AGHT+IE9tQK1viHVcwtIECPzpdaqlTjg12DIHJKqddhEn0ApTz8dcZuBMoyynsaPPV5aSo8wTScCuw==
X-Received: by 2002:a17:903:3093:b0:1c3:749f:6a5d with SMTP id
 u19-20020a170903309300b001c3749f6a5dmr9969948plc.4.1698236849721; 
 Wed, 25 Oct 2023 05:27:29 -0700 (PDT)
Received: from mail.marliere.net ([24.199.118.162])
 by smtp.gmail.com with ESMTPSA id
 w17-20020a1709029a9100b001b89466a5f4sm9019669plp.105.2023.10.25.05.27.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Oct 2023 05:27:29 -0700 (PDT)
From: "Ricardo B. Marliere" <ricardo@marliere.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
 s=2023; t=1698236845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=wG0ZUl3gifsade13W7t1FoQuB4FnC3hvjN14YAls8W8=;
 b=inmdc+0K5wrUGW0jTTWmP30k8xL5pojISO2gfCEDgPacAcdySlLksFrrXJCPmcgd2OHuKQ
 IDnTVbt+oh9o88OMujxbSlHMtaYwrYB8hV12qV102WqDh+cbqWjGicpXFrm6jJQQBe4LKL
 izey6X3Msy+iTvA0tgfH8EcBPQmfMdTl8Jr2b29Ey5JmAB6CSYI+TTevDA7ZoUyWqw+TpQ
 FeSV9P8eCm/u8DPp00K+MxI2ePz42gJp+N2SPXjcDomRGPRfcgX0wIjpoAy/tnoCqH3YHC
 UGN1zxCfnPBpzItU1QLYfgz1E1feylSyorF6MnMQirNBStQct9NhRkmIHqwwuw==
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=ricardo@marliere.net smtp.mailfrom=ricardo@marliere.net
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Umang Jain <umang.jain@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Stefan Wahren <stefan.wahren@i2se.com>,
 Peter Zijlstra <peterz@infradead.org>, Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] staging: vc04_services: use snprintf instead of sprintf
Date: Wed, 25 Oct 2023 09:26:34 -0300
Message-ID: <20231025122632.307385-4-ricardo@marliere.net>
MIME-Version: 1.0
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 linux-arm-kernel@lists.infradead.org
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

All the occurrences of sprintf usage under vc04_services can be safely
replaced by snprintf, so as to avoid any possible overflow.

Suggested-by: Dan Carpenter <dan.carpenter@linaro.org>
Suggested-by: Umang Jain <umang.jain@ideasonboard.com>
Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>
---
 .../bcm2835-camera/bcm2835-camera.c              |  2 +-
 .../interface/vchiq_arm/vchiq_arm.c              | 16 ++++++++--------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
index e860fb89d42e..e6e89784d84b 100644
--- a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
+++ b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
@@ -855,7 +855,7 @@ static int vidioc_enum_input(struct file *file, void *priv,
 		return -EINVAL;
 
 	inp->type = V4L2_INPUT_TYPE_CAMERA;
-	sprintf((char *)inp->name, "Camera %u", inp->index);
+	snprintf((char *)inp->name, sizeof(inp->name), "Camera %u", inp->index);
 	return 0;
 }
 
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index de6a24304a4d..9fb8f657cc78 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -1451,12 +1451,12 @@ vchiq_use_internal(struct vchiq_state *state, struct vchiq_service *service,
 	}
 
 	if (use_type == USE_TYPE_VCHIQ) {
-		sprintf(entity, "VCHIQ:   ");
+		snprintf(entity, sizeof(entity), "VCHIQ:   ");
 		entity_uc = &arm_state->peer_use_count;
 	} else if (service) {
-		sprintf(entity, "%p4cc:%03d",
-			&service->base.fourcc,
-			service->client_id);
+		snprintf(entity, sizeof(entity), "%p4cc:%03d",
+			 &service->base.fourcc,
+			 service->client_id);
 		entity_uc = &service->service_use_count;
 	} else {
 		vchiq_log_error(state->dev, VCHIQ_SUSPEND, "%s null service ptr", __func__);
@@ -1506,12 +1506,12 @@ vchiq_release_internal(struct vchiq_state *state, struct vchiq_service *service)
 	}
 
 	if (service) {
-		sprintf(entity, "%p4cc:%03d",
-			&service->base.fourcc,
-			service->client_id);
+		snprintf(entity, sizeof(entity), "%p4cc:%03d",
+			 &service->base.fourcc,
+			 service->client_id);
 		entity_uc = &service->service_use_count;
 	} else {
-		sprintf(entity, "PEER:   ");
+		snprintf(entity, sizeof(entity), "PEER:   ");
 		entity_uc = &arm_state->peer_use_count;
 	}
 
-- 
2.42.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
