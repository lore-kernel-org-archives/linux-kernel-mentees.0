Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4733A2773D9
	for <linux-kernel-mentees@lists.linux.dev>; Mon,  1 Dec 2025 20:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764621459; cv=none; b=P/CrengM7gIxOxM3dLmH9hA6gRLUIjUFHWDnCDxLBVUb0qOZTLBX8GfDQ1Rcq2VkfDLVg1vx2LSA75ZbVFZ9LgInXJU42407BxLUWKsTnrpYalT95d1f8dqBMrO72F+6S/zcaAJZaAsafDo57tDbRPyuui9Fd/wH58HKYVHZ0qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764621459; c=relaxed/simple;
	bh=2OV1vA17nQisqkFji+r6uSJUsr6kObVd34VeE1DNE2A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T6gszWLjnbSK+bHENNDmLVJJ5OSX1UbqIU4IbFseFcR1zA4BAuGybSDSO2Gm6j7Xyvqk8r8Qf1MPihSZdtp44N1WVB1cKswWwuLCAuM6IBJvN5rBxLFPTFniDqdpYMjmcDsvwukz8iGlHzpmG8rOwGd71WPS+qjr8BBunqz8UrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YIT+hADv; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YIT+hADv"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3436cbb723fso3893918a91.2
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 01 Dec 2025 12:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764621458; x=1765226258; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F4ycNkEEiF97kKkbGcrEYiUPA5+jyVCF2v146XXFMKA=;
        b=YIT+hADvurBVxbSQpP3qXY2GnP9Q6p8t9D2K9oKIWcyAB8OdsKoMcEvSRGQp9HmVmt
         GbcTj+X+wKOJo9+S4Dlj0M7f2aqFzTxwmtgE/HU0kqghJVhS4Q/40BSZxnBUDrsQYuwf
         KyIZyhTMDILnpRvW4U4mz0mT3qqaNfVanoluBMEQKdMPu+DNcF8zpX55J/WyjQXYWWOx
         bUK5H4kyYmuNP0i7KmDuVrHWTf2wubWk8Ji8w/bWZjTSNVj3ApblSTn28o+Dp1jSb9AU
         /rzV0RrbIVkYK+6XvmPgx2FKU4KUJPHmYp5l6OgGKx9+iS/qqDdI9LNKwxvqL1ETUOvY
         r62A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764621458; x=1765226258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F4ycNkEEiF97kKkbGcrEYiUPA5+jyVCF2v146XXFMKA=;
        b=TuBbc/YGOQqke/U6enKloyUGE4DqZ5MvYxwq2eLtHtnTtndgzgysJoRG2vR31yWWIk
         rlyiPXh5C8/mx7OPYF30CF8fgf8bWAhHjGGLu6iHOwpSvWp0U7GsuqZDYOBnfhlnSWEH
         akXVDedul0CbQVugYvKUgIyJITA9ii/hcZRJCW8iQLk9jrBk5UFNrZSCWndDKkbtq7NI
         nMMbObkrWymaxFYMoRDLeWkyTU5RJszVTn2B1Ja4KDKlxaKarfhOLYLTAUlqnaMvV0s+
         e/eC45/DZ9ytIIJCPSGlPn1oH/96NdqQ06d+Ay52D3fsLctrTrgl93WF06p+YY0Op38n
         64wg==
X-Forwarded-Encrypted: i=1; AJvYcCWSibzjSOpr9gc5CJ8GgJVAR7fdMUgD3KSRp0m42gv9hY3G6jz+d96VfYdU4mgDLOoRgVSmSIUCavBgztxecNuIsCLJtg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyz1NQxUcIFYpKrF042EPF6+nhjemVfoTvhJb/RJTvp3puHv0Jc
	nsh13sXG9glxxUd0+dtA16tJ8ZP7nKBmVP8/J0dcaCavIeod3JktpKFQ
X-Gm-Gg: ASbGnctLifiAae9CpZeyVuELQcB5ac6jo9DZNOLrE7k5JwKnVBUXfNLVSmjKpqr7gdt
	XPW32gAAlxS3UBzYd3+/tpgwvC4822jjOvB2Mm0/IYme9P9quDnxTxlfka0uc77JPBVECYV9cQK
	g+8VBo0W1Ez3qXh+0JZVH00/OSzbYTVKtaa6hjcJNEzZMndtKXogyImYVfp8DhEDgFQO5EhLPQn
	UePKpJH49Id9RA0Jkx3sohFrigeZ8LR7aElp56DQQbua+Q9y9rSeJmSV94fKQEhwvi2j5OYcWEC
	FEyraW7jPmQ6HAJnXJq9PDv/oSqtNW9iwfaio9TUL7JxIgjUCR+f5xS/WrBnkTFLtk0/PnlMEOT
	7+2IU75MiG4X2j+2FOhOJECb/QLoGOEO3IV3PfcbWQlMjUjUDy7NmJzeyP3WWtyF8wwyucGY9f/
	ZbIfawFsTW60kayrUBctwSaNGKpQ9DcD9198duJevCh/OzFQ==
