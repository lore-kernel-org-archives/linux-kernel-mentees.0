Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7BD636996C
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 19 Nov 2025 13:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763557766; cv=none; b=DsP/XeDq4jZ6LTSEtI63YGeTVEzsmk87rproBnsMZ1cbrYvKifs6MW3tV9c9KFd+784u3vluM4MhSIT+4ckOyTkG1BtcaKlU97EWs5udAmEgN8yUVy6l28Ol9fMkoIFxzvfGLXPMBd9r1fN7zqCbJIoZgEXrfjS5yeyg+hN7fzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763557766; c=relaxed/simple;
	bh=NENJ76xybs+hvpDu5LJAnhejEWZeDsuvfrEqnXX6oVY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NPcB5EwsQctG8sO+/wbaI4bh5BAFywDrOSbgWKXcff6RkKzDMMKyFeTKkTUH2E0SAo+j5A67JuqFeWSaM1moGetn+wUAef6Dv0bon4PV7jwLAxomquSoHmZBrRkFpel4wd9dv6xThnjXgoyaqlO8dK1PzPHfUADqJN/8tPKpSm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B87HzUhX; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B87HzUhX"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7a9c64dfa8aso5240733b3a.3
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 19 Nov 2025 05:09:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763557764; x=1764162564; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fC/QdmI3jNw4W9z6Eomd9eORRY4agyuexEsQOqxsWWA=;
        b=B87HzUhXINYPbNYPZ8jufjCIgLILfQpE6ltf4EWtQWTtbZNC+tJdlOZiQhaV+nJiN3
         gpDS0mIAVad3Irb/gMgOmqj6i9NIlrckb9siG3jp3/Wj25Al2VMSQf9Rxf/7cZ/SR9bz
         8dBOTcmQyyhpL3SKqIJO5XVeXYVtnMP24oH+5m2iSlw9x+mVr9A1IMpLlqhOaARoexFG
         7LHK1N4WzFSqPtzVcphb0jxTwg8ON4fD4SIwU6uIGFO+nBHfSeIcNPZf/8v3qf4/V4ih
         DjnaB4+vhrhOA94cxT+aZz3+NDC/GRCd+S/gz9D17tSAqV0FMA02yPZ3amph6nnnSgd6
         /rbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763557764; x=1764162564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fC/QdmI3jNw4W9z6Eomd9eORRY4agyuexEsQOqxsWWA=;
        b=nZGGcfofNH1KATSt5fSMEFDaTwgtL5AKx7mNikg8/tT34K1WO/0JxWvwb/kAgl4MSY
         PgCg+8vpZSsQ3JAv0/+ChtUuLQ6bq+owTB3q+1FaaE/zj8IWKxzZE6dgr2ciTh584wVC
         7g14tQy4iF0ghFi2n48b5Hkg4R5dBNCvKoFo5D+If6t7Iuy8Qzxg0zHzZX2s3DpgyNyU
         viLo6PXkiUSpI+jfIl84chkguntSFFZ5nqUwUxOghQbbnZXtUYOzXZPh/Ij/r3yYwHqn
         ZB+Huui6j07ii8vQM0w1rEtJUh5spO60Rnt9KiyRir5xjEVrwTMFgC6kHiKtV9QzPa0m
         kpzg==
X-Forwarded-Encrypted: i=1; AJvYcCVsk2JbJoZFxckb8wt1gdIYEHQWCyaEokij0sPDHFSdqDHUoeNcG20M1D+fhkpkISPPbNBl1AQxPDCXNm1A+qyz/lzQAA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyYKWaeHZDwbMQtfHcmsS/G9dun0bhyUaPYJ7dkU0svtNu51L/B
	pOXE8nIpFvTmTXF/uV7dMnJBC1Zt9F3OfAlQhue4Glg5Vs1puYkvDYJs
