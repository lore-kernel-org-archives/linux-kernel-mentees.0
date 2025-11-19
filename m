Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC32366572
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 19 Nov 2025 13:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763557753; cv=none; b=LKbqpJpS8NO8AeRsKJFDBsl8reVkVcjVjd/dYHuwFpASUvzHsiDZMVvOXjB8UYCrFS2mRPrfDRhuHcbW7uUF2C2ZJNMLxeDXLC/A3N+00knbfBOw5xO20HnZhfYDtg3i/7963ozNDGJYu6tHQ0eFMxC+oKU45u3CZaqpkNGxzrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763557753; c=relaxed/simple;
	bh=PrZRUUyTCW3e5F7Tub3IHjfsyp91NTQ3XS/2sGiYIU0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JEFDFhJKJFZitpEqh4VX5RygXn35ZX1ytBh+ym9XU/yttB5RBX7ndsKtIDzHfY/Dw4vjpJYW0YPJi36DjpiVKcSihFcym5D/pKTTfbtWiIvCHJ+0EbNHBUif6w64wDmYBvGYNmZzt52CpOV7P9Xhx/m+e094pFN3eF8+R/1vmO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kgj9aEL6; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kgj9aEL6"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7b9387df58cso3569432b3a.3
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 19 Nov 2025 05:09:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763557751; x=1764162551; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mkCQIdAzhDVpx+Df25ROecYMMLKgKqXNwwF079CDyCM=;
        b=Kgj9aEL6UjcLptq7i6k5egDdi+QvNUmtDh/cg9A4Wag5LlShP1HfjjFf2q/nsmtMTE
         dS1LXQ0lsKOQN6165XlB6OQCZKnWgMweYghqLsSuLExH04iuUSiA9FKU4Qtda9wbLeWK
         T1aXt6DEcfUcc1oad75HOfCHC1nMMvE5K3V1v0Y5etRjyR7AxpVW7YevMT20IfACpoyI
         /XlQSJPEpkW/NMRkRSShVLVUsk68eE2ubaN2T7kPgnujFJMGuGG/3obS9P0ciIrqGdaG
         9ylZL2xyVE5jnACA1WcFQf7dpw1a4SPyhpFK172LolzHB5GjaAGKwLiWZ5RSfRtfq4Mh
         n/Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763557751; x=1764162551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mkCQIdAzhDVpx+Df25ROecYMMLKgKqXNwwF079CDyCM=;
        b=TEQSgIlg6opWUxqOYo+CsMht0hTs6U+eRdr5KpqqDmVmqNVeY+bqtZrvZ0nErL7MCs
         mg+bwfd3RgENIN4X/vET19boZJ09e25/DtoylnuozpfWEmjyzJH/LUfogkSrKbSQd1B5
         ZDnFrGRt4Xk1rAZrbUub8PVjpT9O+1yYF0Az2JJcvwuncbRRoAP8ORJzpHgFgjpJh0Cy
         zBoVEYZYXJWQbZhvT+itkUcHp1C8Xm0eI8bVOY2UI+A7xgqDL2XpLbvLb+PkodIa3x8A
         KM4G4qnoVQiKxdktemEZMu3pc6sLQqFMmqp14KGdJ0YUOYhWC2Q5Gp3q6rri3+FBws+7
         1F4g==
X-Forwarded-Encrypted: i=1; AJvYcCXSu2i15i0pww6uA2jc8fcnNUJUvSDCZTBMnphI2MsinvXGO/GryUiExWHnvKZH8Bayxn8x27h0SIOnKQ8qmcJa91zc/A==@lists.linux.dev
X-Gm-Message-State: AOJu0YybHnDKEbWBxQ4wUu0T6Th/6g0k0vStbw11UDi5e1sH13K8LxNJ
	LiEfusU3mkRjS4jeo6clCy4bhIEUNT/uPk4RxeZ87REbG91CPCEysXMv