X-Google-Smtp-Source: AGHT+IEtZwyJ1h84xNpSd8cwSnswEJ6N/+iIfdUSDQxIm5UJsYL1XcBZqW6zMMJ2pg+7syQbAsGqDA==
X-Received: by 2002:a17:90b:2547:b0:341:88c9:ca62 with SMTP id 98e67ed59e1d1-3475ed6a904mr28534111a91.31.1764621457573;
        Mon, 01 Dec 2025 12:37:37 -0800 (PST)
Received: from clint-ThinkPad-L14-Gen-2.. ([110.226.177.250])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-be4fb248be1sm13113892a12.3.2025.12.01.12.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 12:37:37 -0800 (PST)
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
Subject: [PATCH v2 3/6] usb: gadget: dummy_hcd: document ISO endpoint allocation pattern
Date: Tue,  2 Dec 2025 02:07:12 +0530
Message-ID: <20251201203715.17768-4-clintbgeorge@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251201203715.17768-1-clintbgeorge@gmail.com>
References: <20251119130840.14309-1-clintbgeorge@gmail.com>
 <20251201203715.17768-1-clintbgeorge@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove commented-out ISO definition and add relevant comment documenting
the ISO endpoint allocation pattern.
---
 drivers/usb/gadget/udc/dummy_hcd.c | 22 +++++-----------------
 1 file changed, 5 insertions(+), 17 deletions(-)

diff --git a/drivers/usb/gadget/udc/dummy_hcd.c b/drivers/usb/gadget/udc/dummy_hcd.c
index 39b571899..e4124838e 100644
--- a/drivers/usb/gadget/udc/dummy_hcd.c
+++ b/drivers/usb/gadget/udc/dummy_hcd.c
@@ -151,35 +151,23 @@ static const struct {
 	EP_INFO("ep2out-bulk",
 		USB_EP_CAPS(USB_EP_CAPS_TYPE_BULK, USB_EP_CAPS_DIR_OUT)),
 /*
-	EP_INFO("ep3in-iso",
-		USB_EP_CAPS(USB_EP_CAPS_TYPE_ISO, USB_EP_CAPS_DIR_IN)),
-	EP_INFO("ep4out-iso",
-		USB_EP_CAPS(USB_EP_CAPS_TYPE_ISO, USB_EP_CAPS_DIR_OUT)),
-*/
+ *	If dummy-hcd supported isochronous transfers:
+ *	- Endpoints 3 and 4 would be ISO IN/OUT respectively
+ *	- Endpoints 8 and 9 would be ISO IN/OUT respectively
+ *	- Endpoints 13 and 14 would be ISO IN/OUT respectively
+ */
 	EP_INFO("ep5in-int",
 		USB_EP_CAPS(USB_EP_CAPS_TYPE_INT, USB_EP_CAPS_DIR_IN)),
 	EP_INFO("ep6in-bulk",
 		USB_EP_CAPS(USB_EP_CAPS_TYPE_BULK, USB_EP_CAPS_DIR_IN)),
 	EP_INFO("ep7out-bulk",
 		USB_EP_CAPS(USB_EP_CAPS_TYPE_BULK, USB_EP_CAPS_DIR_OUT)),
-/*
-	EP_INFO("ep8in-iso",
-		USB_EP_CAPS(USB_EP_CAPS_TYPE_ISO, USB_EP_CAPS_DIR_IN)),
-	EP_INFO("ep9out-iso",
-		USB_EP_CAPS(USB_EP_CAPS_TYPE_ISO, USB_EP_CAPS_DIR_OUT)),
-*/
 	EP_INFO("ep10in-int",
 		USB_EP_CAPS(USB_EP_CAPS_TYPE_INT, USB_EP_CAPS_DIR_IN)),
 	EP_INFO("ep11in-bulk",
 		USB_EP_CAPS(USB_EP_CAPS_TYPE_BULK, USB_EP_CAPS_DIR_IN)),
 	EP_INFO("ep12out-bulk",
 		USB_EP_CAPS(USB_EP_CAPS_TYPE_BULK, USB_EP_CAPS_DIR_OUT)),
-/*
-	EP_INFO("ep13in-iso",
-		USB_EP_CAPS(USB_EP_CAPS_TYPE_ISO, USB_EP_CAPS_DIR_IN)),
-	EP_INFO("ep14out-iso",
-		USB_EP_CAPS(USB_EP_CAPS_TYPE_ISO, USB_EP_CAPS_DIR_OUT)),
-*/
 	EP_INFO("ep15in-int",
 		USB_EP_CAPS(USB_EP_CAPS_TYPE_INT, USB_EP_CAPS_DIR_IN)),
 
-- 
2.43.0

