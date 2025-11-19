Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFAEA366546
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 19 Nov 2025 13:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763557751; cv=none; b=vCDF6+9oDi8++BAJSVnIow77CqJIJf+8xGmIjfzekfOKfANvNdmkzawQVR2O4TUtz70o77rUlNu23pPm3m32tbdTHeTuUWTdNAH3ytlo9T4RZU/nDggP6pozCkKjJ8wsQaNsdMYXyDfZFZPZxsc3BP3hNyvsDChERZcxeczrHvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763557751; c=relaxed/simple;
	bh=1n9/lEWo+wlou68RzRk35UwfcIXZXKtYR2L3bmc6SqE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CnhVbzkdoXewlRq+lOvOK7iSJ4w6py9VCgS676Sgeb54I/SrBNiwIlj4MdbS0WjRUMB3MgcS5wkQ82FNbF13XrujUoGTJsr3GW5SfDiu3huFrLzRbbj4y7mnOuJ5vB0LibfnHNx6pqtPw9fu7G1PizJoTFliWH9qrLCJA0I65Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VJDnZE+e; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VJDnZE+e"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7bab7c997eeso5555865b3a.0
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 19 Nov 2025 05:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763557747; x=1764162547; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+wcMr6TKB52Xs6/sfp3QhKkSt8CaaPtbf58WfUe+edo=;
        b=VJDnZE+eH4yJQ7/6699d56ECZYOhiF63+iqYxOAiFZSBKdbMx3ULwh5OKi5IpYWgtJ
         5Q4iqkrz0T/kwJFsHFWvw9W+ootgpBh23mruhNcHqZe6x4jcqkKk1TJ29LnUKkDqQpC9
         prINkAHPK4LTs29SHKxqO+nYFmm3hxLSDAPsiaE7W8Zr7Vi4qsfF5FSdWlqOufqbITk6
         t3M9HTnyshhuFr1sO/eavMej1c38F1FOs+y8wtYly4ICEqDGiWQtH9tNRBhZO1D9fxqD
         nevY45mTtcmcZfnvxl/fxLiTLBYbeCwCskQTrhrKWHh23im3cF1mFEyLFLLljcoKHygX
         XfeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763557747; x=1764162547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+wcMr6TKB52Xs6/sfp3QhKkSt8CaaPtbf58WfUe+edo=;
        b=kVEA9kbkQL50n798e3t02kHdXTlKvbaQMk1shQqEYRoBdpv0PAMMkWnj/NxP2ru0jD
         ly918U1jfpMjnKaIQddPQUfOLwYB2hjat+2zES/cIFZK9Lxg3oOyE2yrHidofU7dVSor
         vsWqY4YqI3HLy+sehTfL3U12JA4aiXkZjtRMb4H6/QaCuYhCx8ir+0x9FWDizr0djGBX
         cdBJtU+MV6+AApg5VcBs0TBqJLsyoZI0YMTB7pCU06PoEfZ2KysKhnVhzjgHz165Ue3W
         R1HkBp1dNcOyYFAzJmwcZGBujUjOLmhd+HhffiRS4yAuiYsJ06DkFTpQ0huURhMudPJW
         39hg==
X-Forwarded-Encrypted: i=1; AJvYcCWJ/TD/SgcidKw+JsIBKJG8jYoTc16FCBwVC2POKKiJSYVlTD2q1Px1WVQGKJCdCU/ch5MSbeFTCjJe7FV12NE0TsC5jw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxkjoXo9EVhdr1MNwSWyqGZIZtnYnu4foDkWX3drHjIPIVsKAkC
	+IO9Ex39dU81xCdVz+xtT6xP/gHFtM0hAOk3JUQ1toOUBwxkZXwZvh0v
X-Gm-Gg: ASbGncuF8+aHAacaSH92axZ8RBxVNU4u4hmNtCh7x4WUt4iNuccb0k+ew4uuSV2hMt5
	M94l2jD3wNCUtuBZgrB6LQAyMOCkWdYRgKI0+uaLBAwTI7SqkWQGQeFFYkTz6cjKP0+n/vXUR5V
	sOspmxo1qvICfWrm5i6M5QLA8YKhviSG6vEDeBw3QRgJLMR0FSCjTA5qQYX2LRh79MBw7YqDVEY
	hOKqLLSZQkPHMO81N3tIqBeKYM4bR1OdwCG80K8VVNxqxHPI45TNiou4tlcQrw+wM0XR62gqN5l
	FZFLwMXxmvyMa9AdcNyFTvHI4zt3Zn2jmmgMo8duxSgMF+XJ6EH0flkKSt7l8odYFzFqjRFz8Q5
	bBoPATx3MuuNDLEsyj/zE0nIs01tb4J5Ysf9epkLq3WqeM1ZS8Vnb6wdWlikHEsWAjjlJ7CYu76
	H9P6xrilcisFKwN95rfrss1Ca+witxgTy5alE=