X-Gm-Gg: ASbGncs5/MiWxV2Dpqm3uNVfZppRIgK/kXVOnQBU6xPKsItE23IvJlzF0RYYjbGnOlY
	q9ZPgV7BHdC+mZDPrA4YXk7fqdEJyM5HIZ/z/AmUOw7MOOe35JncOkU06k4GLjOVtZs+hVivuTC
	Qxt168mbfTGfM6O148MCUyefabO2lPZID49PV3jHvfmtFm1BjSEJrNEOVYGO6HX8LbL47iKr5iA
	y66xTFGs/nG9fL41xvkxpbk4tF9m05o8O3hhjZ6azELgwHJwEeT0mzxKbi4YKM/llhp41vqBpyq
	oxDLguVkPIQsHGaz5WqGZrpbY7GX6/E8zinjYQ304wEWW2d4bG2rk2dNCzK6zK3h6OIErznhlow
	8ij3GBR89M+lzNByx5mm5+kOJYnLo50EE2Kh/GHvSPgjDvwnDcqM9caDdgMuDwXM3ySvFKVBsO5
	0q3KC1TlsdfnyaMMEuLI7vj4z9fihRbs8LoSuUBzeMcgI3rg==
X-Google-Smtp-Source: AGHT+IGOZoPr6lgFqZ3pubmZ547ZRImFpqA3tk7lcyuqLmzsU5M4QPECrXxxfbjSMiWNkxT9Tdebcw==
X-Received: by 2002:a05:6a20:244c:b0:35e:f436:ffb9 with SMTP id adf61e73a8af0-35ef446b99emr13775623637.4.1763557751189;
        Wed, 19 Nov 2025 05:09:11 -0800 (PST)
Received: from clint-ThinkPad-L14-Gen-2.. ([110.226.183.150])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b9250cd969sm19692422b3a.23.2025.11.19.05.09.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 05:09:10 -0800 (PST)
From: Clint George <clintbgeorge@gmail.com>
To: stern@rowland.harvard.edu,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	khalid@kernel.org,
	Clint George <clintbgeorge@gmail.com>
Subject: [PATCH 5/8] usb: gadget: dummy_hcd: merge multi-line quoted strings into one line
Date: Wed, 19 Nov 2025 18:38:37 +0530
Message-ID: <20251119130840.14309-6-clintbgeorge@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119130840.14309-1-clintbgeorge@gmail.com>
References: <20251119130840.14309-1-clintbgeorge@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Merge multi-line quoted strings into a single line to improve readability
and comply with kernel coding style. This reduces unnecessary line
breaks in string literals and makes the code easier to follow.

Signed-off-by: Clint George <clintbgeorge@gmail.com>
---
 drivers/usb/gadget/udc/dummy_hcd.c | 27 +++++++++------------------
 1 file changed, 9 insertions(+), 18 deletions(-)

diff --git a/drivers/usb/gadget/udc/dummy_hcd.c b/drivers/usb/gadget/udc/dummy_hcd.c
index d4b2dcbc4..1363de6fe 100644
--- a/drivers/usb/gadget/udc/dummy_hcd.c
+++ b/drivers/usb/gadget/udc/dummy_hcd.c
@@ -2133,8 +2133,7 @@ static int dummy_hub_control(
 		case USB_PORT_FEAT_SUSPEND:
 			if (hcd->speed == HCD_USB3) {
 				dev_dbg(dummy_dev(dum_hcd),
-					 "USB_PORT_FEAT_SUSPEND req not "
-					 "supported for USB 3.0 roothub\n");
+					 "USB_PORT_FEAT_SUSPEND req not supported for USB 3.0 roothub\n");
 				goto error;
 			}
 			if (dum_hcd->port_status & USB_PORT_STAT_SUSPEND) {
@@ -2174,8 +2173,7 @@ static int dummy_hub_control(
 				(wLength < USB_DT_SS_HUB_SIZE ||
 				 wValue != (USB_DT_SS_HUB << 8))) {
 			dev_dbg(dummy_dev(dum_hcd),
-				"Wrong hub descriptor type for "
-				"USB 3.0 roothub.\n");
+				"Wrong hub descriptor type for USB 3.0 roothub.\n");
 			goto error;
 		}
 		if (hcd->speed == HCD_USB3)