X-Gm-Gg: ASbGncvm8yQInc5Kol0GVZn58c8p30VpghWm+Cbwkjhd70IuI9VlqsSSwuZFhEK8r8a
	QPIBYFpYzB3j3E6s0KdzW0umpNspGkB/SgTzq4N99G0nRrSkxJh3LQi+QrsZikTsrO7LlhJ7O9l
	YYK84xJoFC2c2IuG24dUtB7eTM6m671Mp8U9X/K+f6w3X9ultQ2TzyS/usFzu1m+Eet4gnbw2Ll
	zC1OmP1fxJuiSvP+RcVYgQFVc9diHUam3Iovl6RYxE+KZFwgx7AK2nksTFEKl14YHNdMGKKCK5/
	LcTeHVp0ND/V829c0IGFHc+ADluJCHv9xNTzfj1/TPoRzWxoY+vC7VB4WFlcb8Te7P7dilFGmUu
	zi5ALNShaN4vdnpnQGV7F/0b6sMCw3sqNNQUIlKQNknvZU5fPBoH0gZBMaj6FLJudADtmZD3hlF
	s8ru1RlqfoAAIVA0TwmnMHcE3fJ8GWE4sBKDdlyyAoqcHmLQ==
X-Google-Smtp-Source: AGHT+IGGI52YQzm3rmkb0PCKU2qx/iGnZ4itIPwV6h00f9wx34QXLSkuVhuOMBARGGuXkrKrRWhFng==
X-Received: by 2002:a05:6a20:6a1f:b0:35f:fafa:a198 with SMTP id adf61e73a8af0-35ffafaa648mr14108360637.10.1763557763956;
        Wed, 19 Nov 2025 05:09:23 -0800 (PST)
Received: from clint-ThinkPad-L14-Gen-2.. ([110.226.183.150])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b9250cd969sm19692422b3a.23.2025.11.19.05.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 05:09:23 -0800 (PST)
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
Subject: [PATCH 8/8] usb: gadget: dummy_hcd: fix miscellaneous coding style warnings
Date: Wed, 19 Nov 2025 18:38:40 +0530
Message-ID: <20251119130840.14309-9-clintbgeorge@gmail.com>
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

This patch addresses several minor coding style warnings in dummy_hcd.c:

- Avoid multiple line dereference (e.g, ep0->maxpacket)
- Remove unnecessary parentheses
- Remove unnecessary line continuations (\)

Signed-off-by: Clint George <clintbgeorge@gmail.com>
---
 drivers/usb/gadget/udc/dummy_hcd.c | 33 +++++++++++++++---------------
 1 file changed, 16 insertions(+), 17 deletions(-)

diff --git a/drivers/usb/gadget/udc/dummy_hcd.c b/drivers/usb/gadget/udc/dummy_hcd.c
index 1114dfe61..5b791ce2e 100644
--- a/drivers/usb/gadget/udc/dummy_hcd.c
+++ b/drivers/usb/gadget/udc/dummy_hcd.c
@@ -1423,7 +1423,7 @@ static int transfer(struct dummy_hcd *dum_hcd, struct urb *urb,
 		int		rescan = 0;
 
 		if (dummy_ep_stream_en(dum_hcd, urb)) {
-			if ((urb->stream_id != req->req.stream_id))
+			if (urb->stream_id != req->req.stream_id)
 				continue;
 		}
 
@@ -2222,8 +2222,7 @@ static int dummy_hub_control(
 						      USB_PORT_STAT_HIGH_SPEED;
 						break;
 					case USB_SPEED_LOW:
-						dum_hcd->dum->gadget.ep0->
-							maxpacket = 8;
+						dum_hcd->dum->gadget.ep0->maxpacket = 8;
 						dum_hcd->port_status |=
 							USB_PORT_STAT_LOW_SPEED;
 						break;
@@ -2434,20 +2433,20 @@ static inline ssize_t show_urb(char *buf, size_t size, struct urb *urb)
 			break;
 		 } s; }),
 		ep, ep ? (usb_urb_dir_in(urb) ? "in" : "out") : "",
-		({ char *s; \
-		switch (usb_pipetype(urb->pipe)) { \
-		case PIPE_CONTROL: \
-			s = ""; \
-			break; \
-		case PIPE_BULK: \
-			s = "-bulk"; \
-			break; \
-		case PIPE_INTERRUPT: \
-			s = "-int"; \
-			break; \
-		default: \
-			s = "-iso"; \
-			break; \
+		({ char *s;
+		switch (usb_pipetype(urb->pipe)) {
+		case PIPE_CONTROL:
+			s = "";
+			break;
+		case PIPE_BULK:
+			s = "-bulk";
+			break;
+		case PIPE_INTERRUPT:
+			s = "-int";
+			break;
+		default:
+			s = "-iso";
+			break;
 		} s; }),
 		urb->actual_length, urb->transfer_buffer_length);
 }
-- 
2.43.0