X-Google-Smtp-Source: AGHT+IFpgqVfTAaZmkbRivx6m6qi5k0vr4XAZes6wYiI171aYeHdU1uRz1U4vf0NMwRIcqyrSw83RA==
X-Received: by 2002:a05:6a00:2444:b0:7b2:1fb0:6da3 with SMTP id d2e1a72fcca58-7ba3c478451mr24723715b3a.24.1763557746861;
        Wed, 19 Nov 2025 05:09:06 -0800 (PST)
Received: from clint-ThinkPad-L14-Gen-2.. ([110.226.183.150])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b9250cd969sm19692422b3a.23.2025.11.19.05.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 05:09:06 -0800 (PST)
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
Subject: [PATCH 4/8] usb: gadget: dummy_hcd: fix block comments, blank lines and function braces
Date: Wed, 19 Nov 2025 18:38:36 +0530
Message-ID: <20251119130840.14309-5-clintbgeorge@gmail.com>
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

This patch updates dummy_hcd.c to follow the Linux kernel coding style:
- Align block comment asterisks properly.
- Add blank lines after variable declarations where needed.
- Remove unnecessary spaces before semicolons.
- Move opening braces of function definitions to the next line.

These changes improve readability, maintain consistency, and make the code
easier to maintain.

Signed-off-by: Clint George <clintbgeorge@gmail.com>
---
 drivers/usb/gadget/udc/dummy_hcd.c | 49 ++++++++++++++++--------------
 1 file changed, 27 insertions(+), 22 deletions(-)