@@ -2247,8 +2245,7 @@ static int dummy_hub_control(
 		case USB_PORT_FEAT_LINK_STATE:
 			if (hcd->speed != HCD_USB3) {
 				dev_dbg(dummy_dev(dum_hcd),
-					 "USB_PORT_FEAT_LINK_STATE req not "
-					 "supported for USB 2.0 roothub\n");
+					 "USB_PORT_FEAT_LINK_STATE req not supported for USB 2.0 roothub\n");
 				goto error;
 			}
 			/*
@@ -2261,8 +2258,7 @@ static int dummy_hub_control(
 			/* TODO: add suspend/resume support! */
 			if (hcd->speed != HCD_USB3) {
 				dev_dbg(dummy_dev(dum_hcd),
-					 "USB_PORT_FEAT_U1/2_TIMEOUT req not "
-					 "supported for USB 2.0 roothub\n");
+					 "USB_PORT_FEAT_U1/2_TIMEOUT req not supported for USB 2.0 roothub\n");
 				goto error;
 			}
 			break;
@@ -2270,8 +2266,7 @@ static int dummy_hub_control(
 			/* Applicable only for USB2.0 hub */
 			if (hcd->speed == HCD_USB3) {
 				dev_dbg(dummy_dev(dum_hcd),
-					 "USB_PORT_FEAT_SUSPEND req not "
-					 "supported for USB 3.0 roothub\n");
+					 "USB_PORT_FEAT_SUSPEND req not supported for USB 3.0 roothub\n");
 				goto error;
 			}
 			if (dum_hcd->active) {
@@ -2298,8 +2293,7 @@ static int dummy_hub_control(
 			/* Applicable only for USB3.0 hub */
 			if (hcd->speed != HCD_USB3) {
 				dev_dbg(dummy_dev(dum_hcd),
-					 "USB_PORT_FEAT_BH_PORT_RESET req not "
-					 "supported for USB 2.0 roothub\n");
+					 "USB_PORT_FEAT_BH_PORT_RESET req not supported for USB 2.0 roothub\n");
 				goto error;
 			}
 			fallthrough;
@@ -2347,8 +2341,7 @@ static int dummy_hub_control(
 	case GetPortErrorCount:
 		if (hcd->speed != HCD_USB3) {
 			dev_dbg(dummy_dev(dum_hcd),
-				 "GetPortErrorCount req not "
-				 "supported for USB 2.0 roothub\n");
+				 "GetPortErrorCount req not supported for USB 2.0 roothub\n");
 			goto error;
 		}
 		/* We'll always return 0 since this is a dummy hub */
@@ -2357,8 +2350,7 @@ static int dummy_hub_control(
 	case SetHubDepth:
 		if (hcd->speed != HCD_USB3) {
 			dev_dbg(dummy_dev(dum_hcd),
-				 "SetHubDepth req not supported for "
-				 "USB 2.0 roothub\n");
+				 "SetHubDepth req not supported for USB 2.0 roothub\n");
 			goto error;
 		}
 		break;
@@ -2601,8 +2593,7 @@ static int dummy_alloc_streams(struct usb_hcd *hcd, struct usb_device *udev,
 			goto out;
 		}
 		if (max_stream < ret_streams) {
-			dev_dbg(dummy_dev(dum_hcd), "Ep 0x%x only supports %u "
-					"stream IDs.\n",
+			dev_dbg(dummy_dev(dum_hcd), "Ep 0x%x only supports %u stream IDs.\n",
 					eps[i]->desc.bEndpointAddress,
 					max_stream);
 			ret_streams = max_stream;
-- 
2.43.0