diff --git a/drivers/usb/gadget/udc/dummy_hcd.c b/drivers/usb/gadget/udc/dummy_hcd.c
index 6ad366640..d4b2dcbc4 100644
--- a/drivers/usb/gadget/udc/dummy_hcd.c
+++ b/drivers/usb/gadget/udc/dummy_hcd.c
@@ -151,11 +151,11 @@ static const struct {
 	EP_INFO("ep2out-bulk",
 		USB_EP_CAPS(USB_EP_CAPS_TYPE_BULK, USB_EP_CAPS_DIR_OUT)),
 /*
-	EP_INFO("ep3in-iso",
-		USB_EP_CAPS(USB_EP_CAPS_TYPE_ISO, USB_EP_CAPS_DIR_IN)),
-	EP_INFO("ep4out-iso",
-		USB_EP_CAPS(USB_EP_CAPS_TYPE_ISO, USB_EP_CAPS_DIR_OUT)),
-*/
+ *	EP_INFO("ep3in-iso",
+ *		USB_EP_CAPS(USB_EP_CAPS_TYPE_ISO, USB_EP_CAPS_DIR_IN)),
+ *	EP_INFO("ep4out-iso",
+ *		USB_EP_CAPS(USB_EP_CAPS_TYPE_ISO, USB_EP_CAPS_DIR_OUT)),
+ */
 	EP_INFO("ep5in-int",
 		USB_EP_CAPS(USB_EP_CAPS_TYPE_INT, USB_EP_CAPS_DIR_IN)),
 	EP_INFO("ep6in-bulk",
@@ -163,11 +163,11 @@ static const struct {
 	EP_INFO("ep7out-bulk",
 		USB_EP_CAPS(USB_EP_CAPS_TYPE_BULK, USB_EP_CAPS_DIR_OUT)),
 /*
-	EP_INFO("ep8in-iso",
-		USB_EP_CAPS(USB_EP_CAPS_TYPE_ISO, USB_EP_CAPS_DIR_IN)),
-	EP_INFO("ep9out-iso",
-		USB_EP_CAPS(USB_EP_CAPS_TYPE_ISO, USB_EP_CAPS_DIR_OUT)),
-*/
+ *	EP_INFO("ep8in-iso",
+ *		USB_EP_CAPS(USB_EP_CAPS_TYPE_ISO, USB_EP_CAPS_DIR_IN)),
+ *	EP_INFO("ep9out-iso",
+ *		USB_EP_CAPS(USB_EP_CAPS_TYPE_ISO, USB_EP_CAPS_DIR_OUT)),
+ */
 	EP_INFO("ep10in-int",
 		USB_EP_CAPS(USB_EP_CAPS_TYPE_INT, USB_EP_CAPS_DIR_IN)),
 	EP_INFO("ep11in-bulk",
@@ -175,11 +175,11 @@ static const struct {
 	EP_INFO("ep12out-bulk",
 		USB_EP_CAPS(USB_EP_CAPS_TYPE_BULK, USB_EP_CAPS_DIR_OUT)),
 /*
-	EP_INFO("ep13in-iso",
-		USB_EP_CAPS(USB_EP_CAPS_TYPE_ISO, USB_EP_CAPS_DIR_IN)),
-	EP_INFO("ep14out-iso",
-		USB_EP_CAPS(USB_EP_CAPS_TYPE_ISO, USB_EP_CAPS_DIR_OUT)),
-*/
+ *	EP_INFO("ep13in-iso",
+ *		USB_EP_CAPS(USB_EP_CAPS_TYPE_ISO, USB_EP_CAPS_DIR_IN)),
+ *	EP_INFO("ep14out-iso",
+ *		USB_EP_CAPS(USB_EP_CAPS_TYPE_ISO, USB_EP_CAPS_DIR_OUT)),
+ */
 	EP_INFO("ep15in-int",
 		USB_EP_CAPS(USB_EP_CAPS_TYPE_INT, USB_EP_CAPS_DIR_IN)),
 
@@ -314,6 +314,7 @@ static inline struct dummy *ep_to_dummy(struct dummy_ep *ep)
 static inline struct dummy_hcd *gadget_to_dummy_hcd(struct usb_gadget *gadget)
 {
 	struct dummy *dum = container_of(gadget, struct dummy, gadget);
+
 	if (dum->gadget.speed == USB_SPEED_SUPER)
 		return dum->ss_hcd;
 	else
@@ -388,7 +389,7 @@ static void set_link_state_by_speed(struct dummy_hcd *dum_hcd)
 		} else {
 			/* device is connected and not suspended */
 			dum_hcd->port_status |= (USB_PORT_STAT_CONNECTION |
-						 USB_PORT_STAT_SPEED_5GBPS) ;
+						 USB_PORT_STAT_SPEED_5GBPS);
 			if ((dum_hcd->old_status &
 			     USB_PORT_STAT_CONNECTION) == 0)
 				dum_hcd->port_status |=
@@ -613,8 +614,8 @@ static int dummy_enable(struct usb_ep *_ep,
 	_ep->maxpacket = max;
 	if (usb_ss_max_streams(_ep->comp_desc)) {
 		if (!usb_endpoint_xfer_bulk(desc)) {
-			dev_err(udc_dev(dum), "Can't enable stream support on "
-					"non-bulk ep %s\n", _ep->name);
+			dev_err(udc_dev(dum), "Can't enable stream support on non-bulk ep %s\n",
+					_ep->name);
 			return -EINVAL;
 		}
 		ep->stream_en = 1;
@@ -1042,7 +1043,8 @@ static int dummy_udc_stop(struct usb_gadget *g)
 #undef is_enabled
 
 /* The gadget structure is stored inside the hcd structure and will be
- * released along with it. */
+ * released along with it.
+ */
 static void init_dummy_udc_hw(struct dummy *dum)
 {
 	int i;
@@ -1264,7 +1266,8 @@ static int dummy_urb_enqueue(
 	struct usb_hcd			*hcd,
 	struct urb			*urb,
 	gfp_t				mem_flags
-) {
+)
+{
 	struct dummy_hcd *dum_hcd;
 	struct urbp	*urbp;
 	unsigned long	flags;
@@ -1323,7 +1326,8 @@ static int dummy_urb_dequeue(struct usb_hcd *hcd, struct urb *urb, int status)
 	int		rc;
 
 	/* giveback happens automatically in timer callback,
-	 * so make sure the callback happens */
+	 * so make sure the callback happens
+	 */
 	dum_hcd = hcd_to_dummy_hcd(hcd);
 	spin_lock_irqsave(&dum_hcd->dum->lock, flags);
 
@@ -2109,7 +2113,8 @@ static int dummy_hub_control(
 	u16		wIndex,
 	char		*buf,
 	u16		wLength
-) {
+)
+{
 	struct dummy_hcd *dum_hcd;
 	int		retval = 0;
 	unsigned long	flags;
-- 
2.43.0

